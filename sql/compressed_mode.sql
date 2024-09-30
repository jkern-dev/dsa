-- https://datalemur.com/questions/alibaba-compressed-mode
with item_order_ranks as (
  select 
    item_count,
    order_occurrences,
    rank() over (order by order_occurrences desc) as item_rank
    from items_per_order
)
select 
item_count as mode
from item_order_ranks
where item_rank = 1
order by 1 