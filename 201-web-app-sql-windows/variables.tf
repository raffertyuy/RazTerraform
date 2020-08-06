variable "subscription_id" {
  type        = string
  description = "The subscription ID"
}

variable "service_principal_client_id" {
  type        = string
  description = "The client/app id of the service principal"
}

variable "service_principal_client_secret" {
  type        = string
  description = "The client secret of the service principal"
}

variable "service_principal_tenant_id" {
  type        = string
  description = "The directory/tenant id of the service principal"
}

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

variable "sql_version" {
  type        = string
  description = "Version Number of the SQL Database"
  default     = "12.0"
}

variable "sql_admin_username" {
  type        = string
  description = "Username for the SQL DB administrator"
}

variable "sql_admin_password" {
  type        = string
  description = "Password for the SQL DB administrator"
}

variable "sql_sku_name" {
  type        = string
  description = "The SKU of the SQL Database"
  default     = "Basic"
}