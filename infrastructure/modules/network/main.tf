resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "hub_subnet" {
  name                 = var.hub_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.hub_subnet_address_prefix]
}

resource "azurerm_subnet" "spoke_subnet" {
  count                = var.spoke_count
  name                 = "${var.spoke_subnet_name_prefix}-${count.index}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [element(var.spoke_subnet_address_prefixes, count.index)]
}

resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                           = var.hub_to_spoke_peering_name
  resource_group_name            = azurerm_resource_group.rg.name
  virtual_network_name           = azurerm_virtual_network.vnet.name
  remote_virtual_network_id      = azurerm_virtual_network.vnet.id
  allow_virtual_network_access    = true
  allow_forwarded_traffic        = true
  allow_gateway_transit          = false
  use_remote_gateways            = false
}



output "hub_subnet_id" {
  value = azurerm_subnet.hub_subnet.id
}

output "spoke_subnet_ids" {
  value = azurerm_subnet.spoke_subnet[*].id
}