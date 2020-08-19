# Windows Web App for a .NET Application


This template is a fork from [Azure Terraform Quickstarts](https://github.com/Azure/terraform/tree/master/quickstart/101-web-app-windows-dotnet). It deploys an [Azure App Service](https://www.terraform.io/docs/providers/azurerm/r/app_service.html) running Windows configured for a .NET Framework 4.6.2 application.

Changes from the source are:
- Changed default location to Southeast Asia
- Changed default SKU/Tier to Free/F1
- Changed default names
- Changed default AzureRM provider to >2.20.0
- Fixed interpolation-only expressions which were deprecated from Terraform 0.12 onwards

## Variables

| Name | Description |
|-|-|
| name | Name of the deployment |
| environment | The depolyment environment name (used for postfixing resource names) |
| prefix | A prefix for globally-unique dns-based resources |
| location | The Azure Region to deploy these resources in |
| plan_tier | The App Service Plan tier to deploy |
| plan_sku | The App Service Plan SKU to deploy |
| webapp_always_on | The App Service Always-On Site Config. Free Tier does not support true |
| webapp_use_32_bit_worker_process | The App Service Worker Process Site Config. 32-bit is required for Free Tier |