# Developing in this project

### Examples of creating the `customer_orders` tables
`dbt run --select customer_orders --vars '{"customer_name": "Canadian Gift Exchange Network", "customer_country_name":"Canada"}'`

`dbt run --select customer_orders --vars '{"customer_name": "Australian Collectables, Ltd", "customer_country_name":"Australia"}'`

`dbt run --select customer_orders --vars '{"customer_name": "Collectable Mini Designs Co.", "customer_country_name":"USA"}'`
