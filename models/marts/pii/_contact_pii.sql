{{ config(
    materialized='view',
    tag='sensitive'
)

}}

with

pii_transactions as (

    select 
        {{ hash_sensitive_columns('dim_contacts') }}
    
    from {{ ref('dim_contacts') }}

)

select * from pii_transactions