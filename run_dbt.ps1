# Stop execution if any command fails
$ErrorActionPreference = "Stop"

# Get absolute path to repo root (where this script lives)
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

# Set dbt profiles directory (inside dbt project)
$env:DBT_PROFILES_DIR = "$RepoRoot\github_analytics\profiles"

# Move into dbt project directory
Set-Location "$RepoRoot\github_analytics"

# Run dbt workflow
dbt seed
dbt run
dbt test
