-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/?envType=study-plan-v2&envId=top-sql-50
select 
    contest_id,
    round((count(distinct registered) / count(distinct user_id))*100,2) as percentage
from
(
    select 
        b.contest_id,
        a.user_id,
        b.user_id as registered
    from users a
    cross join register b
)agg
group by 1
order by percentage desc, contest_id asc;