{{ config(
    indexes=[
        {'columns': ['transaction_id'], 'unique': True},
        {'columns': ['contact_id'], 'type': 'hash'},
        ]
    )
}}

with

transactions as (

    select * from {{ ref('stg_web__transactions') }}

)

select * from transactions