provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

locals {
  # Azure-compliant naming with proper abbreviations and consistent pattern
  resource_group_name = "rg-${var.name}-${var.environment}"
  static_web_app_name = "${var.prefix}-${var.name}-${var.environment}"

  common_tags = merge(var.tags, {
    environment = var.environment
    managed_by  = "terraform"
  })
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = var.location

  tags = local.common_tags
}