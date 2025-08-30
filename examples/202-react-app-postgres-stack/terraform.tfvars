# terraform.tfvars file
# Customize these values for your deployment

name        = "reactapp"
environment = "dev"
location    = "East US 2"
prefix      = "raztf"

# App Service Plan configuration (Free tier for cost optimization)
plan_tier = "Free"
plan_sku  = "F1"

# Web App configuration
webapp_always_on                 = false   # Required for Free tier
webapp_use_32_bit_worker_process = true    # Required for Free tier
webapp_node_version              = "18-lts"
function_app_node_version        = "18"

# PostgreSQL configuration (lowest cost tier)
postgresql_admin_username = "pgadmin"
# Note: Set postgresql_admin_password as environment variable or in .env file
# postgresql_admin_password = "YourSecurePassword123!"
postgresql_sku_name      = "B_Standard_B1ms" # Burstable tier for cost optimization
postgresql_storage_mb    = 32768             # 32GB - minimum allowed
postgresql_version       = "16"              # Latest supported version
postgresql_database_name = "reactapp"

# Storage Account configuration (cost optimized)
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"

# Tags
tags = {
  project     = "terraform-examples"
  owner       = "your-name"
  cost-center = "development"
  workload    = "react-app-postgres-stack"
}