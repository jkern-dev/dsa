-- https://datalemur.com/questions/user-session-activity
select 
  user_id,
  session_type,
  row_number() over (partition by session_type order by total_duration desc)
from(
  select 
    user_id,
    session_type,
    sum(duration) as total_duration
  from sessions
  where start_date between '2022-01-01' and '2022-02-01'
  group by 1,2
) agg 

