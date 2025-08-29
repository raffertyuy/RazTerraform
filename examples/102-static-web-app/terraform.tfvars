# terraform.tfvars file
# Customize these values for your deployment

name        = "mystaticapp"
environment = "dev"
location    = "East Asia"
prefix      = "raztf"

# Static Web App configuration
sku_tier = "Free"
sku_size = "Free"

# Tags
tags = {
  project     = "terraform-examples"
  owner       = "your-name"
  cost-center = "development"
}