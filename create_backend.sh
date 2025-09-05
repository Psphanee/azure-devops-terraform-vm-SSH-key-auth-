#!/usr/bin/env bash
set -euo pipefail


# Usage: ./create_backend.sh <resource-group> <location> <storage-account-name> <container-name>
RG=${1:-tfstate-rg}
LOCATION=${2:-eastus}
SA_NAME=${3:-tfstate$(date +%s | sha256sum | head -c 10)}
CONTAINER=${4:-tfstate}


echo "Creating resource group: $RG in $LOCATION"
az group create -n "$RG" -l "$LOCATION"


echo "Creating storage account: $SA_NAME"
az storage account create -n "$SA_NAME" -g "$RG" -l "$LOCATION" --sku Standard_LRS --kind StorageV2


KEY=$(az storage account keys list -g "$RG" -n "$SA_NAME" --query '[0].value' -o tsv)


echo "Creating container: $CONTAINER"
az storage container create --account-name "$SA_NAME" --account-key "$KEY" -n "$CONTAINER"


echo "Backend storage created. Set these values in pipeline or backend.tf:"
echo " BACKEND_RESOURCE_GROUP=$RG"
echo " BACKEND_SA_NAME=$SA_NAME"
echo " BACKEND_CONTAINER=$CONTAINER"