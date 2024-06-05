-- https://leetcode.com/problems/confirmation-rate/
select 
    a.user_id,
    round(case 
        when total_requests is null then 0
        else num_confirmed / total_requests 
    end, 2) as confirmation_rate
from signups a
left join (
    select 
    user_id, 
    sum(case when action = 'confirmed' then 1 else 0 end) as num_confirmed,
    count(*) as total_requests
    from confirmations
    group by 1
) c on a.user_id = c.user_id