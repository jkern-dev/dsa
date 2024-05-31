# https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/?envType=study-plan-v2&envId=top-sql-50
select id, sum(num_friends) as num
from (
        select requester_id as id, count(*) as num_friends
        from RequestAccepted
        group by 1
    union all
        select accepter_id as id, count(*) as num_friends
        from RequestAccepted
        group by 1
) agg
group by 1
order by sum(num_friends) desc
limit 1
    