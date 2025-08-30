# CLI Execution Instructions

Before running any CLI command, make sure that the terminal is in the right directory.

- For example, if you are running a terraform example, navigate to the directory of that example first.
- Once you are in the correct directory, run `load-env.ps1` to ensure that the environment variables are properly set. 

When running commands, be mindful of the operating system as the paths and environment variables may differ. Use relative paths when possible.

When running commands, be mindful if you are running something that is watching. Run commands as background processes as much as possible to avoid blocking the terminal. Check if if the existing terminal is ready to accept new commands first. Be mindful if the terminal is ready to accept commands or if a previous command is still running. Evaluate if you need to launch a new terminal.
