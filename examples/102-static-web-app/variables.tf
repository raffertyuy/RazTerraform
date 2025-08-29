variable "name" {
  type        = string
  description = "Name of the application"
  default     = "mystaticapp"
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
  description = "Location to deploy the resource group"
  default     = "East Asia"
}

variable "prefix" {
  type        = string
  description = "A prefix for any dns based resources"
  default     = "raztf"
}

variable "sku_tier" {
  type        = string
  description = "The SKU tier of the Static Web App"
  default     = "Free"

  validation {
    condition     = contains(["Free", "Standard"], var.sku_tier)
    error_message = "SKU tier must be Free or Standard."
  }
}

variable "sku_size" {
  type        = string
  description = "The SKU size of the Static Web App"
  default     = "Free"

  validation {
    condition     = contains(["Free", "Standard"], var.sku_size)
    error_message = "SKU size must be Free or Standard."
  }
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}