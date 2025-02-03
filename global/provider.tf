terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "52a66bfd-d3d0-4ff3-a4a6-ff39e7ae6dc7"
}
