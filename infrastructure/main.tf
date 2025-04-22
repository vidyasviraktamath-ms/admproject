

provider "azurerm" {
  features {}
  client_id       = Sys.getenv("ARM_CLIENT_ID")
  client_secret   = Sys.getenv("ARM_CLIENT_SECRET")
  tenant_id       = Sys.getenv("ARM_TENANT_ID")
  subscription_id = Sys.getenv("ARM_SUBSCRIPTION_ID")
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
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.chat_app_rg.name
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.chat_app_rg.name
}

module "security" {
  source              = "./modules/security"
  resource_group_name = azurerm_resource_group.chat_app_rg.name
}