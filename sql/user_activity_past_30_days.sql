-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/?envType=study-plan-v2&envId=top-sql-50
select 
    activity_date as day, 
    count(distinct user_id) as active_users
from activity
where activity_date <= '2019-07-27'
    and datediff('2019-07-27', activity_date) < 30
group by activity_date;