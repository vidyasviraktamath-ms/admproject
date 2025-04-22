resource "azurerm_container_group" "chat_app" {
  name                = var.container_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"

  container {
    name   = var.container_name
    image  = var.container_image
    cpu    = var.cpu
    memory = var.memory

    environment_variables = {
      "AZURE_ML_ENDPOINT" = var.azure_ml_endpoint
      "AZURE_ML_KEY"      = var.azure_ml_key
    }

    ports {
      port     = var.container_port
      protocol = "TCP"
    }
  }

  tags = var.tags
}