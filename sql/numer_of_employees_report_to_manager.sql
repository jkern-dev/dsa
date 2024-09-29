-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50
select 
    a.employee_id,
    a.name,
    count(b.employee_id) as reports_count,
    round(avg(b.age),0) as average_age
from employees a 
inner join employees b on a.employee_id = b.reports_to
group by 1,2
order by a.employee_id;
