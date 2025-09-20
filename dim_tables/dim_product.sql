with product_cost as 
(

SELECT * FROM `bcmastercard.spreadsheet_import.product_cost`

)
select 
field0 as product_id,
field1 as product_name,
field2 as product_category,
cast(cost as numeric) as cost
from 
product_cost