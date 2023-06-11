with

transactions as (

    select * from {{ ref('stg_web__transactions') }}

)

select * from transactions