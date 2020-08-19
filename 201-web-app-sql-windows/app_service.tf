resource "azurerm_app_service_plan" "default" {
  name                = "${var.prefix}-${var.name}-plan"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  kind                = "Windows"

  sku {
    tier = var.plan_tier
    size = var.plan_sku
  }
}

resource "azurerm_app_service" "default" {
  name                = "${var.prefix}-${var.name}-${var.environment}-webapp"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  app_service_plan_id = azurerm_app_service_plan.default.id

  site_config {
    always_on                = var.webapp_always_on
    dotnet_framework_version = "v4.0"
    use_32_bit_worker_process = var.webapp_use_32_bit_worker_process
  }

  tags = {
    environment = var.environment
  }
}
