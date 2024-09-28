-- https://leetcode.com/problems/project-employees-i/?envType=study-plan-v2&envId=top-sql-50
select 
    project_id, 
    round(avg(experience_years),2) as average_years
from project a 
inner join employee b on a.employee_id = b.employee_id
group by 1;