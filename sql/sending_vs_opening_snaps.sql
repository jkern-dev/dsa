-- https://datalemur.com/questions/time-spent-snaps
select 
  age_bucket,
  round((sum(case when activity_type = 'send' then time_spent else 0 end) / sum(case when activity_type in ('send', 'open') then time_spent else 0 end))*100.0,2) as send_perc, 
  round((sum(case when activity_type = 'open' then time_spent else 0 end) / sum(case when activity_type in ('send', 'open') then time_spent else 0 end))*100.0,2) as open_perc 
from activities act 
join age_breakdown ab on act.user_id = ab.user_id
group by age_bucket
