resource "azurerm_application_gateway" "chat_app_waf" {
  name                = "${var.prefix}-waf"
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
    backend_addresses {
      fqdn = "${var.backend_service_name}.${var.backend_service_domain}"
    }
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
  web_application_firewall_configuration {
    enabled = true
    firewall_mode = "Prevention"
    rule_set_type = "OWASP"
    rule_set_version = "3.2"
  }
}

resource "azurerm_public_ip" "chat_app_public_ip" {
  name                = "${var.prefix}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

output "waf_id" {
  value = azurerm_application_gateway.chat_app_waf.id
}