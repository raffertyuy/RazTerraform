variable "name" {
  type        = string
  description = "Location of the azure resource group."
  default     = "mysite"
}

variable "environment" {
  type        = string
  description = "Name of the deployment environment"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Location to deploy the resoruce group"
  default     = "Southeast Asia"
}

variable "dns_prefix" {
  type        = string
  description = "A prefix for any dns based resources"
  default     = "raztf"
}

variable "plan_tier" {
  type        = string
  description = "The tier of app service plan to create"
  default     = "Free"
}

variable "plan_sku" {
  type        = string
  description = "The sku of app service plan to create"
  default     = "F1"
}

variable "webapp_always_on" {
  type        = bool
  description = "Should the app service run in 32-bit rather than 64-bit mode. If using Free or Shared tier, this should be set to true."
  default     = false
}

variable "webapp_use_32_bit_worker_process" {
  type        = bool
  description = "Should the app service run in 32-bit rather than 64-bit mode. If using Free or Shared tier, this should be set to true."
  default     = true
}