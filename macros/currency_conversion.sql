{% macro convert_currency(country_name, usd_sales_amount) %}

    {%- set exchange_rates = {"USA": 1.0, "Canada": 1.21, "EUR": 0.83, "GBP": 0.71, "Australia": 0.68} -%}

    {%- if exchange_rates.get(country_code) is not none -%}

        {%- set conversion_rate = exchange_rates[country_code] -%}

        select
            
            {{ usd_sales_amount }} * {{ conversion_rate }} as local_currency_sales_amount


    {%- else -%} 
    
        select {{ usd_sales_amount }} as local_currency_sales_amount

    {%- endif -%}

{% endmacro %}
