-- https://leetcode.com/problems/market-analysis-i/description/
select 
    u.user_id as buyer_id,
    u.join_date,
    case 
        when o.orders_in_2019 is null then 0 
        else o.orders_in_2019 
    end as orders_in_2019
from users u
left join (
    select buyer_id, count(*) as orders_in_2019
    from orders
    where extract(year from order_date) = 2019
    group by 1
) o on u.user_id = o.buyer_id