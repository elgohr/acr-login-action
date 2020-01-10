#!/usr/bin/env bash
set -e

echo "::add-mask::${INPUT_SERVICE_PRINCIPAL_PASSWORD}"
az login --service-principal -u ${INPUT_SERVICE_PRINCIPAL} -p ${INPUT_SERVICE_PRINCIPAL_PASSWORD} --tenant ${INPUT_TENANT}

authTokenOutput=$(az acr token create -n 'github-actions-token' -r ${INPUT_REGISTRY} --repository ${INPUT_REPOSITORY} content/read content/write)
USERNAME=$(echo "$authTokenOutput" | jq -r '.credentials.username')
PASSWORD=$(echo "$authTokenOutput" | jq -r '.credentials.passwords[0].value')

echo "::set-output name=username::${USERNAME}"
echo "::add-mask::${PASSWORD}"
echo "::set-output name=password::${PASSWORD}"
