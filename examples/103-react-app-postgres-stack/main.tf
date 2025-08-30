provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

locals {
  # Azure-compliant naming with proper abbreviations and consistent pattern
  resource_group_name = "rg-${var.name}-${var.environment}"

  common_tags = merge(var.tags, {
    environment = var.environment
    managed_by  = "terraform"
    template    = "103-react-app-postgres-stack"
  })
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = var.location

  tags = local.common_tags
}