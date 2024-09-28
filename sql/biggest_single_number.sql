-- https://leetcode.com/problems/biggest-single-number/?envType=study-plan-v2&envId=top-sql-50
with num_counts as (
    select num, count(*) as num_count
    from mynumbers 
    group by num
)
select max(num) as num
from num_counts
where num_count = 1