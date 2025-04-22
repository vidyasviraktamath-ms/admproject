variable "resource_group_name" {
  description = "The name of the resource group where all resources will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
  default     = "East US"
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan for the chat application."
  type        = string
}

variable "client_id" {
  description = "The client ID for the Azure Active Directory application."
  type        = string
}
variable "client_secret" {
  description = "The client secret for the Azure Active Directory application."
  type        = string
}
variable "tenant_id" {
  description = "The tenant ID for the Azure Active Directory application."
  type        = string
}
variable "subscription_id" {
  description = "The subscription ID for the Azure account."
  type        = string
}

variable "container_instance_name" {
  description = "The name of the Azure Container Instance for the chat application."
  type        = string
}

variable "waf_policy_name" {
  description = "The name of the Web Application Firewall policy."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet within the virtual network."
  type        = string
}

variable "private_endpoint_name" {
  description = "The name of the private endpoint for Azure Machine Learning."
  type        = string
}

variable "llm_model_name" {
  description = "The name of the LLM model to be used."
  type        = string
}