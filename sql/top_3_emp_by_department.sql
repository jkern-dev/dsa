-- https://leetcode.com/problems/department-top-three-salaries/?envType=study-plan-v2&envId=top-sql-50
with salary_rank as (
    select 
    e.*,
    dense_rank() over (partition by departmentid order by salary desc) as salary_rank
    from employee e
 )
 select 
    d.name as department,
    s.name as employee,
    s.salary
from salary_rank as s
inner join department as d on s.departmentid = d.id 
where s.salary_rank <= 3