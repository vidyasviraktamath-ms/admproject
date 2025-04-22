output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "subnet_ids" {
  value = azurerm_subnet.main.*.id
}

output "hub_vnet_address_space" {
  value = azurerm_virtual_network.hub.address_space
}

output "spoke_vnet_address_space" {
  value = azurerm_virtual_network.spoke.address_space
}