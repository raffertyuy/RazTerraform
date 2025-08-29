---
mode: "agent"
description: "Update local git and clean up branches"
---

Get the latest from the remote repository and clean up the local branches that no longer exist on the remote.

Pull the latest from the main branch

For the branches that exist locally

- Check if it was deleted upstream (probably due to a pull request that was merged which auto-deleted the branch). Delete these branches.
- DO NOT delete branches that only exist locally but not upstream.

If you're not sure what to do, ask me.
