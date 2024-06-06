-- https://datalemur.com/questions/total-utilization-time
with runtime as (
  select 
    server_id,
    session_status,
    status_time as start_time,
    lead(status_time) over(partition by server_id order by status_time) as stop_time
  from server_utilization
) 
select date_part('days', justify_hours(sum(stop_time - start_time))) as total_uptime_days
from runtime
where session_status = 'start'
and stop_time is not null