-- https://datalemur.com/questions/repeated-payments
with first_and_next_transaction as (
  SELECT 
    transaction_id,
    merchant_id,
    credit_card_id,
    amount,
    transaction_timestamp,
    lag(transaction_id) over(partition by credit_card_id order by transaction_timestamp asc) as prev_transaction_id
  FROM transactions
)
select count(distinct a.merchant_id) as payment_count
from first_and_next_transaction a 
inner join transactions b 
  on a.prev_transaction_id = b.transaction_id 
  and a.merchant_id = b.merchant_id 
  and a.credit_card_id = b.credit_card_id 
  and extract(minutes from (a.transaction_timestamp - b.transaction_timestamp)) <= 10