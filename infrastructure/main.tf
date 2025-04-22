provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "stgactadm123"
    container_name       = "backendstg"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "chat_app_rg" {
  name     = "chat-app-rg"
  location = "East US"
}

module "network" {
  source              = "./infrastructure/modules/network"
  resource_group_name = azurerm_resource_group.chat_app_rg.name
}

module "compute" {
  source              = "./infrastructure/modules/compute"
  resource_group_name = azurerm_resource_group.chat_app_rg.name
}

module "security" {
  source              = "./infrastructure/modules/security"
  resource_group_name = azurerm_resource_group.chat_app_rg.name
}