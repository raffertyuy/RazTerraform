---
description: 'Test the Terraform module implementation by running `terraform plan` and `terraform apply`'
---
Your task is to run `terraform plan` and then `terraform apply` on the `configuration.tfvars` of the terraform module provided to you. And then fix any issues that arise during the process. You will be working with the Terraform module located in `~/modules/<module_name>`.

Fix issues as they arise during the process, and ensure that the module is applied correctly.
Refer to the following to better understand the implementation done before fixing:
  - The `~/modules/<module_name>/README.md` file for usage instructions.
  - The `~/CHANGES_SUMMARY.md` file for recent changes and updates.
  - The `~/docs/plans/<module_name>.plan.md` file for the implementation plan

## Steps to Follow
### 1. PREPARATION
- Ensure that the CLI is authenticated with `az login`. If not, run `az login` so that I can authenticate and select my desired Azure subscription.
- Ensure `ARM_SUBSCRIPTION_ID` environment variable is set to the selected Azure subscription ID.
- Run `terraform init` on the workspace root folder to initialize the Terraform environment.

### 2. CONFIGURATION
- Look for the example `configuration.tfvars` of the terraform module to be applied. This file should be in the `/examples/<module_name>/simple_case` folder.
- ONLY look for the `simple_case` example unless otherwise specified.
- Check the Azure region specified in the `configuration.tfvars` file and confirm this with me. Change the region if I specify a different one.

### 3. TERRAFORM PLAN (MANDATORY STEP - DO NOT SKIP)
- **REQUIRED**: Run `terraform plan -var-file=examples/<module_name>/simple_case/configuration.tfvars` to see the planned changes.
- Review the plan output carefully
- Fix any issues that arise during the plan step
- Confirm that the plan shows the expected resources to be created/modified
- **ONLY proceed to step 4 after a successful plan with no errors**

### 4. TERRAFORM APPLY (ONLY AFTER SUCCESSFUL PLAN)
- **Prerequisites**: Step 3 (terraform plan) must be completed successfully with no errors
- Run `terraform apply -auto-approve -var-file=examples/<module_name>/simple_case/configuration.tfvars` to apply the changes
- Monitor the apply process for any issues
- **REMINDER**: This step should ONLY be executed after a successful terraform plan

### 5. POST-APPLY CHECKS
- Ask me to confirm that the resources have been created successfully by checking the Azure portal.