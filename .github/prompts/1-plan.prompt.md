---
mode: "aztf-agent"
description: 'Plan an implementation'
---

Your goal is to generate an implementation plan, in a new markdown .md file, for the infra-as-code requirement provided to you.
Create this plan in a new markdown .md file in `/docs/plans/YYYYMMDD-<requirement_name>.plan.md`, for the requirement provided to you. You can decide on the appropriate requirement name.
For example, if the today's date is 2025-08-22 and the requirement name is "LAMP Stack", the file should be created as `/docs/plans/20250822-lamp_stack.plan.md`.

## RULES:
- Keep implementations simple, do not over architect
- Do not generate real code for your plan, pseudocode is OK
- For each step in your plan, include the objective of the step, the steps to achieve that objective, and any necessary pseudocode.
- Call out any necessary user intervention required for each step
- Consider accessibility part of each step and not a separate step

## Steps to Follow
### 1. FIRST
- Review the attached specification document to understand the requirements and objectives.
- If needed, use the available mcp servers (terraform, azure, context7) to know the latest documentation.

### 2. THEN
- Create a detailed implementation plan that outlines the steps needed to achieve the objectives of the specification document.
- The plan should be structured, clear, and easy to follow.

- Add a frontmatter to the implementation plan

```markdown
---
description: "Implementation plan for <requirement>"
created-date: YYYY-MM-DD
---

# Implementation Plan for [Spec Name]

## OBJECTIVE

OBJECTIVE/REQUIREMENT/TASK HERE

PLAN HERE
```

- Always add validation steps in your plan to ensure the implementation meets the requirements.
- Structure your plan as follows, and output as Markdown code block

```markdown
## IMPLEMENTATION PLAN

- [ ] Step 1: [Brief title]
  - **Task**: [Detailed explanation of what needs to be implemented]
  - **Files**: [Maximum of 20 files, ideally less]
    - `path/to/file1.ts`: [Description of changes], [Pseudocode for implementation]
  - **Dependencies**: [Dependencies for step]
  - **Additional Instructions**:
    - Before proceeding with this step, check the conversation history and see if you already completed this step.
    - You do not need to follow this step strictly, consider the output of the previous step and adjust this step as needed.
    - If you are fixing issues that arise from automated tests, ALWAYS take a step back before fixing things, consider that the test script itself might be wrong and that's the one that you should fix. Sometimes the best way to fix a script is to understand the intent of the test script and simplify it.
    - If you are running any CLI command, follow [cli-execution-instructions](/.github/prompt-snippets/cli-execution-instructions.md)
    - When you are done with this step, mark this step as complete and add a note/summary of what you did (in the plan document) before proceeding to the next step.
    - If you decide to proceed to the next step even if there are remaining issues/errors/failed tests, make a note of the issues (by updating the plan document) and address them in subsequent steps.

[Additional steps...]
```

- After the steps to implement the objective, add a step to run the app and test it against the original objective specified in the plan. Use the right tool to test this (playwright MCP, CLI, or something else).
```

- Make sure there is a step to validate the plan and run `terraform plan`.

### 3. NEXT:

- Validate and self-review your plan to ensure it meets the requirements and is ready for implementation.
- Make sure that there is NO step that runs `terraform apply`. I repeat, DO NOT RUN `terraform apply`. If there is a step like this, remove it. Instead, remind me to review your changes.
- Iterate with me until I am satisifed with the plan

### 4. FINALLY:

- Add a step to update [file_structure.md](/docs/file_structure.md). Make sure to follow the [file_structure-update-rules](../prompt-snippets/file_structure-update-rules.md).
- Make sure the plan document ends with a new line (for markdown linting compliance).
- DO NOT start implementation without my permission.