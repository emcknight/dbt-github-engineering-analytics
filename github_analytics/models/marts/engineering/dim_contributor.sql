with contributors as (
    select author from {{ ref('stg_github_issues') }}
    union
    select author from {{ ref('stg_github_pull_requests') }}
    union
    select author from {{ ref('stg_github_commits') }}
)

select distinct
    author as contributor
from contributors
