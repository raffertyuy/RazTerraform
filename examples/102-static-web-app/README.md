# Azure Static Web App Terraform Template

This template demonstrates how to deploy an Azure Static Web App using Terraform. It creates a simple, standalone Static Web App that can be used to host static websites or single-page applications.

## Architecture

This template creates:

- Azure Resource Group
- Azure Static Web App with Free tier configuration
- Proper naming conventions and tagging

## Prerequisites

- Azure CLI or Azure PowerShell configured
- Terraform >= 1.9 installed
- An Azure subscription

## Quick Start

1. Clone this repository
2. Navigate to this template directory
3. **Set up Azure authentication:**
   - Copy `.env.example` to `.env` (if available)
   - Set your Azure subscription ID: `$env:ARM_SUBSCRIPTION_ID = "your-subscription-id"`
   - Load environment variables: `.\load-env.ps1` (PowerShell)
4. Customize the variables in `terraform.tfvars` as needed
5. Run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

### Environment Variables Setup

This template requires your Azure subscription ID to be set as an environment variable.

#### Option 1: Using the provided scripts (Recommended)

```powershell
# Set environment variable manually
$env:ARM_SUBSCRIPTION_ID = "your-subscription-id-here"

# Load environment variables (local script)
.\load-env.ps1
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

All variables have default values, so no variables are strictly required. However, you should customize:

- `name` - The name of your application
- `prefix` - A unique prefix for globally-unique resources
- `environment` - The deployment environment (dev, test, prod)

### Optional Variables

| Name | Description | Default |
|-|-|-|
| `name` | Name of the application | `mystaticapp` |
| `environment` | Deployment environment | `dev` |
| `location` | Azure region | `East Asia` |
| `prefix` | Prefix for DNS-based resources | `raztf` |
| `sku_tier` | Static Web App SKU tier | `Free` |
| `sku_size` | Static Web App SKU size | `Free` |
| `tags` | Resource tags | `{}` |

## Outputs

| Name | Description |
|-|-|
| `resource_group_name` | The name of the created resource group |
| `resource_group_location` | The location of the resource group |
| `static_web_app_id` | The Azure resource ID of the Static Web App |
| `static_web_app_name` | The name of the Static Web App |
| `default_host_name` | The default hostname URL of the Static Web App |
| `api_key` | The API key for the Static Web App (sensitive) |

## Cost Optimization

This template uses the Free tier by default, which provides:

- 100 GB bandwidth per month
- 0.5 GB storage
- Free custom domains
- Free SSL certificates

The Free tier is suitable for development and small applications. For production workloads, consider upgrading to the Standard tier.

## Next Steps

After deployment, you can:

1. Access your Static Web App at the `default_host_name` URL
2. Configure CI/CD with GitHub Actions or Azure DevOps
3. Add custom domains and SSL certificates
4. Configure API backends with Azure Functions

## Notes

- The Static Web App is created with public network access enabled
- Preview environments are enabled for branch deployments
- Configuration file changes are allowed for flexibility
- The API key is marked as sensitive and won't be displayed in logs
