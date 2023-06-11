with

transactions as (

    select * from {{ ref('marketing_transactions') }}

),

customers as (

    select
        id,
        gender,
        {{ age_in_years('birth_date') }} AS age,
        sum(amount) as total_expense
    
    from transactions