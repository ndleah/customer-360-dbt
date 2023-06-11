{% macro get_meta_columns(model_name, meta_key=none, node_type='model', project='customer360') %}

	{% if execute %}
    
        {% set meta_columns = [] %}

        {% set fqname = node_type ~ '.' ~ project ~ '.' ~ model_name %}
        {% set columns = graph.nodes[fqname]['columns']  %}

        {% for column in columns %}
            {% if meta_key is not none %}
                {% if graph.nodes[fqname]['columns'][column]['meta'][meta_key] == true %}    
                    
                    {# This column has the specified meta_key set to true, indicating it has a certain property #}
                    {% do meta_columns.append(column|upper) %}
                {% endif %}
            {% else %}
                
                {# No meta_key specified, include all columns #}
                {% do meta_columns.append(column|upper) %}
            {% endif %}
        {% endfor %}
	
        {{ return(meta_columns) }}

	{% endif %}
{% endmacro %}
