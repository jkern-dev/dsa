-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/
select 
person_name
from (
    select 
        person_name,
        row_number() over (order by turn desc) as inverse_order
    from (
        select 
            person_id,
            person_name,
            turn,
            weight,
            if(sum(weight) over(order by turn asc) <= 1000,1,0) as ride_bus
        from queue
        group by 1,2,3,4
    ) agg 
    where ride_bus = 1
) inversed 
where inverse_order = 1


-- much simpler approach
select person_name
from (
    select 
        person_id,
        person_name,
        turn,
        weight,
        sum(weight) over(order by turn asc) as total_weight
    from queue
    group by 1,2,3,4
) agg 
where total_weight <= 1000
order by total_weight desc 
limit 1