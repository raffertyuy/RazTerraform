---
applyTo: '**/*.tf'
---

# RazTerraform - Standalone Template Implementation Guidelines

## Quick Reference Summary

- **Provider:** AzureRM v4.42.0. DO NOT use `azapi`.
- **Architecture:** Standalone, self-contained templates (not modules)
- **Run Location:** Always from individual template directory (`examples/xxx/`)
- **Sensitive Data:** Never hardcode credentials or subscription IDs, use Azure CLI auth
- **Resource Verification:** Always check resource arguments against latest provider docs
- **Variable Typing:** Use strong types, descriptions, and constraints
- **Template Structure:** Each template must be complete and deployable independently
- **Validation:** Run `terraform fmt` and `terraform validate` before commit
- **Features Block:** Always include `features {}` block in provider configuration

---

## DO
- Use only AzureRM provider version 4.42.0 (latest stable)
- Pin the provider version in required_providers block
- Always include `features {}` block in provider configuration
- Use `Southeast Asia` as the default Azure region (project default)
- Create standalone, self-contained templates in `/examples/`
- Use dynamic blocks for optional/flexible config
- Use nested maps and strongly-typed objects for variables
- Use `locals` for preprocessing and resource naming
- Use `try()` for error handling and parameter fallbacks
- Merge tags (resource-specific + global)
- Use descriptive naming with prefix/name/environment pattern
- Add input validation in `variables.tf`
- Ensure each template is complete and deployable independently
- Update template README.md with usage and examples
- Reference provider docs for every resource: https://registry.terraform.io/providers/hashicorp/azurerm/4.42.0/docs/resources/<resource>
- Use Azure MCP server to find the latest API version, detailed schema, and attributes for each resource implemented
- Prefer Azure CLI authentication for local development
- Use least privilege RBAC assignments
- Enable soft delete and purge protection for critical resources

## DO NOT
- Do not embed subscription IDs or credentials in code/config
- Do not use untyped or weakly-typed variables
- Do not create dependencies between templates (each must be standalone)
- Do not commit without running `terraform fmt` and `terraform validate`
- Do not use AzureRM provider versions other than 4.42.0
- Do not use the azapi provider
- Do not hardcode resource names without using descriptive naming patterns
- Do not skip the features block in provider configuration
- Do not use external naming providers like azurecaf (use native Azure naming)
- Do not create reusable modules (this project uses standalone templates)

---

## Key Template Patterns
- Each template is completely self-contained and deployable independently
- Use dynamic blocks for optional/flexible config
- Input variables: strongly-typed with validation and defaults
- Organize resources logically across multiple .tf files

---

## Code Conventions
- Each template: `main.tf`, `variables.tf`, `outputs.tf`, `terraform.tf`
- Use `locals` for preprocessing and resource naming
- Use `try()` for optional/defaulted params
- Merge tags (resource + global)
- Use descriptive naming: `--`

---

## Common Patterns

**Provider Configuration:**
```hcl
terraform {
  required_version = ">= 1.9"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}
```

**Resource Creation with Native Naming:**
```hcl
locals {
  resource_group_name = "--rg"
  common_tags = merge(var.tags, {
    environment = var.environment
    managed_by  = "terraform"
  })
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.common_tags
}
```

**Variable Structure and Typing:**
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
  
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test, or prod."
  }
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
  description = "A mapping of tags to assign to resources"
  default     = {}
}
```

**Template Resource Definition:**
```hcl
# Main template resources (from main.tf)
provider "azurerm" {
  features {}
}

locals {
  resource_group_name   = "--rg"
  app_service_plan_name = "--plan"
  webapp_name           = "---webapp"
  
  common_tags = merge(var.tags, {
    environment = var.environment
    managed_by  = "terraform"
  })
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.common_tags
}
```

**Variable Validation:**
```hcl
variable "environment_type" {
  description = "The type of environment to deploy (dev, test, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment_type)
    error_message = "Environment type must be one of: dev, test, prod."
  }
}

variable "allowed_ip_ranges" {
  description = "List of allowed IP ranges in CIDR format"
  type        = list(string)
  validation {
    condition     = alltrue([for ip in var.allowed_ip_ranges : can(cidrhost(ip, 0))])
    error_message = "All elements must be valid CIDR notation IP addresses."
  }
}
```

**Dynamic Blocks Implementation:**
```hcl
resource "azurerm_key_vault" "kv" {
  name                = local.key_vault_name
  location            = var.location
  resource_group_name = azurerm_resource_group.default.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  
  dynamic "network_acls" {
    for_each = var.network_acls != null ? [var.network_acls] : []
    content {
      default_action             = network_acls.value.default_action
      bypass                     = network_acls.value.bypass
      ip_rules                   = try(network_acls.value.ip_rules, [])
      virtual_network_subnet_ids = try(network_acls.value.subnets, [])
    }
  }
  
  tags = local.common_tags
}
```

---

## Template Patterns
- Each template is standalone in `/examples/xxx-template-name/`
- Include `terraform.tfvars` with example values
- Organize resources across logical .tf files (main.tf, app_service.tf, sql_database.tf)
- Use locals for resource naming and tag merging

---

## Execution Instructions
- Navigate to template directory:
  ```bash
  cd examples/101-web-app-windows-dotnet
  ```
- Set up authentication:
  ```bash
  # Load environment variables
  .\load-env.ps1
  ```
- Deploy template:
  ```bash
  terraform init
  terraform plan
  terraform apply
  ```
- Destroy resources:
  ```bash
  terraform destroy
  ```
- Authentication uses Azure CLI by default (recommended for development):
  ```bash
  az login
  az account set --subscription "your-subscription-id"
  ```

---

## Testing & Validation
- Add input validation in `variables.tf`
- Ensure template is complete and deployable independently
- Update template README.md with usage and examples
- Test template deployment in clean environment
- Run `terraform validate` and `terraform fmt` before commit

---

## Common Helper Patterns
- `try(var.settings.property, default_value)` for fallbacks
- `lookup(map, key, default)` for map access
- `can(tostring(var.something))` for conditional evaluation
- `for_each = toset(var.subnet_names)` for multiple resources
- `coalesce(var.custom_name, local.default_name)` for first non-null value

---

## AzureRM Provider Specific Patterns

**Data Sources for Current Configuration:**
```hcl
data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}
```

**Resource Naming with Native Patterns:**
```hcl
locals {
  # Storage account names must be globally unique and lowercase
  storage_account_name = lower("st")
  
  # Other resource names with descriptive patterns
  key_vault_name = "---kv"
  app_service_name = "---webapp"
  
  # Ensure names meet Azure requirements
  sql_server_name = lower(replace("--sqlsvr", "-", ""))
}
```

**Identity and Access Management:**
```hcl
resource "azurerm_user_assigned_identity" "this" {
  name                = local.identity_name
  location            = var.location
  resource_group_name = azurerm_resource_group.default.name
  tags                = local.common_tags
}

resource "azurerm_role_assignment" "this" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}
```

**Validation Approach:**
- Always run `terraform plan` to validate resource configuration
- Check AzureRM provider documentation for exact argument names and types
- Use Azure MCP server tools to verify latest resource schemas
- Test changes with TFLint, `terraform fmt` and `terraform validate`
- Validate RBAC assignments and security configurations

---

## Security Best Practices
- Use `sensitive = true` for secret variables
- Never hardcode credentials
- Use least privilege IAM roles
- Use NSGs and private endpoints
- Store state files securely with locking
- Use key vaults for sensitive values

---

## Documentation Reference
- See README.md in each template
- See `/examples/` for standalone templates
- See `docs/file_structure.md` for template creation guide
- Always verify resource arguments at: https://registry.terraform.io/providers/hashicorp/azurerm/4.42.0/docs/resources/<resource>
- AzureRM Provider Features Block: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block
- Authentication Guide: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli

---

## AI Assistant Prompt Guidance
- When asked to generate Terraform code, always:
  - Check the provider version is AzureRM v4.42.0
  - Include the features {} block in provider configuration
  - Use strong typing for variables with descriptions and validation
  - Use descriptive naming patterns with prefix-name-environment structure
  - Include input validation where appropriate
  - Use locals for resource naming and tag merging
  - Include proper tags using merge()
  - Reference the latest provider documentation
  - Ensure template is standalone and complete
  - Update template README.md with usage guidance
  - Use Azure CLI authentication for development
  - Enable soft delete for critical resources
  - Follow the examples/xxx-template-name/ directory structure
