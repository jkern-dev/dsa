-- https://datalemur.com/questions/sql-repeat-purchases
select count(*)
from (
  select 
    user_id,
    product_id,
    count(distinct purchase_date::date)
  from purchases
  group by 1,2
  having count(distinct purchase_date::date) >= 2
) agg 
