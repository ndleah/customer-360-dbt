{% set all_columns = dbt_utils.get_column_values(ref('marketing_transactions'), 'category') %}

{% set column_names = [] %}
{% for column in all_columns %}
    {% do column_names.append('"' ~ column ~ ' Amount"') %}
{% endfor %}

with

marketing_customers as (

    select * from {{ ref('marketing_customers') }}

),

total_category_expenses as (
    
    select
        sum(total_expense)::numeric as total_expense,

        {% for cols in column_names %}
            sum({{ cols }})::numeric
            {% if not loop.last %} + {% endif %}
        {% endfor %} as total_amount
    
from marketing_customers

)

select * from total_category_expenses 

where total_expense != total_amount