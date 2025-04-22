variable "waf_name" {
  description = "The name of the Web Application Firewall"
  type        = string
}

variable "location" {
  description = "The location where the WAF will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the WAF will be deployed"
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier of the Web Application Firewall"
  type        = string
  default     = "Standard_v2"
}
variable "waf_resource_group" {
  description = "The resource group where the WAF will be deployed"
  type        = string
}

variable "waf_sku" {
  description = "The SKU of the Web Application Firewall"
  type        = string
  default     = "WAF_v2"
}

variable "waf_enabled" {
  description = "Enable or disable the Web Application Firewall"
  type        = bool
  default     = true
}

variable "waf_rule_set_type" {
  description = "The type of rule set to use for the WAF"
  type        = string
  default     = "OWASP"
}

variable "waf_rule_set_version" {
  description = "The version of the rule set to use for the WAF"
  type        = string
  default     = "3.2"
}

variable "application_gateway_name" {
  description = "The name of the Application Gateway"
  type        = string
}

variable "application_gateway_sku" {
  description = "The SKU of the Application Gateway"
  type        = string
  default     = "Standard_v2"
}

variable "application_gateway_capacity" {
  description = "The capacity of the Application Gateway"
  type        = number
  default     = 2
}