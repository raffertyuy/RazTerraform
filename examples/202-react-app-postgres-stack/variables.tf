variable "name" {
  type        = string
  description = "Name of the application"
  default     = "reactapp"
}

variable "environment" {
  type        = string
  description = "Name of the deployment environment"
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test, or prod."
  }
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
  default     = "East US 2"
}

variable "prefix" {
  type        = string
  description = "Prefix for globally-unique DNS-based resources"
  default     = "raztf"
}

# App Service Plan variables
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

# Web App variables
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

variable "webapp_node_version" {
  type        = string
  description = "Node.js version for the web app (Linux Web App format)"
  default     = "18-lts"
}

variable "function_app_node_version" {
  type        = string
  description = "Node.js version for the function app (Linux Function App format)"
  default     = "18"
}

# PostgreSQL variables
variable "postgresql_admin_username" {
  type        = string
  description = "PostgreSQL administrator username"
  default     = "pgadmin"
  sensitive   = true
}

variable "postgresql_admin_password" {
  type        = string
  description = "PostgreSQL administrator password"
  sensitive   = true

  validation {
    condition     = length(var.postgresql_admin_password) >= 8
    error_message = "PostgreSQL password must be at least 8 characters long."
  }
}

variable "postgresql_sku_name" {
  type        = string
  description = "PostgreSQL Flexible Server SKU name for cost optimization"
  default     = "B_Standard_B1ms"
}

variable "postgresql_storage_mb" {
  type        = number
  description = "PostgreSQL storage size in MB"
  default     = 32768 # 32GB - minimum allowed
}

variable "postgresql_version" {
  type        = string
  description = "PostgreSQL version"
  default     = "16"
}

variable "postgresql_database_name" {
  type        = string
  description = "Name of the default PostgreSQL database"
  default     = "reactapp"
}

# Storage Account variables
variable "storage_account_tier" {
  type        = string
  description = "Storage account performance tier"
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Storage account replication type"
  default     = "LRS"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}