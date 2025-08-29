---
description: "Implementation plan for Azure Static Web App Terraform template"
created-date: 2025-08-29
---

# Implementation Plan for Azure Static Web App Template

## OBJECTIVE

Create a new standalone Terraform template (`102-static-web-app`) that demonstrates how to deploy an Azure Static Web App using the `azurerm_static_web_app` resource. This template should follow the established patterns in the RazTerraform project, providing a simple, deployable example that showcases the core functionality of Azure Static Web Apps.

## IMPLEMENTATION PLAN

- [ ] Step 1: Create base template structure
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
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 2: Implement Terraform configuration files
  - **Task**: Create the core Terraform configuration files with proper resource definitions, variables, and outputs
  - **Files**:
    - `examples/102-static-web-app/terraform.tf`: Configure required providers (azurerm ~> 4.0, random ~> 3.7)
    - `examples/102-static-web-app/main.tf`: Provider config with features block, locals for naming, resource group
    - `examples/102-static-web-app/static_web_app.tf`: azurerm_static_web_app resource with proper configuration
    - `examples/102-static-web-app/variables.tf`: Variables for name, environment, location, prefix, SKU, tags with validation
    - `examples/102-static-web-app/outputs.tf`: Export static web app ID, default hostname, API key (sensitive)
  - **Dependencies**: Step 1 completion
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 3: Create configuration and documentation files
  - **Task**: Implement the supporting files including example variables, environment setup script, and comprehensive documentation
  - **Files**:
    - `examples/102-static-web-app/terraform.tfvars`: Example values showing Free tier configuration
    - `examples/102-static-web-app/load-env.ps1`: PowerShell environment setup script (copy from existing examples)
    - `examples/102-static-web-app/README.md`: Comprehensive documentation with usage, deployment steps, outputs explanation
  - **Dependencies**: Step 2 completion
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 4: Add VS Code tasks for the new template
  - **Task**: Create VS Code tasks to support the new template's development workflow
  - **Files**:
    - `.vscode/tasks.json`: Add init, plan, apply, and destroy tasks for 102-static-web-app template
  - **Dependencies**: Step 3 completion
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

- [ ] Step 5: Validate and test the template
  - **Task**: Run comprehensive validation to ensure the template follows project conventions and is deployable
  - **Files**: All created files will be tested
  - **Dependencies**: Step 4 completion  
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

- [ ] Step 6: Deploy and verify the Static Web App
  - **Task**: Perform an actual deployment test to verify the template works end-to-end and produces a functional Static Web App
  - **Files**: Deployed Azure resources will be tested
  - **Dependencies**: Step 5 completion with successful validation
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
