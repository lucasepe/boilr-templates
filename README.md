# [Boilr](https://github.com/lucasepe/boilr) Templates

This repository contains [`boilr`](https://github.com/lucasepe/boilr) templates. 

## How to use the templates

### 1. Grab a [`boilr`](https://github.com/lucasepe/boilr) release

Install the [pre-compiled binary](https://github.com/lucasepe/boilr/releases) or compile from source:

```sh
$  go install github.com/lucasepe/boilr@latest
```

### 2. Clone this repository

```sh
$ git clone https://github.com/lucasepe/boilr-templates.git
```

## Templates

### [Crossplane](https://crossplane.io) provider template 

**Env Vars**

| Name          | Description
|:--------------|:----------------------------------|
| REGISTRY      | Container Registry                |
| ORG           | Git Repo Organization or Username |
| VENDOR        | Vendor name                       |
| NAME          | Provider Name                     |
| API_GROUP     | Managed Resource Api Group        |
| RESOURCE_NAME | Managed Resource Name             |

example (file _provider-destiny2.env_):

```properties
REGISTRY=ghcr.io
ORG=lucasepe
VENDOR="Luca Sepe"
NAME=destiny2
RESOURCE_NAME=GuardianEquipment
API_GROUP=destiny2.example.io
````
