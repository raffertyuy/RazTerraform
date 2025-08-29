# terraform.tfvars file
# Customize these values for your deployment

name        = "mywebapp-sql"
environment = "dev"
location    = "Southeast Asia"
prefix      = "raztf"

# App Service Plan Configuration
plan_tier = "Free"
plan_sku  = "F1"

# Web App Configuration
webapp_always_on                    = false  # Must be false for Free tier
webapp_use_32_bit_worker_process   = true   # Must be true for Free tier

# SQL Database Configuration
sql_version        = "12.0"
sql_admin_username = "sqladmin"
sql_admin_password = "P@ssw0rd123!"  # Change this to a secure password
sql_sku_name       = "Basic"

# Tags
tags = {
  project     = "terraform-examples"
  owner       = "your-name"
  cost-center = "development"
}