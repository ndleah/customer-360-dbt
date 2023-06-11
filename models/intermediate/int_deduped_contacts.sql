with

contacts as (

    select * from {{ ref('stg_sf__contacts') }}

),

deduped as (

    select
        distinct on (contact_id)
        *

    from contacts

)

select * from  deduped