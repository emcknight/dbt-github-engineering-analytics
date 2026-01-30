with prs as (
    select *
    from {{ ref('stg_github_pull_requests') }}
),

commits as (
    select
        pr_id,
        count(*) as commit_count
    from {{ ref('stg_github_commits') }}
    group by pr_id
),

final as (
    select
        prs.pr_id,
        prs.issue_id,
        prs.repository,
        prs.author as contributor,
        prs.created_at,
        prs.merged_at,
        prs.status,
        datediff(
            'day',
            prs.created_at,
            coalesce(prs.merged_at, current_timestamp)
        ) as cycle_time_days,
        coalesce(commits.commit_count, 0) as commit_count
    from prs
    left join commits using (pr_id)
)

select *
from final
