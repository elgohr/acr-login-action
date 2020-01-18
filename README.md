# ACR-Login-Action

[![Actions Status](https://github.com/elgohr/acr-login-action/workflows/Test/badge.svg)](https://github.com/elgohr/acr-login-action/actions)

This Action for Docker logs into [Microsoft Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry/) and gets the timely bound credentials for Docker.

## Usage

## Example pipeline

```yaml
name: Publish Docker
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Login to ACR
      id: ecr
      uses: elgohr/acr-login-action@master
      with:
        service_principal: ${{ secrets.ACR_PRINCIPAL }}
        service_principal_password: ${{ secrets.ACR_PRINCIPAL_PASSWORD }}
        tenant: ${{ secrets.TENANT }}
        registry: ${{ secrets.REGISTRY }}
        repository: ${{ secrets.REPOSITORY }}
    - name: Publish to Registry
      uses: elgohr/Publish-Docker-Github-Action@master
      with:
        name: myDocker/repository
        username: ${{ steps.ecr.outputs.username }}
        password: ${{ steps.ecr.outputs.password }}
        registry: ${{ secrets.REPOSITORY }}
```

## Mandatory arguments

`service_principal` is the ACR service principal to use for login  
`service_principal_password` is the password of the service principal  
`tenant` the tenant to use for login  
`registry` the ACR registry to use  
`repository` the ACR repository to use  

## Outputs
`username` the username for logging in  
`password` the password for logging in  
