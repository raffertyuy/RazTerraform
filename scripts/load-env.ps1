# Load Environment Variables from .env file
# This script loads environment variables from a .env file in the current directory
# Usage: .\scripts\load-env.ps1

param(
    [string]$EnvFile = ".env",
    [switch]$Verbose
)

function Write-ColoredOutput {
    param(
        [string]$Message,
        [ConsoleColor]$Color = [ConsoleColor]::White
    )
    Write-Host $Message -ForegroundColor $Color
}

function Load-EnvFile {
    param(
        [string]$FilePath
    )
    
    if (-not (Test-Path $FilePath)) {
        Write-ColoredOutput "No $FilePath file found in current directory." Red
        Write-ColoredOutput "Please copy .env.example to .env and configure your values." Yellow
        Write-ColoredOutput ""
        Write-ColoredOutput "Quick setup:" Cyan
        Write-ColoredOutput "  cp .env.example .env" White
        Write-ColoredOutput "  # Edit .env with your Azure subscription ID" Gray
        Write-ColoredOutput "  .\scripts\load-env.ps1" White
        return $false
    }

    Write-ColoredOutput "Loading environment variables from $FilePath..." Green
    Write-ColoredOutput ""

    $loadedCount = 0
    Get-Content $FilePath | ForEach-Object {
        $line = $_.Trim()
        
        # Skip empty lines and comments
        if ($line -eq "" -or $line.StartsWith("#")) {
            return
        }
        
        # Parse key=value pairs
        if ($line -match '^([^=]+)=(.*)$') {
            $varName = $matches[1].Trim()
            $varValue = $matches[2].Trim()
            
            # Remove quotes if present
            if (($varValue.StartsWith('"') -and $varValue.EndsWith('"')) -or 
                ($varValue.StartsWith("'") -and $varValue.EndsWith("'"))) {
                $varValue = $varValue.Substring(1, $varValue.Length - 2)
            }
            
            [Environment]::SetEnvironmentVariable($varName, $varValue, 'Process')
            
            if ($Verbose) {
                Write-ColoredOutput "  Set $varName = $varValue" Yellow
            } else {
                Write-ColoredOutput "  ✓ $varName" Yellow
            }
            $loadedCount++
        }
    }
    
    Write-ColoredOutput ""
    Write-ColoredOutput "Successfully loaded $loadedCount environment variable(s)!" Green
    Write-ColoredOutput ""
    Write-ColoredOutput "You can now run Terraform commands:" Cyan
    Write-ColoredOutput "  terraform init" White
    Write-ColoredOutput "  terraform plan" White
    Write-ColoredOutput "  terraform apply" White
    
    return $true
}

# Main execution
$currentDir = Get-Location
Write-ColoredOutput "Loading environment variables for: $currentDir" Magenta
Write-ColoredOutput ""

$success = Load-EnvFile -FilePath $EnvFile

if (-not $success) {
    exit 1
}