-- https://datalemur.com/questions/sql-purchasing-activity
select 
  order_date,
  product_type,
  sum(quantity) over (partition by product_type order by order_date asc) as cum_purchased
from total_trans
order by order_date