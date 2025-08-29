# Infrastructure-as-Code Coding Standards

## Language-Specific Guidelines

### Terraform & Azure Infrastructure

For comprehensive Terraform, Azure infrastructure, and .tf file development standards, refer to:
**[Terraform Instructions](../instructions/tf.instructions.md)**

Key areas covered:

- AzureRM Provider 4.42.0 best practices
- Provider configuration with features block
- Resource naming conventions with native Azure patterns
- Strong typing and variable validation
- Template patterns and structure
- Security and RBAC configurations
- Dynamic blocks and conditional logic

## Code Structure and Organization

### File Organization

- Organize Terraform files by logical groupings: `main.tf`, `variables.tf`, `outputs.tf`, `terraform.tf`
- Use consistent template structure across all examples
- Place standalone templates in `/examples/` directory with descriptive naming
- Group related resources together in logical files (e.g., `app_service.tf`, `sql_database.tf`)
- Each template must be completely self-contained and deployable independently

### Naming Conventions

- Use descriptive, consistent naming for all infrastructure resources
- Follow Azure native naming conventions with descriptive patterns
- Use snake_case for variable names, resource names, and file names
- Use prefix-name-environment pattern: `${var.prefix}-${var.name}-${var.environment}`
- Use meaningful resource names that indicate purpose: `web_app_rg`, `storage_account_primary`
- Consider Azure service-specific naming requirements (e.g., storage accounts must be lowercase)

### Variable Management

- Use strongly-typed variables with explicit type definitions
- Always provide descriptions for variables with context and usage
- Implement validation rules for critical variables (environment, regions, etc.)
- Group related variables in object types for better organization
- Use `optional()` for non-required fields with sensible defaults
- Never hardcode values that should be configurable

## Terraform-Specific Guidelines

### Resource Definitions

- Always specify provider versions explicitly in `required_providers` block
- Use data sources to reference existing infrastructure components
- Implement proper resource dependencies with `depends_on` when implicit dependencies aren't sufficient
- Use `for_each` instead of `count` for creating multiple similar resources
- Implement proper resource lifecycle management with `lifecycle` blocks when needed

### Template Design

- Design templates to be standalone and self-contained
- Use composition approach - combine multiple resources in a single template
- Expose necessary outputs for reference by other templates or external systems
- Implement proper input validation within templates
- Include usage examples and configuration patterns

### Configuration Management

- Use `locals` blocks for computed values and data transformation
- Implement conditional logic with `try()`, `can()`, and `coalesce()` functions
- Use dynamic blocks for optional or repeated configuration blocks
- Merge tags consistently across all resources (global + resource-specific)
- Handle optional configurations gracefully with null checks

## Security Guidelines

### Credential Management

- Never hardcode credentials, subscription IDs, or sensitive data in Terraform files
- Use environment variables or secure credential stores for authentication
- Prefer Managed Identity authentication over service principals when possible
- Implement least-privilege access patterns for all Azure resources
- Use Azure Key Vault for storing and referencing secrets

### Network Security

- Implement network segmentation with Virtual Networks and subnets
- Configure Network Security Groups (NSGs) with restrictive rules
- Use Private Endpoints for Azure PaaS services when possible
- Implement proper firewall rules and access controls

### Resource Protection

- Enable soft delete and purge protection for critical resources
- Implement resource locks for production infrastructure
- Use Azure Policy for governance and compliance enforcement
- Configure backup and disaster recovery for stateful resources
- Implement proper RBAC assignments with minimal required permissions

## Code Quality Standards

### Validation and Formatting

- Run `terraform fmt` to ensure consistent formatting
- Execute `terraform validate` to check configuration syntax
- Use `terraform plan` to review changes before applying
- Use tools like TFLint for additional validation and best practice checks
- Implement proper input validation for all variables

### Error Handling and Resilience

- Implement proper error handling for resource creation and updates
- Use appropriate timeouts for long-running operations
- Handle resource dependencies and ordering correctly
- Use `try()`, `can()`, and `coalesce()` functions for graceful error handling
- Plan for resource cleanup and destruction procedures

### Code Documentation

- Add comments for complex logic, workarounds, or business requirements
- Document variable purposes, expected values, and constraints
- Explain resource relationships and dependencies
- Use meaningful variable and resource names that are self-documenting
- Maintain up-to-date README files for all templates

### Testing and Validation

- Test each template deployment in clean environments
- Validate template functionality across different configurations
- Implement validation scripts to verify template deployments
- Use automated testing tools where applicable
- Ensure templates work with different variable combinations

### Code Compliance

- Follow security best practices in code structure
- Implement proper RBAC patterns in templates
- Use secure defaults for all resource configurations
- Validate compliance with organizational coding policies
- Ensure templates follow established patterns and conventions

## Additional Guidelines

- Refer to the Terraform-specific instruction file in `.github/instructions/tf.instructions.md` for detailed .tf file coding standards
- Follow Azure best practices and Well-Architected Framework principles
- Keep up-to-date with Terraform and Azure provider updates
- Focus on creating standalone, deployable templates rather than reusable modules
- Ensure each template is complete and includes all necessary resources for its function


