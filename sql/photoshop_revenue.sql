-- https://datalemur.com/questions/photoshop-revenue-analysis
with photoshop_buyers as (
  select 
    customer_id 
  from adobe_transactions 
  where product = 'Photoshop'
)
select 
  customer_id,
  sum(revenue) as revenue 
from adobe_transactions 
where product <> 'Photoshop'
  and customer_id in (select * from photoshop_buyers)
group by 1
order by customer_id