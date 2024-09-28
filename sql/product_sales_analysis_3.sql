-- https://leetcode.com/problems/product-sales-analysis-iii/?envType=study-plan-v2&envId=top-sql-50
with product_details as (
    select a.product_id, min(year) as first_year
    from product a
    inner join sales b on a.product_id = b.product_id
    group by 1
)
select 
    a.product_id,
    b.first_year,
    a.quantity,
    a.price
from sales a
inner join product_details b on a.product_id = b.product_id and a.year = b.first_year