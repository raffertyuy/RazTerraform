---
description: "Implementation plan for ReactJS Web App with Azure Functions, Application Insights, and PostgreSQL"
created-date: 2025-08-30
---

# Implementation Plan for ReactJS Web App with Azure Functions and PostgreSQL

## OBJECTIVE

Create a Terraform example for a complete web application stack that includes:

- Linux Web App hosting a ReactJS application
- Linux Azure Functions for serverless backend logic
- Application Insights for monitoring and telemetry
- Azure Database for PostgreSQL (Flexible Server) for data storage
- All components configured on the lowest pricing tiers for cost optimization

## IMPLEMENTATION PLAN

- [ ] Step 1: Create project structure and base configuration
  - **Task**: Set up the directory structure and base Terraform configuration files following the RazTerraform project patterns
  - **Files**: [Maximum of 10 files]
    - `examples/103-react-app-postgres-stack/main.tf`: Main resource definitions with provider configuration, resource group, and shared locals
    - `examples/103-react-app-postgres-stack/variables.tf`: Variable definitions with strong typing, validation, and defaults for lowest pricing tiers
    - `examples/103-react-app-postgres-stack/outputs.tf`: Output definitions for key resource properties (URLs, connection strings, etc.)
    - `examples/103-react-app-postgres-stack/terraform.tf`: Provider requirements and version constraints
    - `examples/103-react-app-postgres-stack/terraform.tfvars`: Example values for all variables
    - `examples/103-react-app-postgres-stack/load-env.ps1`: PowerShell script for environment setup
    - `examples/103-react-app-postgres-stack/README.md`: Documentation with usage instructions and architecture overview
  - **Dependencies**: None
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - Follow the RazTerraform project conventions from tf.instructions.md
    - Use AzureRM provider version ~> 4.0 with proper features block
    - Set default location to "Southeast Asia" per project standards
    - Use descriptive naming pattern: `prefix-name-environment-type`
    - Configure for lowest pricing tiers: Free/F1 for App Service Plan, B_Standard_B1ms for PostgreSQL, etc.
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 2: Implement App Service Plan and Linux Web App
  - **Task**: Create the App Service Plan and Linux Web App configured for ReactJS hosting on the lowest tier
  - **Files**: [Maximum of 2 files]
    - `examples/103-react-app-postgres-stack/web_app.tf`: App Service Plan (Free F1 tier) and Linux Web App with Node.js runtime for React, configured with proper site_config for static serving
  - **Dependencies**: Step 1 completed
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - Use Free tier (F1) for App Service Plan to minimize costs
    - Configure Linux Web App with Node.js runtime (latest supported version)
    - Set up site_config for static file serving suitable for React apps
    - Configure app_settings for React production build
    - Set always_on to false (required for Free tier)
    - Set use_32_bit_worker to true (required for Free tier)
    - Include proper tags using local.common_tags pattern
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 3: Implement Azure Functions with Storage Account  
  - **Task**: Create Storage Account and Linux Function App for serverless backend functionality
  - **Files**: [Maximum of 2 files]
    - `examples/103-react-app-postgres-stack/function_app.tf`: Storage Account (Standard LRS) and Linux Function App with Node.js runtime, configured for lowest cost consumption plan
  - **Dependencies**: Step 2 completed  
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - Create Storage Account with Standard tier and LRS replication for cost optimization
    - Use App Service Plan from Step 2 (shared between web app and function app) or create separate consumption plan
    - Configure Linux Function App with Node.js runtime (same version as web app)
    - Set up proper site_config with minimal settings for cost optimization
    - Include functions_extension_version = "~4" for latest runtime
    - Configure storage_account_name and storage_account_access_key properly
    - Include managed identity configuration for secure access patterns
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 4: Implement PostgreSQL Flexible Server
  - **Task**: Create Azure Database for PostgreSQL Flexible Server configured for lowest cost tier
  - **Files**: [Maximum of 2 files]
    - `examples/103-react-app-postgres-stack/postgresql.tf`: PostgreSQL Flexible Server with B_Standard_B1ms SKU, minimal storage, and basic configuration for development workloads
  - **Dependencies**: Step 3 completed
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - Use B_Standard_B1ms SKU for lowest cost (Burstable tier)
    - Set storage_mb to 32768 (32GB - minimum allowed)
    - Set storage_tier to P4 (default for 32GB)
    - Configure version = "16" (latest supported PostgreSQL version)
    - Set geo_redundant_backup_enabled = false to reduce costs
    - Set backup_retention_days = 7 (minimum allowed)
    - Configure public_network_access_enabled = true for simplicity (can be secured later)
    - Set up administrator credentials using variables with sensitive = true
    - Include firewall rule for Azure services access
    - Create a default database for the application
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 5: Implement Application Insights and monitoring
  - **Task**: Create Application Insights component and configure monitoring for both web app and function app
  - **Files**: [Maximum of 2 files]
    - `examples/103-react-app-postgres-stack/monitoring.tf`: Application Insights component with web application type, and integration configuration for web app and function app
  - **Dependencies**: Step 4 completed
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - Create Application Insights with application_type = "web"
    - Set retention_in_days = 90 (default for cost optimization)
    - Set daily_data_cap_in_gb = 100 (default limit)
    - Set sampling_percentage = 100 (full sampling for development)
    - Configure connection_string and instrumentation_key outputs
    - Update web_app.tf to include Application Insights connection string in app_settings
    - Update function_app.tf to include Application Insights configuration
    - Add APPINSIGHTS_INSTRUMENTATIONKEY and APPLICATIONINSIGHTS_CONNECTION_STRING to both app_settings
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 6: Configure environment variables and connection strings
  - **Task**: Set up proper configuration for connecting all components together with environment variables and connection strings
  - **Files**: [Maximum of 4 files to update]
    - Update `examples/103-react-app-postgres-stack/web_app.tf`: Add PostgreSQL connection string and Application Insights configuration to app_settings
    - Update `examples/103-react-app-postgres-stack/function_app.tf`: Add PostgreSQL connection string to connection_strings block and Application Insights to app_settings
    - Update `examples/103-react-app-postgres-stack/outputs.tf`: Add all necessary outputs for connection strings, URLs, and keys
    - Update `examples/103-react-app-postgres-stack/variables.tf`: Add any missing variables for database credentials and application configuration
  - **Dependencies**: Step 5 completed
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - Configure PostgreSQL connection string in format: `Server=${azurerm_postgresql_flexible_server.main.fqdn};Database=${azurerm_postgresql_flexible_server_database.main.name};Port=5432;User Id=${var.postgresql_admin_username};Password=${var.postgresql_admin_password};Ssl Mode=Require;`
    - Add connection string as type "PostgreSQL" in function app connection_strings block
    - Add database URL as environment variable for React app (if needed for client-side configuration)
    - Ensure Application Insights keys are properly configured in both web app and function app
    - Add outputs for web app URL, function app URL, database connection details, and Application Insights keys
    - Mark sensitive outputs appropriately (connection strings, passwords, keys)
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 7: Create comprehensive documentation and example configuration
  - **Task**: Complete the README.md with architecture overview, deployment instructions, and usage examples
  - **Files**: [Maximum of 3 files to update]
    - Update `examples/103-react-app-postgres-stack/README.md`: Complete documentation with architecture diagram, prerequisites, deployment steps, and usage examples  
    - Update `examples/103-react-app-postgres-stack/terraform.tfvars`: Complete example values for all variables
    - Update `examples/103-react-app-postgres-stack/load-env.ps1`: Finalize environment setup script with all necessary variables
  - **Dependencies**: Step 6 completed
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - Document the complete architecture including data flow between components
    - Provide step-by-step deployment instructions
    - Include prerequisites (Azure CLI, Terraform, Node.js for React development)
    - Document environment variables and their purposes
    - Provide example React app configuration for connecting to Azure Functions and Application Insights
    - Include example Function App code structure and PostgreSQL connection patterns
    - Document cost optimization settings and tier selections
    - Include troubleshooting section for common deployment issues
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 8: Validate Terraform configuration and test deployment
  - **Task**: Run terraform fmt, validate, init, and plan to ensure configuration is correct and deployable
  - **Files**: [No new files, validation only]
  - **Dependencies**: Step 7 completed
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - Navigate to the example directory: `cd examples/103-react-app-postgres-stack`
    - Run `terraform fmt` to format all .tf files
    - Run `terraform validate` to check syntax and configuration
    - Run `terraform init` to initialize the working directory
    - Run `terraform plan` to validate the deployment plan
    - Verify all resources are configured correctly with proper dependencies
    - Check that all lowest-tier configurations are applied correctly
    - Ensure all required variables have appropriate defaults or examples
    - Verify outputs are properly defined and marked as sensitive where appropriate
    - Fix any validation errors or warnings that arise
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 9: Update file structure documentation
  - **Task**: Update the project's file_structure.md to include the new example template
  - **Files**: [Maximum of 1 file to update]
    - `docs/file_structure.md`: Add the new 103-react-app-postgres-stack example to the examples section following the established pattern
  - **Dependencies**: Step 8 completed
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - Follow the [file_structure-update-rules](/.github/prompt-snippets/file_structure-update-rules.md) exactly
    - Add the new example directory with all its files to the examples section
    - Include descriptive comments for each file explaining its purpose
    - Update the change log at the bottom with today's date and a description of the addition
    - Ensure the format matches the existing structure documentation
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

## VALIDATION

After completing all implementation steps, the plan should be validated by:

1. Successful `terraform plan` execution without errors
2. All resources configured for lowest pricing tiers
3. Proper integration between all components (web app, functions, database, monitoring)
4. Complete documentation with usage examples
5. All files following RazTerraform project conventions

## IMPORTANT NOTES

- **DO NOT RUN `terraform apply`** - This plan is for infrastructure code creation only
- All configurations target the lowest available pricing tiers for cost optimization
- The implementation should be reviewed before any actual deployment
- Follow all security best practices including proper credential management
- Ensure all sensitive values are marked appropriately and not hardcoded

## COST OPTIMIZATION SUMMARY

The following tier selections ensure minimal costs:

- App Service Plan: Free (F1) tier
- PostgreSQL Flexible Server: Burstable B_Standard_B1ms with 32GB storage
- Storage Account: Standard LRS replication
- Application Insights: Default settings with 90-day retention
- All backup and redundancy features set to minimum levels
