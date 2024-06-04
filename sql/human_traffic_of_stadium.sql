-- https://leetcode.com/problems/human-traffic-of-stadium/description/
with filtered as (
    select id, visit_date, people,
    lag(id,1) over (order by id) as prev_1,
    lag(id,2) over (order by id) as prev_2,
    lead(id,1) over (order by id) as next_1,
    lead(id,2) over (order by id) as next_2
    from stadium
    where people >= 100
),
order_filtered as (
    select *,
    case 
        when next_1 - 1 = id and next_2 - 2 = id then "Y"
        when prev_1 + 1 = id and prev_2 + 2 = id then "Y"
        when prev_1 + 1 = id and next_1 - 1 = id then "Y"
        else "No"
    end as in_order 
    from filtered
)
select 
    id, visit_date, people
from order_filtered
where in_order = "Y"