# Windows Web App for .NET Applications

This template deploys a simple Windows-based Azure App Service configured for .NET Framework applications. It creates the minimum required resources: a Resource Group, App Service Plan, and Windows Web App.

## Architecture

This template creates:

- Azure Resource Group
- Azure App Service Plan (Windows-based)
- Azure Windows Web App configured for .NET Framework

## Prerequisites

- Azure CLI or Azure PowerShell configured
- Terraform >= 1.9 installed
- An Azure subscription

## Quick Start

1. Clone this repository
2. Navigate to this template directory
3. **Set up Azure authentication:**
   - Copy `.env.example` to `.env`
   - Update `.env` with your Azure subscription ID
   - Load environment variables: `.\load-env.ps1` (PowerShell) or source the variables manually
4. Customize the variables in `terraform.tfvars` as needed
5. Run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

### Environment Variables Setup

This template requires your Azure subscription ID to be set as an environment variable. You have two options:

#### Option 1: Using the provided scripts (Recommended)

```powershell
# Copy the example file and edit with your values
cp .env.example .env
# Edit .env file with your subscription ID

# Load environment variables (local script)
.\load-env.ps1

# Or use the centralized script directly
..\..\scripts\load-env.ps1
```

#### Option 2: Manual setup

```powershell
# Set environment variable manually
$env:ARM_SUBSCRIPTION_ID = "your-subscription-id-here"
```

**Required Environment Variables:**

- `ARM_SUBSCRIPTION_ID` - Your Azure subscription ID (get it with `az account show --query id -o tsv`)

## Configuration

### Required Variables

None - all variables have sensible defaults.

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
| tags | Resource tags | {} |

## Outputs

| Name | Description |
|-|-|
| webapp_url | The URL of the deployed web application |
| webapp_name | The name of the web app |
| resource_group_name | The name of the resource group |

## Cost Optimization

This template is configured to use the Free tier (F1 SKU) by default, which provides:

- 1 GB disk space
- Up to 1 GB RAM
- 60 CPU minutes per day
- Custom domain support (but no SSL)

## Notes

- Free tier does not support Always On, so it's set to false by default
- Free tier requires 32-bit worker process
- The web app will be accessible at `https://{prefix}-{name}-{environment}-webapp.azurewebsites.net`
