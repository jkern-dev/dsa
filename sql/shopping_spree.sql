-- https://datalemur.com/questions/amazon-shopping-spree
select 
  t1.user_id 
from transactions t1 
inner join transactions t2 on t1.user_id = t2.user_id and t2.transaction_date::date = t1.transaction_date::date - 1
inner join transactions t3 on t1.user_id = t3.user_id and t3.transaction_date::date = t1.transaction_date::date - 2
