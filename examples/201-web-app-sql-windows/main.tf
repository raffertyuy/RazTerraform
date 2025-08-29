provider "azurerm" {
  features {}
}

locals {
  resource_group_name   = "${var.prefix}-${var.name}-rg"
  app_service_plan_name = "${var.prefix}-${var.name}-plan"
  webapp_name           = "${var.prefix}-${var.name}-${var.environment}-webapp"
  sql_server_name       = "${var.prefix}${var.name}sqlsvr"
  sql_database_name     = "${var.prefix}${var.name}sqldb"

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
