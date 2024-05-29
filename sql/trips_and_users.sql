-- https://leetcode.com/problems/trips-and-users/
select 
    request_at as "Day", 
    round(sum(case when status like '%cancelled%' then 1 else 0 end) /count(*), 2) as "Cancellation Rate"
from trips t 
inner join users d on t.driver_id = d.users_id and d.role = 'driver' and d.banned = 'No'
inner join users c on t.client_id = c.users_id and c.role = 'client' and c.banned = 'No'
where request_at between '2013-10-01' and '2013-10-03'
group by 1