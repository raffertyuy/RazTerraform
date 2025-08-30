# Azure Database for PostgreSQL Flexible Server with cost optimization

locals {
  postgresql_server_name = "${var.prefix}-${var.name}-${var.environment}-psql"
}

# PostgreSQL Flexible Server (Burstable tier for cost optimization)
resource "azurerm_postgresql_flexible_server" "default" {
  name                = local.postgresql_server_name
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location

  # Administrator credentials
  administrator_login    = var.postgresql_admin_username
  administrator_password = var.postgresql_admin_password

  # Cost-optimized configuration
  sku_name   = var.postgresql_sku_name   # B_Standard_B1ms - Burstable tier
  version    = var.postgresql_version    # PostgreSQL 16
  storage_mb = var.postgresql_storage_mb # 32GB - minimum allowed

  # Backup and redundancy settings (cost optimized)
  backup_retention_days        = 7     # Minimum allowed
  geo_redundant_backup_enabled = false # Disable for cost savings

  # Network access configuration
  public_network_access_enabled = true # Simplified for development

  tags = local.common_tags
}

# PostgreSQL Flexible Server Database
resource "azurerm_postgresql_flexible_server_database" "default" {
  name      = var.postgresql_database_name
  server_id = azurerm_postgresql_flexible_server.default.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

# Firewall rule to allow Azure services
resource "azurerm_postgresql_flexible_server_firewall_rule" "azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_postgresql_flexible_server.default.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Firewall rule to allow all Azure IPs (for Function Apps and Web Apps)
resource "azurerm_postgresql_flexible_server_firewall_rule" "azure_ips" {
  name             = "AllowAllAzureIps"
  server_id        = azurerm_postgresql_flexible_server.default.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}