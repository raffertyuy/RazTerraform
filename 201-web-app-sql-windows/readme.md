# Windows Web App for a .NET Application


This template is an extension of [101-web-app-windows-dotnet](../101-web-app-windows-dotnet) but with a database. More specifically, it deploys an [Azure App Service](https://www.terraform.io/docs/providers/azurerm/r/app_service.html) running Windows configured for a .NET Framework 4.6.2 application and an [Azure SQL Database](https://www.terraform.io/docs/providers/azurerm/r/mssql_database.html).

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
| sql_version | The SQL Database version |
| sql_admin_username | The DB administrator login username |
| sql_admin_password | The DB administrator login password |
| sql_sku_name | The Azure SQL Database SKU |