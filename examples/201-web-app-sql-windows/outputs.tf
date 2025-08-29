output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.default.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.default.location
}

output "app_service_plan_id" {
  description = "The ID of the app service plan"
  value       = azurerm_service_plan.default.id
}

output "webapp_name" {
  description = "The name of the web app"
  value       = azurerm_windows_web_app.default.name
}

output "webapp_url" {
  description = "The URL of the web app"
  value       = "https://${azurerm_windows_web_app.default.default_hostname}"
}

output "webapp_id" {
  description = "The ID of the web app"
  value       = azurerm_windows_web_app.default.id
}

output "sql_server_name" {
  description = "The name of the SQL server"
  value       = azurerm_mssql_server.default.name
}

output "sql_server_fqdn" {
  description = "The fully qualified domain name of the SQL server"
  value       = azurerm_mssql_server.default.fully_qualified_domain_name
}

output "sql_database_name" {
  description = "The name of the SQL database"
  value       = azurerm_mssql_database.default.name
}

output "sql_database_id" {
  description = "The ID of the SQL database"
  value       = azurerm_mssql_database.default.id
}