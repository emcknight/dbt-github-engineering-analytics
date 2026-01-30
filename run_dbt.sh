#!/usr/bin/env bash
set -e

# Get absolute path to repo root (where this script lives)
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export DBT_PROFILES_DIR="$REPO_ROOT/github_analytics/profiles"

cd "$REPO_ROOT/github_analytics"

dbt seed
dbt run
dbt test