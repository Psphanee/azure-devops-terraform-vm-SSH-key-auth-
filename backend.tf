terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }


  backend "azurerm" {
    # Either fill these values or pass via terraform init -backend-config
    resource_group_name  = "<BACKEND_RG_NAME>"
    storage_account_name = "<BACKEND_SA_NAME>"
    container_name       = "<BACKEND_CONTAINER>"
    key                  = "terraform.tfstate"
  }
}
