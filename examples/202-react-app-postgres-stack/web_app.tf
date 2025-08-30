# App Service Plan and Linux Web App for ReactJS hosting

locals {
  app_service_plan_name = "asp-${var.name}-${var.environment}"
  webapp_name           = "${var.prefix}-${var.name}-${var.environment}-app"
}

# App Service Plan (Free F1 tier for cost optimization)
resource "azurerm_service_plan" "default" {
  name                = local.app_service_plan_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  os_type             = "Linux"
  sku_name            = var.plan_sku

  tags = local.common_tags
}

# Linux Web App for ReactJS
resource "azurerm_linux_web_app" "default" {
  name                = local.webapp_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  service_plan_id     = azurerm_service_plan.default.id

  site_config {
    # Node.js runtime for React applications
    application_stack {
      node_version = var.webapp_node_version
    }

    # Required settings for Free tier
    always_on         = var.webapp_always_on                 # Must be false for Free tier
    use_32_bit_worker = var.webapp_use_32_bit_worker_process # Required for Free tier

    # Static file serving configuration for React
    app_command_line = "pm2 serve /home/site/wwwroot --no-daemon --spa"
  }

  # Application settings for React production build
  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "WEBSITES_PORT"                       = "8080"
    "NODE_ENV"                            = "production"

    # Application Insights configuration
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.default.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.default.connection_string

    # PostgreSQL database connection (for client-side configuration if needed)
    "DATABASE_HOST" = azurerm_postgresql_flexible_server.default.fqdn
    "DATABASE_NAME" = azurerm_postgresql_flexible_server_database.default.name
    "DATABASE_PORT" = "5432"
    "DATABASE_SSL"  = "require"
  }

  # HTTPS only for security
  https_only = true

  tags = local.common_tags
}