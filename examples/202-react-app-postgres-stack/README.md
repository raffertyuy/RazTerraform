# ReactJS Web App with Azure Functions and PostgreSQL Stack

This template creates a complete web application stack on Azure optimized for cost-effective development workloads.

## Architecture

This template creates:

- **Linux Web App** - Hosting a ReactJS application with Node.js runtime
- **Linux Azure Functions** - Serverless backend logic with Node.js runtime
- **Application Insights** - Monitoring and telemetry for both web app and functions
- **Azure Database for PostgreSQL (Flexible Server)** - Managed PostgreSQL database
- **Storage Account** - Required for Azure Functions runtime
- **App Service Plan** - Shared hosting plan for web app and functions (Free tier)

All components are configured with the lowest available pricing tiers for cost optimization while maintaining functionality.

## Cost Optimization Features

- **Free (F1) App Service Plan** - Shared between web app and function app
- **Burstable B_Standard_B1ms PostgreSQL** - Lowest cost tier with 32GB storage
- **Standard LRS Storage Account** - Local redundancy for cost savings
- **Application Insights** - 90-day retention with default limits
- **Minimal backup retention** - 7 days for PostgreSQL
- **No geo-redundancy** - Single region deployment

## Prerequisites

- Azure CLI or Azure PowerShell configured
- Terraform >= 1.9 installed
- An Azure subscription
- Node.js 18+ (for local React development)

## Quick Start

1. **Clone this repository**

   ```bash
   git clone <repository-url>
   cd examples/202-react-app-postgres-stack
   ```

2. **Set up Azure authentication:**

   ```bash
   # Copy the example file and edit with your values
   cp .env.example .env
   # Edit .env file with your subscription ID and PostgreSQL password
   ```

3. **Load environment variables:**

   ```powershell
   # PowerShell
   .\load-env.ps1
   ```
   
   Or manually:

   ```powershell
   $env:ARM_SUBSCRIPTION_ID = "your-subscription-id-here"
   $env:TF_VAR_postgresql_admin_password = "YourSecurePassword123!"
   ```

4. **Customize configuration:**

   ```bash
   # Edit terraform.tfvars with your specific values
   ```

5. **Deploy the infrastructure:**

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Environment Variables Setup

This template requires specific environment variables to be set:

### Required Environment Variables

- `ARM_SUBSCRIPTION_ID` - Your Azure subscription ID
- `TF_VAR_postgresql_admin_password` - PostgreSQL administrator password (minimum 8 characters)

### Setting up .env file

1. Copy the example file:

   ```bash
   cp .env.example .env
   ```

2. Edit `.env` with your values:

   ```bash
   # Azure Subscription ID (required)
   ARM_SUBSCRIPTION_ID=your-subscription-id-here
   
   # PostgreSQL Admin Password (required, minimum 8 characters)
   TF_VAR_postgresql_admin_password=YourSecurePassword123!
   ```

3. Load the environment variables:

   ```powershell
   .\load-env.ps1
   ```

## Configuration

### Required Variables

| Name | Description | Example |
|------|-------------|--------|
| `postgresql_admin_password` | PostgreSQL administrator password | `YourSecurePassword123!` |

### Important Variables

| Name | Description | Default | Notes |
|------|-------------|---------|-------|
| `name` | Application name | `reactapp` | Used in resource naming |
| `environment` | Environment name | `dev` | Must be: dev, test, or prod |
| `location` | Azure region | `Southeast Asia` | Choose closest region |
| `prefix` | Resource prefix | `raztf` | For globally unique names |
| `plan_sku` | App Service Plan SKU | `F1` | Free tier, don't change for cost optimization |
| `postgresql_sku_name` | PostgreSQL SKU | `B_Standard_B1ms` | Burstable tier for cost optimization |

### Optional Variables

| Name | Description | Default |
|------|-------------|--------|
| `webapp_node_version` | Node.js version | `18-lts` |
| `postgresql_version` | PostgreSQL version | `16` |
| `postgresql_storage_mb` | PostgreSQL storage (MB) | `32768` (32GB) |
| `postgresql_database_name` | Default database name | `reactapp` |

## Outputs

| Name | Description |
|------|-------------|
| `web_app_url` | URL of the React web application |
| `function_app_url` | URL of the Azure Functions app |
| `postgresql_server_fqdn` | PostgreSQL server connection endpoint |
| `application_insights_connection_string` | Application Insights connection string |

## Post-Deployment Steps

### 1. Deploy React Application

After infrastructure deployment, you can deploy your React application:

```bash
# Build your React app
npm run build

# Deploy to Azure Web App (using Azure CLI)
az webapp deployment source config-zip \
  --resource-group $(terraform output -raw resource_group_name) \
  --name $(terraform output -raw web_app_name) \
  --src build.zip
```

### 2. Deploy Azure Functions

Deploy your Node.js functions:

```bash
# Deploy functions (using Azure Functions Core Tools)
func azure functionapp publish $(terraform output -raw function_app_name)
```

### 3. Configure Database Connection

The PostgreSQL connection string is automatically configured in both the web app and function app environment variables:

- **Web App**: Available as `DATABASE_URL` environment variable
- **Function App**: Available as `postgresql` connection string

### 4. Access Application Insights

Monitoring is automatically configured for both applications. Access Application Insights through the Azure portal or use the connection string for custom telemetry.

## Development Workflow

### Local Development

1. **Run React app locally:**

   ```bash
   npm start
   ```

2. **Run Azure Functions locally:**

   ```bash
   func start
   ```

3. **Connect to PostgreSQL:**

   ```bash
   # Get connection details
   terraform output postgresql_server_fqdn
   
   # Connect using psql
   psql "host=$(terraform output -raw postgresql_server_fqdn) \
         port=5432 \
         dbname=$(terraform output -raw postgresql_database_name) \
         user=pgadmin \
         sslmode=require"
   ```

### Deployment

1. **Deploy infrastructure changes:**

   ```bash
   terraform plan
   terraform apply
   ```

2. **Deploy application code:**

   ```bash
   # Web app
   npm run build
   az webapp deployment source config-zip ...
   
   # Functions
   func azure functionapp publish ...
   ```

## Troubleshooting

### Common Issues

1. **Free tier limitations:**
   - Always On must be disabled (already configured)
   - 32-bit worker process required (already configured)
   - 1GB memory limit
   - 60 minutes daily compute quota

2. **PostgreSQL connection issues:**
   - Ensure firewall rules allow Azure services
   - Verify SSL mode is set to "require"
   - Check environment variables are properly set

3. **Function app deployment:**
   - Ensure you're using Node.js runtime
   - Check storage account connectivity
   - Verify function app settings

### Viewing Logs

```bash
# Web app logs
az webapp log tail --resource-group $(terraform output -raw resource_group_name) \
                  --name $(terraform output -raw web_app_name)

# Function app logs
func azure functionapp logstream $(terraform output -raw function_app_name)
```

## Cost Management

### Expected Monthly Costs (USD)

- **App Service Plan (Free)**: $0
- **PostgreSQL B_Standard_B1ms**: ~$12-15
- **Storage Account (LRS)**: ~$1-2
- **Application Insights**: ~$0-5 (depending on usage)

### Total Estimated Monthly Cost

$13-22 USD

### Cost Optimization Tips

1. **Stop/start PostgreSQL server** when not in use (can reduce costs by 50%)
2. **Use development/test pricing** for PostgreSQL if available
3. **Monitor Application Insights data ingestion** to stay within free limits
4. **Clean up test deployments** regularly

## Security Considerations

- PostgreSQL admin credentials are stored as environment variables
- SSL/TLS is enforced for all database connections
- Application Insights data is encrypted at rest and in transit
- Consider using Azure Key Vault for production secrets
- Review and restrict PostgreSQL firewall rules for production

## Scaling Considerations

To scale beyond the free tier:

1. **Upgrade App Service Plan** to Basic (B1) or higher
2. **Enable Always On** for production workloads
3. **Scale PostgreSQL** to higher SKU if needed
4. **Add geo-redundancy** for production databases
5. **Implement auto-scaling** for function apps

## Notes

- This template is optimized for development and testing workloads
- Free tier has usage quotas and limitations
- Consider upgrading tiers for production workloads
- PostgreSQL requires a strong password (minimum 8 characters)
- All resources are deployed in a single Azure region
- Backup retention is set to minimum (7 days) for cost optimization

## Support

For issues with this template, please check:

1. Terraform plan output for configuration errors
2. Azure portal for resource deployment status
3. Application logs for runtime issues
4. Application Insights for performance monitoring

---

**Important**: This template is configured for cost optimization and may not be suitable for production workloads without modifications. Review and adjust settings based on your specific requirements.
