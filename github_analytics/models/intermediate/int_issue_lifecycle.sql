with issues as (
    select *
    from {{ ref('stg_github_issues') }}
),

calculated as (
    select
        issue_id,
        repository,
        author,
        issue_type,
        status,
        created_at,
        closed_at,
        -- lifecycle metrics
        case
            when closed_at is not null
                then datediff('day', created_at, closed_at)
            else datediff('day', created_at, current_timestamp)
        end as days_open,
        case
            when status = 'closed' then true
            else false
        end as is_closed
    from issues
)

select *
from calculated
