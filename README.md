# dbt GitHub Engineering Analytics

## Overview
This project demonstrates production-style dbt modeling
using GitHub engineering data, including staging layers,
intermediate transformations, marts, snapshots, and
incremental fact tables.

## Architecture
- DuckDB as the warehouse
- dbt-core for transformations
- Seeds used to simulate raw GitHub data

## Key dbt Features Demonstrated
- Source freshness and testing
- Staging / intermediate / mart layers
- Incremental fact models
- Late-arriving data handling
- Snapshots (SCD Type 2)
- dbt docs and lineage

## Incremental Model Bootstrapping
The `fct_pr_cycle_time` model requires an initial historical
backfill before incremental logic is applied. Subsequent runs
process only new or updated pull requests.

## How to Run

### macOS / Linux
```bash
./run_dbt.sh
```

### Windows
```bash
.\run_dbt.ps1
```

## Docs
Run:
```bash
cd github_analytics
dbt docs generate
dbt docs serve
```

## Key Learnings
- Incremental models are stateful and require careful bootstrapping
- Compiled SQL is not the same as executed SQL in dbt
- DuckDB incremental behavior differs from cloud warehouses
- CI environments require explicit path handling

## Why DuckDB?

DuckDB was chosen as the warehouse for this project to enable a fully
local, reproducible dbt workflow without requiring cloud infrastructure.

Key reasons for this choice:

- **Zero setup**: DuckDB runs as an embedded database, allowing the project
  to be executed locally with no external services or credentials.
- **Production-like SQL engine**: DuckDB supports analytical SQL features
  such as window functions, CTEs, and columnar execution, making it suitable
  for realistic analytics modeling.
- **CI-friendly**: DuckDB works well in ephemeral CI environments (e.g.
  GitHub Actions), enabling automated dbt validation without provisioning
  cloud warehouses.
- **Intentional tradeoffs**: While DuckDB differs from cloud warehouses in
  some behaviors (e.g. incremental compilation semantics), these differences
  are documented and handled explicitly in this project.

In production environments, this project’s models and patterns are directly
portable to cloud data warehouses such as Snowflake or BigQuery with minimal
SQL changes.