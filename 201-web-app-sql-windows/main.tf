provider "azurerm" {
  version = ">2.20.0"

  subscription_id = var.subscription_id
  client_id       = var.service_principal_client_id
  client_secret   = var.service_principal_client_secret
  tenant_id       = var.service_principal_tenant_id
  
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "${var.prefix}-${var.name}-rg"
  location = var.location
}
