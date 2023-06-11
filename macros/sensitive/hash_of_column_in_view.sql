{% macro hash_of_column_in_view(column) %}

    {% set hash_query %}
        select '***********'
    {% endset %}

    {% set results = run_query(hash_query) %}

    sha2(
        TRIM(
            LOWER(
                {{column|lower}} || '{{results.columns[0].values()[0]}}'
            )
        )
    ) AS {{column|lower}}_hash,

{% endmacro %}
