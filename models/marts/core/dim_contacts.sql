{{ config(
    indexes=[
        {'columns': ['contact_id'], 'unique': True},
        ]
    ) 
}}

with

-- contact data coming from DB by default
contacts as (

    select * from {{ ref('int_deduped_contacts') }}

)

select * from contacts