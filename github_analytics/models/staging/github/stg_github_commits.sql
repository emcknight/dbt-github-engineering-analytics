with source as (
    select *
    from {{source('github', 'github_commits')}}
),

renamed as (
    select
        commit_id::varchar as commit_id,
        pr_id::integer as pr_id,
        author::varchar as author,
        committed_at::timestamp as committed_at
    from source
)

select *
from renamed
