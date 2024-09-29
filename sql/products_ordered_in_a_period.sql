-- https://leetcode.com/problems/list-the-products-ordered-in-a-period/description/?envType=study-plan-v2&envId=top-sql-50
select 
    a.product_name,
    sum(b.unit) as unit
from products a
inner join orders b on a.product_id = b.product_id
where extract(month from b.order_date) = 2
and extract(year from b.order_date) = 2020
group by a.product_name
having sum(b.unit) >= 100