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
dbt docs generate
dbt docs serve
```
