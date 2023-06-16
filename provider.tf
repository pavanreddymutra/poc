
terraform {
  backend "azurerm" {
    storage_account_name = "assignment989"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
    resource_group_name  = "NetworkWatcherRG"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

