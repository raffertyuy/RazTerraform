# RazTerraform Templates

This repository contains standalone Terraform templates for Azure, inspired by the [Azure Terraform Quickstart Templates](https://aka.ms/terraformquickstart).

Each template is designed to be completely self-contained and deployable independently. Unless otherwise specified, the templates default to the lowest pricing tiers available to minimize costs.

## Repository Structure

```text
├── examples/              # Standalone Terraform examples
│   ├── 101-*/            # Basic templates (1-2 services)
│   ├── 201-*/            # Intermediate templates (3-4 services)
│   └── 301-*/            # Advanced templates (5+ services)
├── scripts/               # Shared utility scripts
│   └── load-env.ps1      # Centralized environment variable loader
└── docs/                  # Documentation
```

Also see the [File Structure Documentation](docs/file_structure.md) for detailed information about the workspace organization and how to create new templates.

## Available Templates

### Basic Templates (101-*)

- **[101-web-app-windows-dotnet](examples/101-web-app-windows-dotnet/)** - Simple Windows App Service for .NET applications

### Intermediate Templates (201-*)

- **[201-web-app-sql-windows](examples/201-web-app-sql-windows/)** - Windows App Service with SQL Database for data-driven .NET applications

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.9
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) configured with your subscription
- An Azure subscription

### Quick Start

1. Choose a template from the `examples/` directory
2. Navigate to the template directory
3. **Set up Azure authentication** (see below)
4. Customize the variables in `terraform.tfvars` as needed
5. Deploy the template:

```bash
terraform init
terraform plan
terraform apply
```

### Authentication Setup

Each template includes environment variable setup for Azure authentication:

1. **Copy environment configuration:**

   ```bash
   cp .env.example .env
   ```

2. **Edit `.env` with your Azure subscription ID:**

   ```bash
   # Get your subscription ID
   az account show --query id -o tsv
   
   # Add it to .env file
   ARM_SUBSCRIPTION_ID=your-subscription-id-here
   ```

3. **Load environment variables:**

   ```powershell
   # PowerShell (local script)
   .\load-env.ps1
   
   # Or use centralized script
   ..\..\scripts\load-env.ps1
   ```

### Authentication Methods

These templates use the AzureRM provider's default authentication methods:

- Azure CLI authentication (recommended for local development)
- Environment variables (ARM_SUBSCRIPTION_ID, ARM_CLIENT_ID, etc.)
- Managed Identity (for Azure-hosted environments)
- Service Principal with client credentials
- Azure PowerShell authentication

No hardcoded credentials are required in the templates.

## Contributing

When contributing new templates:

1. Follow the established file structure and naming conventions
2. Include comprehensive documentation
3. Provide example configurations
4. Use cost-optimized default values
5. Follow Terraform best practices
6. Test thoroughly before submitting
