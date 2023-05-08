{{ config(materialized='view') }}

SELECT
  ordernumber,
  quantityordered,
  priceeach,
  orderlinenumber,
  sales,
  orderdate,
  status,
  qtr_id,
  month_id,
  year_id,
  PRODUCTLINE as industry,
  msrp,
  productcode,
  customername as customer_name,
  phone,
  addressline1,
  addressline2,
  city,
  state,
  postalcode,
  country,
  territory,
  contactlastname,
  contactfirstname,
  dealsize
FROM {{ source('sample_b2b_data', 'customer_sales_table') }}