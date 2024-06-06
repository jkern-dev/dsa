-- https://datalemur.com/questions/supercloud-customer
with customer_products as (
  SELECT 
    a.customer_id,
    count(distinct b.product_category) as unique_category
  FROM customer_contracts a  
  inner join products b on a.product_id = b.product_id
  group by 1
)
select customer_id 
from customer_products 
where unique_category = (select count(distinct product_category) from products)
