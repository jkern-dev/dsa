-- https://datalemur.com/questions/money-transfer-relationships
select count(*) / 2 as unique_relationships
from (
  select payer_id, recipient_id
  from payments
  
  intersect 
  
  select recipient_id, payer_id
  from payments
) agg 
