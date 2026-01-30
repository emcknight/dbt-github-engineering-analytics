select
    issue_id,
    repository,
    author as contributor,
    issue_type,
    status,
    created_at,
    closed_at,
    days_open,
    is_closed
from {{ ref('int_issue_lifecycle') }}
