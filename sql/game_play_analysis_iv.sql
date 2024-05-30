# https://leetcode.com/problems/game-play-analysis-iv/
with logins as (
    select 
        player_id, 
        device_id, 
        event_date, 
        lead(event_date) over (partition by player_id order by event_date) as next_login
    from Activity
),
signup as (
    select player_id, min(event_date) as signup_date from Activity group by 1
)
select round(
    sum(case when datediff(next_login, signup_date) = 1 then 1 else 0 end) / count(*), 2
) as fraction
from signup s 
left join logins l on s.player_id = l.player_id and s.signup_date = l.event_date
