{{ config(
        alias = format_customer_name(var("customer_name"))~"_orders", 
        schema=var("customer_name"),
        materialized='table'
        
        )}}

select
    customer_name,
    country as customer_country,
    count(ordernumber) as number_of_orders,
    sum(sales) as sales_amount_usd,

    -- calculating custom local currency sales
    sum(
        {{ convert_currency(var("customer_country_name"), "SALES") }}
    ) as sales_amount_local_currency,

    -- calculating customer market share
    (SUM(sales) / (SELECT SUM(sales) from {{ ref("stg__customer_sales_table") }} WHERE country = '{{var("customer_country_name")}}')) as customer_country_market_share


from {{ ref("stg__customer_sales_table") }}

where customer_name = '{{ var("customer_name") }}'

group by customer_name, country
