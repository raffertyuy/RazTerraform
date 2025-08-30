# Application Insights for monitoring and telemetry

locals {
  application_insights_name = "appi-${var.name}-${var.environment}"
}

# Application Insights component
resource "azurerm_application_insights" "default" {
  name                = local.application_insights_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  application_type    = "web"

  # Cost optimization settings
  retention_in_days    = 90  # Default for cost optimization
  daily_data_cap_in_gb = 100 # Default limit
  sampling_percentage  = 100 # Full sampling for development

  tags = local.common_tags
}