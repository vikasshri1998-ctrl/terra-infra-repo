terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.56.0"
    }
    
  }
  backend "azurerm" {
    resource_group_name = ""
    storage_account_name = ""
    container_name = ""
    key = ""
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e0c49b68-07f3-464c-a740-d92faf4c3670"
}