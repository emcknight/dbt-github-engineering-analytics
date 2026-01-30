select distinct
    repository
from {{ ref('stg_github_issues') }}
