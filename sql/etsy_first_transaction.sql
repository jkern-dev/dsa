-- https://datalemur.com/questions/sql-first-transaction
with transaction_order as (
  select 
    transaction_id
    user_id,
    spend,
    transaction_date,
    row_number() over (partition by user_id order by transaction_date asc) as transaction_number
    from user_transactions
)
select count(user_id) as users
from transaction_order
where transaction_number = 1
and spend >= 50