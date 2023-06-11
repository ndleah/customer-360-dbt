{{ config(materialized='view',)}}

with

transactions as (

    select * from {{ ref('fct_transactions') }}

),

contacts as (
    
        select * from {{ ref('dim_contacts') }}
    
),

transactions_with_customer_info as (

    select
        txn.transaction_id,
        -- customer info
        contacts.*,

        -- transaction info
        txn.transaction_date,
        txn.amount,
        txn.item_count,
        txn.category

    from transactions as txn

    left join contacts using (contact_id)

)

select * from transactions_with_customer_info

