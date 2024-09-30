-- https://datalemur.com/questions/consulting-bench-time
with job_details as (
  select 
    a.employee_id,
    a.job_id,
    b.start_date,
    b.end_date,
    (b.end_date - b.start_date)+1 as job_length
  from staffing a  
  inner join consulting_engagements b on a.job_id = b.job_id
  where a.is_consultant = 'true'
)
select
  employee_id,
  365 - sum(job_length) as bench_days
from job_details
group by 1