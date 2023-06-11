{% macro age_in_years(date_column) %}
    {{ return(adapter.dispatch('age_in_years')(date_column)) }}
{% endmacro %}

{% macro postgres__age_in_years(date_column) %}
    date_part('year', age(current_date, {{ date_column }}))
{% endmacro %}

{% macro databricks__age_in_years(date_column) %}
    year(current_date()) - year({{ date_column }})
{% endmacro %}
