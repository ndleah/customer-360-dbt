with

transactions as (
    
    select * from {{ ref('fct_transactions') }}

),

contacts as (

    select * from {{ ref('dim_contacts') }}

)
-- Refers to a valid contact
select distinct contact_id from transactions

where contact_id not in (
    
    select contact_id from contacts

)