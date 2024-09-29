-- https://datalemur.com/questions/top-drugs-sold
with product_ranks as (
select 
  product_id,
  manufacturer,
  drug,
  units_sold,
  row_number() over (partition by manufacturer order by units_sold desc) as product_rank
  from pharmacy_sales
)

select 
  manufacturer, 
  drug
from product_ranks 
where product_rank <= 2
order by manufacturer
  