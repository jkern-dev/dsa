-- https://datalemur.com/questions/mean-median-mode
select 
round(avg(email_count)) as mean,
percentile_cont(0.5) within group (order by email_count) as median,
mode() within group (order by email_count) as mode 
from inbox_stats;