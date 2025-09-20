with sales_transaction as 
(

SELECT * FROM `bcmastercard.spreadsheet_import.sales_transaction`

)
select 
field22 as transaction_id,
cast(field23 as date) as transaction_date,
field24 as customer_id,
field25 as product_id,
cast(q as numeric) as quantity,
cast(p as numeric) as price,
cast(sales as numeric) as sales
from 
sales_transaction