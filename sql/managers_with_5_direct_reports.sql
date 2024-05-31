-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50
select name
from (
    select m.id, m.name, count(e.id) as num_reports
    from Employee m
    inner join Employee e on m.id = e.managerId 
    group by 1,2
) agg
where num_reports >= 5