
with source as (
    select * from {{ source('web','transactions') }}
),

renamed as (
    select
        id,
        contact_id,
        {{ as_timestamp_utc('transaction_date') }} as transaction_date,
        amount,
        item_count,
        category, 
        _loaded_at_utc
    from source     
)

select * from renamed

