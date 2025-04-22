variable "container_name" {
  description = "The name of the Azure Container Instance for the chat application."
  type        = string
}

variable "cpu_cores" {
  description = "The number of CPU cores for the Azure Container Instance."
  type        = number
  default     = 1
}

variable "memory_gb" {
  description = "The amount of memory (in GB) for the Azure Container Instance."
  type        = number
  default     = 1.5
}

variable "image" {
  description = "The Docker image to be used for the Azure Container Instance."
  type        = string
}

variable "environment_variables" {
  description = "A map of environment variables to be passed to the container."
  type        = map(string)
  default     = {}
}

variable "restart_policy" {
  description = "The restart policy for the Azure Container Instance."
  type        = string
  default     = "Always"
}

variable "location" {
  description = "The Azure region where the container instance will be deployed."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group where the container instance will be deployed."
  type        = string
}
variable "container_group_name" {
  description = "The name of the Azure Container Group."
  type        = string
}
variable "container_port" {
  description = "The port on which the container will listen."
  type        = number
}
variable "tags" {
  description = "A map of tags to assign to the Azure Container Instance."
  type        = map(string)
  default     = {}
}
variable "azure_ml_endpoint" {
  description = "The endpoint for the Azure Machine Learning service."
  type        = string
}
variable "azure_ml_key" {
  description = "The key for the Azure Machine Learning service."
  type        = string
}
variable "container_image"{
  description = "The Docker image for the container."
  type        = string
  default     = "mcr.microsoft.com/azureml/openmpi3.1.2-ubuntu18.04:20230301.v1"
  
}
variable "cpu"{
  description = "The number of CPU cores for the container."
  type        = number
  default     = 1
}
variable "memory"{
  description = "The amount of memory (in GB) for the container."
  type        = number
  default     = 1.5
}
