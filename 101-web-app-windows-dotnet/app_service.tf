resource "azurerm_app_service_plan" "default" {
  name                = "${var.name}-plan"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  kind                = "Windows"

  sku {
    tier = var.plan_tier
    size = var.plan_sku
  }
}

resource "azurerm_app_service" "default" {
  name                = "${var.dns_prefix}-${var.name}-${var.environment}-webapp"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  app_service_plan_id = azurerm_app_service_plan.default.id

  site_config {
    always_on                = false # Free Tier does not support true
    dotnet_framework_version = "v4.0"
    use_32_bit_worker_process = true # Free Tier requires 32 bit
  }
}
