variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  
}

variable "location" {
  description = "The location for the resources"
  type        = string
}


variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "spoke_count" {
  description = "The number of spoke subnets"
  type        = number
}
variable "spoke_subnet_name_prefix" {
  description = "The prefix for the spoke subnet names"
  type        = string
}
variable "spoke_subnet_address_prefixes" {
  description = "The address prefixes for the spoke subnets"
  type        = list(string)
}
variable "hub_to_spoke_peering_name" {
  description = "The name of the hub to spoke peering"
  type        = string
}
variable "hub_subnet_address_prefix" {
  description = "The address prefix for the hub subnet"
  type        = string
}

variable "hub_subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = string
}

variable "hub_location" {
  description = "The location for the hub network"
  type        = string
}

variable "spoke_location" {
  description = "The location for the spoke network"
  type        = string
}

variable "hub_subnet_prefix" {
  description = "The address prefix for the hub subnet"
  type        = string
}

variable "spoke_subnet_prefix" {
  description = "The address prefix for the spoke subnet"
  type        = string
}

variable "waf_policy_name" {
  description = "The name of the WAF policy"
  type        = string
}

variable "waf_policy_location" {
  description = "The location for the WAF policy"
  type        = string
}