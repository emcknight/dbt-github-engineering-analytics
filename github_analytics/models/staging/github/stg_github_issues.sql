with source as (
    select *
    from {{source('github', 'github_issues')}}
),

renamed as (
    select
        issue_id::integer as issue_id,
        repository::varchar as repository,
        author::varchar as author,
        issue_type::varchar as issue_type,
        status::varchar as status,
        created_at::timestamp as created_at,
        closed_at::timestamp as closed_at
    from source
)

select *
from renamed
