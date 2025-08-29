output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.default.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.default.location
}

output "static_web_app_id" {
  description = "The ID of the Static Web App"
  value       = azurerm_static_web_app.default.id
}

output "static_web_app_name" {
  description = "The name of the Static Web App"
  value       = azurerm_static_web_app.default.name
}

output "default_host_name" {
  description = "The default host name of the Static Web App"
  value       = azurerm_static_web_app.default.default_host_name
}

output "api_key" {
  description = "The API key of the Static Web App"
  value       = azurerm_static_web_app.default.api_key
  sensitive   = true
}