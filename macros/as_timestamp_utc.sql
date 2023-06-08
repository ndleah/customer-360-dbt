{% macro as_timestamp_utc(column_name) %}
    to_timestamp({{ column_name }},'YYYY-MM-DD HH24:MI:SS.MS') :: timestamp at TIME zone 'UTC'
{% endmacro %}