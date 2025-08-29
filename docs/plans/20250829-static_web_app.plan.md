---
description: "Implementation plan for Azure Static Web App Terraform template"
created-date: 2025-08-29
---

# Implementation Plan for Azure Static Web App Template

## OBJECTIVE

Create a new standalone Terraform template (`102-static-web-app`) that demonstrates how to deploy an Azure Static Web App using the `azurerm_static_web_app` resource. This template should follow the established patterns in the RazTerraform project, providing a simple, deployable example that showcases the core functionality of Azure Static Web Apps.

## IMPLEMENTATION PLAN

- [x] Step 1: Create base template structure - **COMPLETED**
  - **Task**: Set up the foundational directory structure and files for the new Static Web App template following RazTerraform conventions
  - **Files**:
    - `examples/102-static-web-app/main.tf`: Main resource definitions with provider config, locals, and resource group
    - `examples/102-static-web-app/static_web_app.tf`: Static Web App resource configuration
    - `examples/102-static-web-app/variables.tf`: Input variables with validation and strong typing
    - `examples/102-static-web-app/outputs.tf`: Output values for important resource attributes
    - `examples/102-static-web-app/terraform.tf`: Provider version constraints and requirements
    - `examples/102-static-web-app/terraform.tfvars`: Example variable values for deployment
    - `examples/102-static-web-app/load-env.ps1`: PowerShell script for environment setup
    - `examples/102-static-web-app/README.md`: Documentation and usage instructions
  - **Dependencies**: None
  - **Completion Summary**: Successfully created the complete directory structure and all basic files for the 102-static-web-app template. All files have been created with placeholder content and proper structure following RazTerraform conventions.
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [x] Step 2: Implement Terraform configuration files - **COMPLETED**
  - **Task**: Create the core Terraform configuration files with proper resource definitions, variables, and outputs
  - **Files**:
    - `examples/102-static-web-app/terraform.tf`: Configure required providers (azurerm ~> 4.0, random ~> 3.7)
    - `examples/102-static-web-app/main.tf`: Provider config with features block, locals for naming, resource group
    - `examples/102-static-web-app/static_web_app.tf`: azurerm_static_web_app resource with proper configuration
    - `examples/102-static-web-app/variables.tf`: Variables for name, environment, location, prefix, SKU, tags with validation
    - `examples/102-static-web-app/outputs.tf`: Export static web app ID, default hostname, API key (sensitive)
  - **Dependencies**: Step 1 completion
  - **Completion Summary**: Successfully implemented all core Terraform configuration files with proper resource definitions, strongly-typed variables with validation, and comprehensive outputs. The template follows RazTerraform naming conventions and includes appropriate tags.
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [x] Step 3: Create configuration and documentation files - **COMPLETED**
  - **Task**: Implement the supporting files including example variables, environment setup script, and comprehensive documentation
  - **Files**:
    - `examples/102-static-web-app/terraform.tfvars`: Example values showing Free tier configuration
    - `examples/102-static-web-app/load-env.ps1`: PowerShell environment setup script (copy from existing examples)
    - `examples/102-static-web-app/README.md`: Comprehensive documentation with usage, deployment steps, outputs explanation
  - **Dependencies**: Step 2 completion
  - **Completion Summary**: Successfully created comprehensive documentation with detailed usage instructions, example terraform.tfvars with Free tier configuration, and environment setup script. The README includes architecture overview, prerequisites, configuration options, and next steps.
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [x] Step 4: Add VS Code tasks for the new template - **COMPLETED**
  - **Task**: Create VS Code tasks to support the new template's development workflow
  - **Files**:
    - `.vscode/tasks.json`: Add init, plan, apply, and destroy tasks for 102-static-web-app template
  - **Dependencies**: Step 3 completion
  - **Completion Summary**: Successfully added VS Code tasks for init, plan, apply, and destroy operations for the 102-static-web-app template. Tasks follow the existing pattern and include proper dependencies.
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [x] Step 5: Validate and test the template - **COMPLETED**
  - **Task**: Run comprehensive validation to ensure the template follows project conventions and is deployable
  - **Files**: All created files will be tested
  - **Dependencies**: Step 4 completion  
  - **Completion Summary**: Successfully validated the template with terraform fmt (no changes needed), terraform init (successful), terraform validate (configuration is valid), and terraform plan (creates 2 resources: resource group and static web app). All files follow naming conventions and the plan output shows correct resource names and tags.
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - Run terraform fmt to format all files
    - Run terraform init in the template directory
    - Run terraform validate to check configuration syntax
    - Run terraform plan to verify the template creates expected resources
    - Verify all files follow the naming conventions and patterns from tf.instructions.md
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [x] Step 6: Deploy and verify the Static Web App - **COMPLETED**
  - **Task**: Perform an actual deployment test to verify the template works end-to-end and produces a functional Static Web App
  - **Files**: Deployed Azure resources will be tested
  - **Dependencies**: Step 5 completion with successful validation
  - **Completion Summary**: Successfully deployed the Static Web App template end-to-end. The deployment created a resource group (rg-mystaticapp-dev) and Static Web App (raztf-mystaticapp-dev) in East Asia region. The Static Web App was accessible at <https://mango-sand-015e0c600.1.azurestaticapps.net> and returned HTTP 200. All outputs worked correctly including the sensitive API key. Resources were successfully destroyed after testing. Note: Had to change default location from "Southeast Asia" to "East Asia" as Southeast Asia is not available for Static Web Apps.
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - Navigate to examples/102-static-web-app directory
    - Run .\load-env.ps1 to set up environment
    - Run terraform apply to deploy the Static Web App
    - Verify the Static Web App is created in Azure portal
    - Test accessing the default hostname URL
    - Run terraform destroy to clean up resources after testing
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.
