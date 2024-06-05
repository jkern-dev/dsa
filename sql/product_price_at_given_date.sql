-- https://leetcode.com/problems/product-price-at-a-given-date/
with latest_price as (
    select 
        product_id, 
        max(change_date) as change_date
    from products
    where change_date <= '2019-08-16'
    group by 1
)
select 
    a.product_id, 
    case 
        when a.new_price is null then 10
        else a.new_price
    end as price
from products as a
inner join latest_price as b 
    on a.product_id = b.product_id and a.change_date = b.change_date
union
select product_id, 10 as price
from products
where product_id not in (select product_id from latest_price)