-- generate_schema_name is a built-in macro that we override to achieve the
-- custom schema layout that we want, using the directory structure.
-- See [https://stackoverflow.com/a/69849432] and
-- [https://docs.getdbt.com/docs/build/custom-schemas] for more details.
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if target.name == 'local' -%}

        {% set paths = node.path.split('/') %}

        {%- if custom_schema_name is none -%}
        
            {%- if paths[0] == 'marts' -%}

                {%- if paths[1] == 'core' -%}

                    core
                
                {%- else -%}

                    report__{{ paths[1:-1] | join('_') }}

                {%- endif -%}

            {%- elif custom_schema_name is not none -%}

                {{ custom_schema_name }}

            {%- else -%}

                {{ default_schema }}

            {%- endif -%}

        {%- else -%}

        {{ default_schema }}

        {%- endif -%}

    {%- else -%}

        {{ default_schema }}

    {%- endif -%}

{%- endmacro %}