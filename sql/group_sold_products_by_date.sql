-- https://leetcode.com/problems/group-sold-products-by-the-date/description/?envType=study-plan-v2&envId=top-sql-50
select
    sell_date,
    count(distinct product) as num_sold,
    group_concat(distinct product order by product) as products
from activities 
group by sell_date;