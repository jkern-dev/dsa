-- https://datalemur.com/questions/frequently-purchased-pairs
with combos as (
  select 
    transaction_id,
    array_agg(cast(product_id as text) order by product_id) as combo
  from transactions
  group by transaction_id
)

select distinct combo as combination
from combos
where array_length(combo,1) > 1
order by combo;
