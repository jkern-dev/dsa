-- https://datalemur.com/questions/histogram-users-purchases
with most_recent as (
  select 
    user_id,
    transaction_date,
    product_id,
    rank() over(partition by user_id order by transaction_date desc) as recency
  from user_transactions
)
select 
  transaction_date,
  user_id,
  count(product_id)
from most_recent 
where recency = 1
group by 1,2