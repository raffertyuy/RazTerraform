resource "azurerm_mssql_server" "default" {
  name                         = local.sql_server_name
  resource_group_name          = azurerm_resource_group.default.name
  location                     = azurerm_resource_group.default.location
  version                      = var.sql_version
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password

  tags = local.common_tags
}

resource "azurerm_mssql_database" "default" {
  name      = local.sql_database_name
  server_id = azurerm_mssql_server.default.id
  sku_name  = var.sql_sku_name

  tags = local.common_tags
}

# Allow Azure services to access the SQL server
resource "azurerm_mssql_firewall_rule" "azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.default.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}