-- https://leetcode.com/problems/primary-department-for-each-employee/?envType=study-plan-v2&envId=top-sql-50
select 
    employee_id, 
    department_id
from (
    select 
        employee_id,
        department_id,
        row_number() over (partition by employee_id order by primary_flag asc) as dep_order,
        primary_flag
    from employee
) agg 
where dep_order = 1
