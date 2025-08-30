output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.default.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.default.location
}

output "web_app_name" {
  description = "The name of the web app"
  value       = azurerm_linux_web_app.default.name
}

output "web_app_default_hostname" {
  description = "The default hostname of the web app"
  value       = azurerm_linux_web_app.default.default_hostname
}

output "web_app_url" {
  description = "The URL of the web app"
  value       = "https://${azurerm_linux_web_app.default.default_hostname}"
}

output "function_app_name" {
  description = "The name of the function app"
  value       = azurerm_linux_function_app.default.name
}

output "function_app_default_hostname" {
  description = "The default hostname of the function app"
  value       = azurerm_linux_function_app.default.default_hostname
}

output "function_app_url" {
  description = "The URL of the function app"
  value       = "https://${azurerm_linux_function_app.default.default_hostname}"
}

output "function_app_plan_name" {
  description = "The name of the function app service plan"
  value       = azurerm_service_plan.function_plan.name
}

output "function_app_plan_sku" {
  description = "The SKU of the function app service plan"
  value       = azurerm_service_plan.function_plan.sku_name
}

output "postgresql_server_fqdn" {
  description = "The FQDN of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.default.fqdn
}

output "postgresql_database_name" {
  description = "The name of the PostgreSQL database"
  value       = azurerm_postgresql_flexible_server_database.default.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.default.name
}

output "application_insights_instrumentation_key" {
  description = "The instrumentation key of Application Insights"
  value       = azurerm_application_insights.default.instrumentation_key
  sensitive   = true
}

output "application_insights_connection_string" {
  description = "The connection string of Application Insights"
  value       = azurerm_application_insights.default.connection_string
  sensitive   = true
}