provider "azurerm" {
  features {}
}

locals {
  # Azure-compliant naming with proper abbreviations and consistent pattern
  resource_group_name   = "rg-${var.name}-${var.environment}"
  app_service_plan_name = "asp-${var.name}-${var.environment}"
  webapp_name           = "${var.prefix}-${var.name}-${var.environment}-app"
  sql_server_name       = "sql-${var.name}-${var.environment}"
  sql_database_name     = "sqldb-${var.name}-${var.environment}"

  common_tags = merge(var.tags, {
    environment = var.environment
    managed_by  = "terraform"
  })
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = var.location

  tags = local.common_tags
}
