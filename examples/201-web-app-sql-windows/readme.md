# Windows Web App with SQL Database

This template deploys a Windows-based Azure App Service with an Azure SQL Database. It extends the basic web app template by adding database connectivity for data-driven .NET applications.

## Architecture

This template creates:

- Azure Resource Group
- Azure App Service Plan (Windows-based)
- Azure Windows Web App configured for .NET Framework
- Azure SQL Server
- Azure SQL Database
- SQL Server firewall rule (to allow Azure services)
- Connection string configuration for the web app

## Prerequisites

- Azure CLI or Azure PowerShell configured
- Terraform >= 1.9 installed
- An Azure subscription

## Quick Start

1. Clone this repository
2. Navigate to this template directory
3. Customize the variables in `terraform.tfvars` as needed (especially SQL credentials)
4. Run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

## Configuration

### Required Variables

- `sql_admin_username` - SQL Server administrator username
- `sql_admin_password` - SQL Server administrator password (use a strong password)

### Optional Variables

| Name | Description | Default |
|-|-|-|
| name | Name of the application | "mysite" |
| environment | Deployment environment name | "dev" |
| prefix | Prefix for globally-unique DNS-based resources | "raztf" |
| location | Azure region to deploy resources | "Southeast Asia" |
| plan_tier | App Service Plan tier | "Free" |
| plan_sku | App Service Plan SKU | "F1" |
| webapp_always_on | Enable Always On (false for Free tier) | false |
| webapp_use_32_bit_worker_process | Use 32-bit worker process (required for Free tier) | true |
| sql_version | SQL Server version | "12.0" |
| sql_sku_name | SQL Database SKU | "Basic" |
| tags | Resource tags | {} |

## Outputs

| Name | Description |
|-|-|
| webapp_url | The URL of the deployed web application |
| webapp_name | The name of the web app |
| sql_server_fqdn | The fully qualified domain name of the SQL server |
| sql_database_name | The name of the SQL database |
| resource_group_name | The name of the resource group |

## Database Connection

The web app is automatically configured with a connection string named "DefaultConnection" that points to the created SQL database. You can access this in your .NET application using:

```csharp
string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
```

## Security Considerations

- Change the default SQL administrator password to a strong, unique password
- Consider implementing Azure AD authentication for the SQL database
- The SQL Server allows access from Azure services by default (0.0.0.0 firewall rule)
- For production environments, configure more restrictive firewall rules

## Cost Optimization

This template is configured to use minimal SKUs by default:

- App Service Plan: Free (F1) - Free tier
- SQL Database: Basic - Lowest paid tier for SQL Database

**Note**: SQL Database Basic tier costs approximately $5/month and does not have a free tier option.

## Notes

- Free tier App Service does not support Always On, so it's set to false by default
- Free tier requires 32-bit worker process
- The web app will be accessible at `https://{prefix}-{name}-{environment}-webapp.azurewebsites.net`
- The SQL Server name will be `{prefix}{name}sqlsvr`
- The SQL Database name will be `{prefix}{name}sqldb`
