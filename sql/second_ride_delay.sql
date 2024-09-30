-- https://datalemur.com/questions/2nd-ride-delay
with ride_order as (
  select 
    a.user_id,
    registration_date,
    ride_date,
    row_number() over (partition by a.user_id order by ride_date) as ride_num
    from users a
    inner join rides b on a.user_id = b.user_id
),
in_the_moments as (
  select user_id,
  registration_date,
  ride_date,
  ride_num
  from ride_order 
  where ride_num = 1 
  and ride_date = registration_date
),
time_to_second as (
  select 
    a.user_id,
    a.ride_date as first_ride,
    b.ride_date as second_ride,
    b.ride_date - a.ride_date as delay_time
    from in_the_moments a 
    inner join ride_order b on a.user_id = b.user_id and b.ride_num = 2
)
select round(avg(delay_time),2)
from time_to_second
