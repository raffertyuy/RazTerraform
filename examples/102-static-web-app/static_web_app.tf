resource "azurerm_static_web_app" "default" {
  name                = local.static_web_app_name
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location

  tags = local.common_tags
}