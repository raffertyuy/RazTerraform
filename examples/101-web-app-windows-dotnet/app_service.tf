resource "azurerm_service_plan" "default" {
  name                = local.app_service_plan_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  os_type             = "Windows"
  sku_name            = var.plan_sku

  tags = local.common_tags
}

resource "azurerm_windows_web_app" "default" {
  name                = local.webapp_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  service_plan_id     = azurerm_service_plan.default.id

  site_config {
    always_on         = var.webapp_always_on
    use_32_bit_worker = var.webapp_use_32_bit_worker_process

    application_stack {
      dotnet_version = "v4.0"
    }
  }

  tags = local.common_tags
}
