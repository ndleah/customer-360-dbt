{% macro as_timestamp_utc(column_name) %}
    
    {{ return(adapter.dispatch('as_timestamp_utc')(column_name)) }}

{% endmacro %}

{% macro postgres__as_timestamp_utc(column_name) %}
    -- Generate PostgreSQL syntax
    to_timestamp({{ column_name }},'YYYY-MM-DD HH24:MI:SS.MS') :: timestamp at TIME zone 'UTC'
{% endmacro %}

{% macro databricks__as_timestamp_utc(column_name) %}
    -- Generate Databricks syntax
    from_utc_timestamp(from_unixtime(unix_timestamp({{ column_name }}, 'yyyy-MM-dd HH:mm:ss.SSS')), 'UTC')

{% endmacro %}