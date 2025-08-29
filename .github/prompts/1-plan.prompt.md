---
description: 'Plan an implementation'
---

Your goal is to generate an implementation plan, in a new markdown .md file, for the terraform module provided to you. Create this file in `/docs/plans/<module_name>.plan.md`.

## RULES:
- Keep implementations simple, do not over architect
- Do not generate real code for your plan, pseudocode is OK
- For each step in your plan, include the objective of the step, the steps to achieve that objective, and any necessary pseudocode.
- Call out any necessary user intervention required for each step
- Consider accessibility part of each step and not a separate step

## Steps to Follow
### 1. FIRST
- Review the attached specification document to understand the requirements and objectives.
- If needed, refer to https://registry.terraform.io/providers/Azure/azapi/2.4.0/docs/resources/<resource> using the #fetch tool (use AzAPI v2.4.0 only).

### 2. THEN
- Create a detailed implementation plan that outlines the steps needed to achieve the objectives of the specification document.
- Think about the file types that will be created, and review the file `/docs/file_structure.md` as well as instructions for the relevant file in the `/.github/instructions/` folder. For example, follow the instructions in `/.github/instructions/tf.instructions.md` for `*.tf` files.
- The plan should be structured, clear, and easy to follow.
- Always add validation steps in your plan to ensure the implementation meets the requirements.
- Structure your plan as follows, and output as Markdown code block

```markdown
# Implementation Plan for [Spec Name]

- [ ] Step 1: [Brief title]
  - **Task**: [Detailed explanation of what needs to be implemented]
  - **Files**: [Maximum of 20 files, ideally less]
    - `path/to/file1.tf`: [Description of changes], [Pseudocode for implementation]
  - **Dependencies**: [Dependencies for step]

[Additional steps...]
```

### 3. NEXT:
- Validate and self-review your plan to ensure it meets the requirements and is ready for implementation.
- Iterate with me until I am satisifed with the plan

### 4. FINALLY:
- DO NOT start implementation without my permission.