output "container_instance_id" {
  value = azurerm_container_group.chat_app.id
}

output "container_instance_ip" {
  value = azurerm_container_group.chat_app.ip_address
}

output "container_instance_fqdn" {
  value = azurerm_container_group.chat_app.fqdn
}