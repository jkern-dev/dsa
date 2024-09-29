-- https://leetcode.com/problems/employees-whose-manager-left-the-company/?envType=study-plan-v2&envId=top-sql-50
select employee_id
from employees 
where manager_id in (
    select manager_id
    from employees 
    where manager_id not in (select distinct employee_id from employees)
    and manager_id is not null
)
and salary < 30000
order by employee_id