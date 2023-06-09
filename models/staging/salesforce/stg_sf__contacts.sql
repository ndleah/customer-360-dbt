with

source as (

    select * from {{ source('salesforce','contacts') }}

),

contact_staged as (
    
    select
        id as contact_id,
        username as user_name,
        name,
        gender,
        address, 
        mail as email_address,
        birthdate as birth_date,
        _loaded_at_utc
    
    from source

)

select * from contact_staged

