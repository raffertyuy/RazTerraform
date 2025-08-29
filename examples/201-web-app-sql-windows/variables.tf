variable "name" {
  type        = string
  description = "Name of the application"
  default     = "mysite"
}

variable "environment" {
  type        = string
  description = "Name of the deployment environment"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Location to deploy the resource group"
  default     = "Southeast Asia"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "prefix" {
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
  description = "Enable Always On for the web app. Must be false for Free/Shared tiers."
  default     = false
}

variable "webapp_use_32_bit_worker_process" {
  type        = bool
  description = "Use 32-bit worker process. Required for Free/Shared tiers."
  default     = true
}

variable "sql_version" {
  type        = string
  description = "Version Number of the SQL Database"
  default     = "12.0"
}

variable "sql_admin_username" {
  type        = string
  description = "Username for the SQL Database administrator"

  validation {
    condition     = length(var.sql_admin_username) > 0
    error_message = "SQL admin username cannot be empty."
  }
}

variable "sql_admin_password" {
  type        = string
  description = "Password for the SQL Database administrator"
  sensitive   = true

  validation {
    condition     = length(var.sql_admin_password) >= 8
    error_message = "SQL admin password must be at least 8 characters long."
  }
}

variable "sql_sku_name" {
  type        = string
  description = "The SKU of the SQL Database"
  default     = "Basic"
}