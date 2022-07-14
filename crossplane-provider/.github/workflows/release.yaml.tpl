name: release

on:
  push:
    tags: [ '*' ]

env:
  REGISTRY: ${REGISTRY}

jobs:
  package:
    runs-on: ubuntu-20.04
    permissions:
      packages: write
      contents: read

    steps:
      - name: Checkout
        uses: actions/checkout@v3
      
      - name: Extract Version
        id: tagger
        run: |
          echo "##[set-output name=version;]v$${GITHUB_REF#$"refs/tags/v"}"
          echo "##[set-output name=version_tag;]$${GITHUB_REPOSITORY}-controller:v$${GITHUB_REF#$"refs/tags/v"}"

      - name: Print Version
        run: |
          echo $${{steps.tagger.outputs.version_tag}}
          echo $${{steps.tagger.outputs.version}}

      - name: Replace VERSION in crossplane.yaml
        run: sed -i 's/VERSION/$${{steps.tagger.outputs.version}}/g' package/crossplane.yaml
      
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v2

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Login to CR
        uses: docker/login-action@v2
        with:
          registry: $${{ env.REGISTRY }}
          username: $${{ github.repository_owner }}
          password: $${{ secrets.GITHUB_TOKEN }}
        
      - name: Build and push
        id: docker_build
        uses: docker/build-push-action@v2
        with:
          push: true
          platforms: linux/amd64
          tags: $${{ env.REGISTRY }}/$${{steps.tagger.outputs.version_tag}}
          build-args: |
            $${{steps.tagger.outputs.version}}
      
      - name: Build xpkg
        uses: crossplane-contrib/xpkg-action@master
        with:
          channel: $${{ github.event.inputs.channel }}
          version: $${{ github.event.inputs.version }}
          command: build provider -f package --name=$${{ github.event.repository.name }}
        
      - name: Push xpkg
        uses: crossplane-contrib/xpkg-action@master
        with:
          command: push provider -f package/$${{ github.event.repository.name }}.xpkg ghcr.io/$${GITHUB_REPOSITORY}:$${{steps.tagger.outputs.version}}