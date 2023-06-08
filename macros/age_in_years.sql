{% macro age_in_years(date_column) %}
    date_part('year', age(current_date, {{ date_column }}))
{% endmacro %}