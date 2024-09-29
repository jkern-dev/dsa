-- https://datalemur.com/questions/sql-swapped-food-delivery
SELECT 
order_id as corrected_order_id,
case 
  when order_id%2=0 then lag(item) over (order by order_id asc)
  when order_id%2<>0 and order_id <> (select max(order_id) from orders) then lead(item) over (order by order_id asc)
  else item
end as item
FROM orders;