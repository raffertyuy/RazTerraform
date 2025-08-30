# Vibe Coding Guide

It is possible to vibe code new terraform examples in this repo!
The recommended approach is to follow the [plan-implement-apply pattern](#vibe-coding-walkthrough-plan-implement-apply). This starts with running `/1-plan YOUR_IAC_REQUIREMENTS` in GitHub Copilot Chat.

If you want to go straight to the prompts, check out the files in the [.github/](/.github/) folder.

## Vibe Coding Walkthrough: Plan-Implement-Apply

We started with project by building the foundations for the _"plan-implement-run"_ pattern. The only difference is that instead of running an app, we are applying a Terraform template. Check out this [blog post](https://raffertyuy.com/raztype/vibe-coding-plan-implement-run/) to learn of its foundations.

### Step 1: Plan

Open up GitHub Copilot Chat and run one of the following:

```text
/1-plan YOUR_REQUIREMENTS_HERE
```

for example,

```text
/1-plan implement a template that uses the following
- Linux Web App
- Azure database for PostgreSQL
```

This will generate a new plan in [/docs/plans/](/docs/plans/). Review the generated plan and  keep iterating with the agent on what needs to be revised. See [demo video](https://youtu.be/yd37CcOL6iU).

> [!TIP]
> To see previously generated plans, check out the [/docs/plans/](/docs/plans/) folder.

At this point, you may want to commit the generated plan in a new branch. `/util.new-git-branch` does this.

### Step 2: Implement

```text
/2-implement #file:THE_GENERATED_PLAN.plan.md
```

This will begin the implementation process based on the plan. See [demo video](https://youtu.be/DO4G57EXwHk).

> [!TIP]
> If you are able, it is useful to actively read and check what the agent is doing. If you see that it is going the wrong direction, press the **STOP** button in the Copilot Chat panel and correct its course.

**The agent will stop implementation at some point, ask it to continue**
As the agent goes through the implementation plan, it will occassionally _"summarize the conversation history"_. This means that the agent's context window is full and it will try to summarize everything in the previous chat history.

**UNFORTUNATELY** this also means that some of the clear instructions in our `/2-implement` prompt was summarized, causing it to stop instead of continuing (that's my theory at least). If this happens, run:

```text
/continue-implementation-plan
```

> [!NOTE]
> This is the reason why we have repeated **"Additional Instructions"** on every step of the [plan](/.github/prompts/1-plan.prompt.md). We are assuming that the agent might summarize certain general instructions (Not sure, but I'm assuming that it might also summarize the instructions in [copilot-instructions](/.github/copilot-instructions.md)).

### Step 3: Apply

Once implementation is done, it's time to test deploying the Terraform template to an Azure environment. Most of the issues are usually found and fixed in this step. But you will need the following before proceeding:

1. An active Azure subscription
2. The necessary RBAC permissions to the Azure subscription (Owner or Contributor)

Once ready, run:

```text
/3-apply #file:THE_GENERATED_PLAN.plan.md
```

This will run `terraform apply` and fix the issues encountered. This step usually takes time (as running terraform plan, apply and destroy takes time). Watch the chat window actively and intervene if necessary. See [demo video](https://youtu.be/ionIxagdFXY).

Once finished, you are done! Commit and push the changes and repeat for other template implementations.

## Additional Utility Prompts, and more

There are other prompts found in the [.github/](/.github/) folder that are not mentioned in this guide. Explore this folder to see what they are.

Many of these are the _utility prompts_ (with the file format `util.*.prompt.md`). These are handy prompts that are useful for various regular tasks.
