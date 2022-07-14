apiVersion: meta.pkg.crossplane.io/v1alpha1
kind: Provider
metadata:
  name: provider-typeform
  annotations:
    meta.crossplane.io/source: github.com/${ORG,,}/provider-${NAME,,}
    meta.crossplane.io/license: Apache-2.0
    meta.crossplane.io/description: |
      A Crossplane Provider for ${NAME,,}.

spec:
  controller:
    image: ${REGISTRY}/provider-${NAME,,}-controller:VERSION
