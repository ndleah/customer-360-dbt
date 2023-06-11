with

transactions as (

  select * from {{ ref('fct_transactions') }}

),

contacts as (

  select * from {{ ref('dim_contacts') }}

),

monthly_revenue_by_product_categories as (

    select
        date_trunc('month', transaction_date) as transaction_month,
        sum(amount) as total_revenue,
        sum(item_count) as total_quantity_sold

    from transactions

    group by 1

),

monthly_product_scores as (

    select
        date_trunc('month', transactions.transaction_date) as transaction_month,
        transactions.category,
        -- Calculate the score for each product category based on total quantity sold
        (sum(transactions.item_count::float) / max(total_revenue.total_quantity_sold::float)) as product_score
    
    from transactions
    
    left join monthly_revenue_by_product_categories as total_revenue

    on date_trunc('month', transactions.transaction_date) = total_revenue.transaction_month

    left join contacts using (contact_id)
    
    group by 1, 2

),

ranked_product_scores as (
    
    select
        transaction_month,
        category,
        product_score,
        row_number() over (partition by transaction_month order by product_score desc) as rank
        
    from monthly_product_scores

    order by
        transaction_month desc,
        rank

)

select * from ranked_product_scores