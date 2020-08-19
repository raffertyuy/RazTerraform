resource "azurerm_sql_server" "default" {
  name                         = "${var.prefix}${var.name}sqlsvr"
  resource_group_name          = azurerm_resource_group.default.name
  location                     = azurerm_resource_group.default.location
  version                      = var.sql_version
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "default" {
  name                = "${var.prefix}${var.name}sqldb"
  server_id           = azurerm_sql_server.default.id
  sku_name            = var.sql_sku_name

  tags = {
    environment = var.environment
  }
}