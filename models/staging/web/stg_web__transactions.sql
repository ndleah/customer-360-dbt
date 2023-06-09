with 

source as (

    select * from {{ source('web', 'transactions') }}

),

staged as (
    
    select
        id as transaction_id,
        contact_id,
        {{ as_timestamp_utc('transaction_date') }} as transaction_date,
        amount,
        item_count,
        category, 
        _loaded_at_utc
    
    from source     

)

select * from staged

