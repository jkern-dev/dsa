-- https://datalemur.com/questions/odd-even-measurements
with measurement as (
SELECT 
  cast(measurement_time as date) as measurement_day,
  measurement_value,
  row_number() over(partition by cast(measurement_time as date) order by measurement_time) as measurement_number
FROM measurements
)

select 
  measurement_day::timestamp,
  sum(case when measurement_number%2 != 0 then measurement_value else 0 end) as odd_sum,
  sum(case when measurement_number%2 = 0 then measurement_value else 0 end) as even_sum
from measurement
group by 1
order by measurement_day