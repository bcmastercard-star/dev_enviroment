{{ config(materialized='table') }}

with stg_sales_transaction as (
  select 
    * 
  from {{ ref('stg_sales_transaction') }}
),
dim_customer as (
  select 
    customer_id, 
    customer_name, 
    customer_region, 
    customer_status
  from {{ ref('dim_customer') }}
),
dim_product as (
  select 
    product_id, 
    product_name, 
    product_category,
    product_cost
  from {{ ref('dim_product') }}
),
dim_currency_conversion as (
  select 
    region, 
    currency_conversion
  from {{ ref('dim_currency_conversion') }}
),
dim_date as (
  select 
    *
  from {{ ref('dim_date') }}
)

select
  stg_sales_transaction.transaction_id,
  stg_sales_transaction.transaction_date,
  stg_sales_transaction.customer_id,
  stg_sales_transaction.product_id,
  stg_sales_transaction.quantity,
  stg_sales_transaction.price,
  stg_sales_transaction.sales,
  dim_customer.customer_region,
  dim_currency_conversion.currency_conversion,
  dim_customer.customer_status,
  dim_product.product_cost,
  dim_product.product_category,
  dim_date.year,
  dim_date.quarter,
  dim_date.month,
  dim_date.week_number as week,
  stg_sales_transaction.price * dim_currency_conversion.currency_conversion as price_harmonized,
  stg_sales_transaction.sales * dim_currency_conversion.currency_conversion as sales_harmonized,
  stg_sales_transaction.quantity * dim_product.product_cost as cost_harmonized

from stg_sales_transaction
left join dim_customer
  on stg_sales_transaction.customer_id = dim_customer.customer_id
left join dim_product
  on stg_sales_transaction.product_id = dim_product.product_id
left join dim_currency_conversion
  on dim_customer.customer_region = dim_currency_conversion.region
left join dim_date
  on stg_sales_transaction.transaction_date = dim_date.id