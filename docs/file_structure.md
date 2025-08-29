# File Structure Documentation

This document explains the file and folder structure of the RazTerraform workspace, following Terraform best practices for standalone template organization.

## Workspace Overview

```text
RazTerraform/
│
├── docs/                           # Documentation files
│   └── file_structure.md          # This file
│
├── .vscode/                       # VS Code workspace configuration
│   ├── mcp.json                   # Model Context Protocol server configurations
│   └── tasks.json                 # VS Code tasks for Terraform operations
│
├── examples/                      # Standalone Terraform example templates
│   ├── 101-web-app-windows-dotnet/
│   │   ├── terraform.tf           # Terraform and provider version constraints
│   │   ├── main.tf                # Provider configuration, locals, and core resources
│   │   ├── variables.tf           # Input variable definitions
│   │   ├── outputs.tf             # Output value definitions
│   │   ├── app_service.tf         # App Service specific resources
│   │   ├── terraform.tfvars       # Variable configuration values
│   │   └── readme.md              # Template-specific documentation
│   │
│   └── 201-web-app-sql-windows/
│       ├── terraform.tf           # Terraform and provider version constraints
│       ├── main.tf                # Provider configuration, locals, and core resources
│       ├── variables.tf           # Input variable definitions
│       ├── outputs.tf             # Output value definitions
│       ├── app_service.tf         # App Service specific resources
│       ├── sql_database.tf        # SQL Database specific resources
│       ├── terraform.tfvars       # Variable configuration values
│       └── readme.md              # Template-specific documentation
│
├── .gitignore                     # Git ignore file for Terraform
└── README.md                      # Main repository documentation
```

## File Structure Explained

### Folder Naming Standards

Templates are organized by complexity level using a numeric prefix system:

- **`101-` folders** are basic templates, usually involving 1-2 services
- **`201-` folders** are intermediate templates, usually involving 3-4 services  
- **`301-` folders** are advanced templates, usually involving 5 or more services

This naming convention helps users quickly identify the complexity and scope of each template, making it easier to find the right starting point for their needs.

### Root Level Files

| File | Purpose | Required |
|------|---------|----------|
| `README.md` | Main repository documentation and getting started guide | ✅ Yes |
| `.gitignore` | Git ignore patterns for Terraform files and secrets | ✅ Yes |

### VS Code Configuration (`.vscode/`)

| File | Purpose | Required |
|------|---------|----------|
| `tasks.json` | VS Code tasks for running Terraform operations | 🔧 Recommended |
| `mcp.json` | Model Context Protocol server configurations | 🔧 Optional |

### Documentation (`docs/`)

| File | Purpose | Required |
|------|---------|----------|
| `file_structure.md` | This documentation file | 📖 Recommended |

### Example Templates (`examples/`)

Each example template follows a consistent structure with the following files:

#### Core Terraform Files (Required)

| File | Purpose | Description |
|------|---------|-------------|
| `terraform.tf` | **Version Constraints** | Defines Terraform version and required providers with version constraints |
| `main.tf` | **Core Configuration** | Provider configuration, locals block, and primary resources (like Resource Group) |
| `variables.tf` | **Input Variables** | All input variable definitions with types, descriptions, and defaults |
| `outputs.tf` | **Output Values** | Output definitions for important resource information |

#### Resource-Specific Files (As Needed)

| File Pattern | Purpose | When to Use |
|--------------|---------|-------------|
| `app_service.tf` | App Service resources | When deploying Azure App Services |
| `sql_database.tf` | SQL Database resources | When deploying Azure SQL Database |
| `storage.tf` | Storage resources | When deploying Azure Storage Accounts |
| `network.tf` | Networking resources | When deploying VNets, Subnets, NSGs |
| `security.tf` | Security resources | When deploying Key Vault, certificates |

#### Documentation and Configuration (Required)

| File | Purpose | Description |
|------|---------|-------------|
| `readme.md` | **Template Documentation** | Comprehensive guide for the specific template |
| `terraform.tfvars` | **Variable Configuration** | Default values for all variables, ready to customize |

## Creating a New Example Template

Follow these steps to create a new standalone Terraform example template:

### Step 1: Create Directory Structure

Create a new directory under `examples/` following the naming convention:

```bash
# Basic templates (1-2 services)
examples/101-{service-description}/

# Intermediate templates (3-4 services)  
examples/201-{service-description}/

# Advanced templates (5+ services)
examples/301-{service-description}/
```

**Examples:**

- `101-storage-account` - Simple storage account
- `201-app-service-keyvault` - App Service with Key Vault
- `301-microservices-platform` - Complete microservices setup

### Step 2: Create Required Core Files

#### 2.1 `terraform.tf` - Version Constraints

```hcl
terraform {
  required_version = ">= 1.9"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    # Add other providers as needed
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}
```

#### 2.2 `main.tf` - Core Configuration

```hcl
provider "azurerm" {
  features {}
}

locals {
  resource_group_name = "${var.prefix}-${var.name}-rg"
  
  common_tags = merge(var.tags, {
    environment = var.environment
    managed_by  = "terraform"
  })
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = var.location

  tags = local.common_tags
}
```

#### 2.3 `variables.tf` - Input Variables

```hcl
variable "name" {
  type        = string
  description = "Name of the application"
  default     = "myapp"
}

variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
  default     = "Southeast Asia"
}

variable "prefix" {
  type        = string
  description = "Prefix for globally-unique DNS-based resources"
  default     = "raztf"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

# Add service-specific variables here
```

#### 2.4 `outputs.tf` - Output Values

```hcl
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.default.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.default.location
}

# Add service-specific outputs here
```

### Step 3: Create Service-Specific Files

Create additional `.tf` files for each service type:

#### Example: `app_service.tf`

```hcl
locals {
  app_service_plan_name = "${var.prefix}-${var.name}-plan"
  webapp_name = "${var.prefix}-${var.name}-${var.environment}-webapp"
}

resource "azurerm_service_plan" "default" {
  name                = local.app_service_plan_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  os_type             = "Windows"
  sku_name            = var.plan_sku

  tags = local.common_tags
}

resource "azurerm_windows_web_app" "default" {
  name                = local.webapp_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  service_plan_id     = azurerm_service_plan.default.id

  site_config {
    always_on         = var.webapp_always_on
    use_32_bit_worker = var.webapp_use_32_bit_worker_process
    
    application_stack {
      dotnet_version = "v4.0"
    }
  }

  tags = local.common_tags
}
```

### Step 4: Create Documentation and Configuration

#### 4.1 `terraform.tfvars`

```hcl
# terraform.tfvars file
# Customize these values for your deployment

name        = "myapp"
environment = "dev"
location    = "Southeast Asia"
prefix      = "raztf"

# Service-specific configuration
# Add your variables here

# Tags
tags = {
  project     = "terraform-examples"
  owner       = "your-name"
  cost-center = "development"
}
```

#### 4.2 `readme.md` Template

```markdown
# [Template Title]

Brief description of what this template deploys.

## Architecture

This template creates:

- List of Azure resources
- That will be created

## Prerequisites

- Azure CLI or Azure PowerShell configured
- Terraform >= 1.9 installed
- An Azure subscription

## Quick Start

1. Clone this repository
2. Navigate to this template directory
3. Customize the variables in `terraform.tfvars` as needed
4. Run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

## Configuration

### Required Variables

List any required variables here.

### Optional Variables

| Name | Description | Default |
|-|-|-|
| variable | description | default |

## Outputs

| Name | Description |
|-|-|
| output | description |

## Cost Optimization

Describe the cost implications and optimization strategies.

## Notes

Any important notes about the template.
```

### Step 5: Add VS Code Tasks

Update `.vscode/tasks.json` to include tasks for your new template by following the existing pattern.

## Best Practices

### File Organization

1. **Keep related resources together** - Group resources by service type in separate files
2. **Use descriptive file names** - `app_service.tf`, `sql_database.tf`, etc.
3. **Consistent naming** - Follow the established naming patterns
4. **Logical separation** - Core infrastructure in `main.tf`, service-specific in dedicated files

### Naming Conventions

1. **Local values** - Use locals for resource names to ensure consistency
2. **Resource naming** - Follow Azure naming conventions and include environment/prefix
3. **Variable naming** - Use clear, descriptive names with proper descriptions
4. **File naming** - Use lowercase, hyphens for separation

### Documentation Standards

1. **Comprehensive README** - Include architecture, prerequisites, configuration, and examples
2. **Variable descriptions** - Every variable should have a clear description
3. **Output descriptions** - Every output should explain what it provides
4. **Example configurations** - Always provide working example tfvars

### Security and Best Practices

1. **No hardcoded secrets** - Use variables or Azure Key Vault references
2. **Appropriate defaults** - Use cost-optimized defaults
3. **Tag everything** - Consistent tagging strategy using locals
4. **Version constraints** - Specify provider and Terraform version requirements

This structure ensures that each template is completely standalone while maintaining consistency across the entire repository.

