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

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}