# Storage Account and Linux Function App for serverless backend functionality

locals {
  storage_account_name = lower(replace("st${var.prefix}${var.name}${var.environment}", "-", ""))
  function_app_name    = "${var.prefix}-${var.name}-${var.environment}-func"
}

# Storage Account for Azure Functions (Standard LRS for cost optimization)
resource "azurerm_storage_account" "default" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.default.name
  location                 = azurerm_resource_group.default.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  # Security settings
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = true # Required for Function Apps

  tags = local.common_tags
}

# App Service Plan for Function App (Consumption plan for cost optimization)
resource "azurerm_service_plan" "function_plan" {
  name                = "${var.prefix}-${var.name}-${var.environment}-func-plan"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  os_type             = "Linux"
  sku_name            = "Y1" # Consumption plan - serverless, pay-per-execution

  tags = local.common_tags
}

# Linux Function App with Node.js runtime
resource "azurerm_linux_function_app" "default" {
  name                = local.function_app_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  service_plan_id     = azurerm_service_plan.function_plan.id

  # Storage account configuration
  storage_account_name       = azurerm_storage_account.default.name
  storage_account_access_key = azurerm_storage_account.default.primary_access_key

  # Function app configuration
  functions_extension_version = "~4"

  site_config {
    # Node.js runtime (function app format)
    application_stack {
      node_version = var.function_app_node_version
    }

    # Cost optimization settings
    use_32_bit_worker = var.webapp_use_32_bit_worker_process

    # CORS configuration for React app
    cors {
      allowed_origins     = ["*"] # Configure specific origins in production
      support_credentials = false # Cannot be true when allowed_origins includes '*'
    }
  }

  # Application settings for function app
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"            = "node"
    "WEBSITE_NODE_DEFAULT_VERSION"        = "~18"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"

    # Application Insights configuration
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.default.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.default.connection_string

    # PostgreSQL connection information
    "DATABASE_HOST" = azurerm_postgresql_flexible_server.default.fqdn
    "DATABASE_NAME" = azurerm_postgresql_flexible_server_database.default.name
    "DATABASE_PORT" = "5432"
    "DATABASE_USER" = var.postgresql_admin_username
    "DATABASE_SSL"  = "require"
  }

  # Connection strings for database access
  connection_string {
    name  = "postgresql"
    type  = "PostgreSQL"
    value = "Server=${azurerm_postgresql_flexible_server.default.fqdn};Database=${azurerm_postgresql_flexible_server_database.default.name};Port=5432;User Id=${var.postgresql_admin_username};Password=${var.postgresql_admin_password};Ssl Mode=Require;"
  }

  # Identity configuration for secure access patterns
  identity {
    type = "SystemAssigned"
  }

  # HTTPS only for security
  https_only = true

  tags = local.common_tags
}