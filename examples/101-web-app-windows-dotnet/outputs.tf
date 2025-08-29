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