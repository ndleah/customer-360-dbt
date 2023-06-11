with

-- contact data coming from DB by default
default_contacts as (

    select * from {{ ref('int_deduped_contacts') }}

),

-- contact data thata re manullaly input coming from seed table
seed_contacts as (

    select * from {{ ref('seed_missing_contacts') }}

),

-- union of the two
contacts as (

    select * from default_contacts
    union all
    select * from seed_contacts

)

select * from contacts