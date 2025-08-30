# Load Environment Variables from .env file
# This script calls the centralized environment loader
# Usage: .\load-env.ps1

param(
    [string]$EnvFile = ".env",
    [switch]$Verbose
)

# Get the path to the centralized script
$scriptRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$centralScript = Join-Path $scriptRoot "scripts\load-env.ps1"

if (Test-Path $centralScript) {
    & $centralScript -EnvFile $EnvFile -Verbose:$Verbose
} else {
    Write-Host "Central load-env.ps1 script not found at: $centralScript" -ForegroundColor Red
    Write-Host "Please ensure the scripts/load-env.ps1 file exists in the repository root." -ForegroundColor Yellow
    exit 1
}