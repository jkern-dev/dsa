-- https://datalemur.com/questions/marketing-touch-streak
with consecutive_events as (
  select 
    event_id,
    contact_id,
    event_type,
    event_date,
    date_trunc('week',event_date) as event_week,
    lag(date_trunc('week',event_date)) over (partition by contact_id order by event_date) as lag_event_week,
    lead(date_trunc('week',event_date)) over (partition by contact_id order by event_date) as lead_event_week
  from marketing_touches
)
select distinct b.email
from consecutive_events a 
inner join crm_contacts b on a.contact_id = b.contact_id
where lag_event_week = event_week - interval '1 week'
or lead_event_week = event_week + interval '1 week'
and a.contact_id in (
  select contact_id
  from marketing_touches 
  where event_type = 'trial_request'
)
