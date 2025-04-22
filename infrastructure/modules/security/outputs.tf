

output "waf_name" {
  value = azurerm_web_application_firewall.example.name
}

output "waf_endpoint" {
  value = azurerm_web_application_firewall.example.endpoint
}

output "security_group_id" {
  value = azurerm_network_security_group.example.id
}

output "security_group_name" {
  value = azurerm_network_security_group.example.name
}