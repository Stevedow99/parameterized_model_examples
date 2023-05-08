{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name|replace(" ", "_")|replace(".", "")|replace(",", "") }}

    {%- endif -%}

{%- endmacro %}


{%- macro format_customer_name(string) -%}
   {{ string|replace(" ", "_")|replace(".", "")|replace(",", "") }}
{%- endmacro -%}