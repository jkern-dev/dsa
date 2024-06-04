-- https://leetcode.com/problems/customers-who-bought-all-products/
select customer_id 
from 
(
    select customer_id, count(distinct product_key) as unique_products
    from customer a 
    group by 1
) agg 
where unique_products = (select count(distinct product_key) from product)


-- more effective
select customer_id
from customer a 
group by 1
having count(distinct a.product_key) = (select count(distinct product_key) from product)