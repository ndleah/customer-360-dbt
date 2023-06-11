{% macro hash_sensitive_columns(source_table) %}
    {# This macro hashes the sensitive columns in the specified source table, while excluding them from the result set. #}

    {% set meta_columns = get_meta_columns(source_table, "sensitive") %}
    {# Retrieve the sensitive columns from the specified source table using the get_meta_columns macro. #}

    {%- for column in meta_columns %}
        {# Iterate over each sensitive column. #}

        {%- if config.get("materialized") == "view" and config.get("secure") -%}
            {# Check if the materialization is a view and secure configuration is enabled. #}

            {{ hash_of_column_in_view(column) }}
            {# Use the hash_of_column_in_view macro to hash the column value in the view. #}

        {%- else -%}
            {# If the materialization is not a view or secure configuration is not enabled. #}
    
            {{ hash_of_column(column) }}
            {# Use the hash_of_column macro to hash the column value. #}

        {% endif %}
    
    {% endfor %}

    {{ dbt_utils.star(from=ref(source_table), except=meta_columns) }}
    {# Exclude the sensitive columns from the result set using the dbt_utils.star macro. #}

{% endmacro %}
