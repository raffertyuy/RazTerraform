# Scripts Directory

This directory contains shared utility scripts used across multiple Terraform examples.

## Available Scripts

### load-env.ps1

A PowerShell script that loads environment variables from a `.env` file in the current directory.

**Usage:**

```powershell
# Basic usage
.\scripts\load-env.ps1

# Specify a different env file
.\scripts\load-env.ps1 -EnvFile ".env.production"

# Verbose output (shows actual values)
.\scripts\load-env.ps1 -Verbose
```

**Features:**

- ✅ Loads environment variables from `.env` files
- ✅ Skips comments and empty lines
- ✅ Handles quoted values
- ✅ Provides clear feedback and error messages
- ✅ Works from any example directory
- ✅ Supports verbose output for debugging

**Parameters:**

- `-EnvFile`: Path to the environment file (default: ".env")
- `-Verbose`: Show detailed output including variable values

This script is called by the local `load-env.ps1` files in each example directory, providing centralized maintenance while keeping the interface simple for users.
