output "frontend_ip" {
  value = azurerm_public_ip.frontend_ip.ip_address
}

output "backend_ip" {
  value = azurerm_public_ip.backend_ip.ip_address
}

output "waf_id" {
  value = azurerm_web_application_firewall.waf.id
}

output "container_instance_id" {
  value = azurerm_container_group.chat_app.id
}