with customer_transaction as 
(

SELECT * FROM `bcmastercard.spreadsheet_import.customer_transaction`

)
select 
field1 as customer_id,
status as customer_name,
customerid as customer_region,
PARSE_DATE('%d/%m/%Y', joindate) as join_date,
geo as customer_status
from 
customer_transaction