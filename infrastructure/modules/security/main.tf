resource "azurerm_application_gateway" "chat_app_waf" {
  name                = "chat-waf"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }
  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = azurerm_subnet.chat_app_subnet.id
  }
  frontend_ip_configuration {
    name                 = "appGatewayFrontendIP"
    public_ip_address_id = azurerm_public_ip.chat_app_public_ip.id
  }
  frontend_port {
    name = "appGatewayFrontendPort"
    port = 80
  }
  backend_address_pool {
    name = "appGatewayBackendPool"
    # Removed unsupported backend_address block
  }
  
  backend_http_settings {
    name                  = "appGatewayBackendHttpSettings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }
  http_listener {
    name                           = "appGatewayHttpListener"
    frontend_ip_configuration_name = "appGatewayFrontendIP"
    frontend_port_name             = "appGatewayFrontendPort"
    protocol                       = "Http"
  }
  request_routing_rule {
    name                       = "appGatewayRoutingRule"
    rule_type                 = "Basic"
    http_listener_name        = "appGatewayHttpListener"
    backend_address_pool_name = "appGatewayBackendPool"
    backend_http_settings_name = "appGatewayBackendHttpSettings"
  }
}

resource "azurerm_public_ip" "chat_app_public_ip" {
  name                = "adm-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_web_application_firewall_policy" "chat_app_waf_policy" {
  name                = "chat-app-waf-policy"
  location            = var.location
  resource_group_name = var.resource_group_name
  #custom_rules        = []
  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }
}

output "waf_id" {
  value = azurerm_application_gateway.chat_app_waf.id
}