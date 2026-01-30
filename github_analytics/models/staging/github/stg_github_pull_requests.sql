with source as (
    select *
    from {{source('github', 'github_pull_requests')}}
),

renamed as (
    select
        pr_id::integer as pr_id,
        issue_id::integer as issue_id,
        repository::varchar as repository,
        author::varchar as author,
        created_at::timestamp as created_at,
        merged_at::timestamp as merged_at,
        closed_at::timestamp as closed_at,
        status::varchar as status
    from source
)

select *
from renamed
