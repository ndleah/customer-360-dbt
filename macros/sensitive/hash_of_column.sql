{% macro hash_of_column(column) %}
    -- Check if the column value is null, and return null if it is
    -- Otherwise, encode the sensitive column as '***********'
    case 
        when {{ column|lower }} is null then null 
    else '***********' 
    end as {{column|lower}}_hash,
{% endmacro %}
