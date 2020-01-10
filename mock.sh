#!/bin/sh

PARAMETERS="$@" 
if [ "${1}" = "login" ]; then
  if [ "${PARAMETERS}" != "login --service-principal -u PRINCIPAL -p AZURE_PASSWORD --tenant TENANT" ]; then
    echo "login didn't match: ${PARAMETERS}"
    exit 1
  fi
else
  if [ "${PARAMETERS}" != "acr token create -n github-actions-token -r REGISTRY --repository REPOSITORY content/read content/write" ]; then
    echo "token create didn't match: ${PARAMETERS}"
  fi
  echo '{
  "creationDate": "2019-10-22T00:15:34.066221+00:00",
  "credentials": {
    "certificates": [],
    "passwords": [
      {
        "creationTime": "2019-10-22T00:15:52.837651+00:00",
        "expiry": null,
        "name": "password1",
        "value": "PASSWORD"
      },
      {
        "creationTime": "2019-10-22T00:15:52.837651+00:00",
        "expiry": null,
        "name": "password2",
        "value": "kPX6Or/LXpqowkA0idwLtm"
      }
    ],
    "username": "USERNAME"
  },
  "id": "/subscriptions/adbd-4cb4-c864/resourceGroups/myresourcegroup/providers/Microsoft.ContainerRegistry/registries/myregistry/tokens/MyToken",
  "name": "MyToken",
  "objectId": null,
  "provisioningState": "Succeeded",
  "resourceGroup": "myresourcegroup",
  "scopeMapId": "/subscriptions/adbd-4cb4-c864/resourceGroups/myresourcegroup/providers/Microsoft.ContainerRegistry/registries/myregistry/scopeMaps/MyToken-scope-map",
  "status": "enabled",
  "type": "Microsoft.ContainerRegistry/registries/tokens"
  }'
fi
