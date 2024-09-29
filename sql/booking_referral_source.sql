-- https://datalemur.com/questions/booking-referral-source
with user_booking as (
  select 
    a.booking_id,
    a.user_id,
    a.booking_date,
    row_number() over (partition by a.user_id order by a.booking_date asc) as booking_order,
    b.channel
  from bookings a
  inner join booking_attribution b on a.booking_id = b.booking_id
),
first_booking as (
  select 
    channel,
    count(*) as channel_booking
  from user_booking 
  where booking_order = 1
  group by channel
)
select 
  channel,
  round(100.0*(channel_booking / (select sum(channel_booking) from first_booking)),0) as first_booking_pct
from first_booking
where channel is not null 
order by first_booking_pct desc 
limit 1;
