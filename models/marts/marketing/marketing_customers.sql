with

transactions as (

    select * from {{ ref('marketing_transactions') }}

),

customer_first_and_last_purchase_date as (
    
    select
        contact_id,
        max(transaction_date)::date as last_purchase_date,
        min(transaction_date)::date as first_purchase_date
    
    from transactions
    
    group by 1

),

total_expenses_by_customers as (

    select
        a.contact_id,
        
        --customer information
        a.gender,
        {{ age_in_years('birth_date') }} as age,
        
        --purchase information
        b.first_purchase_date,
        b.last_purchase_date,

        --total expenses (by categories)
        sum(a.amount) as total_expense,

        -- pivot revenue by product categories
        {{ dbt_utils.pivot(
                'category',
                dbt_utils.get_column_values(ref('marketing_transactions'), 'category'),
                agg='sum',
                then_value='amount',
                suffix=' Amount',
                else_value=0
            ) }}
    
    from transactions as a

    left join customer_first_and_last_purchase_date as b using (contact_id)

    group by 1, 2, 3, 4, 5

)

select * from total_expenses_by_customers