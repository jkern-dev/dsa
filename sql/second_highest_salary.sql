-- https://leetcode.com/problems/second-highest-salary/?envType=study-plan-v2&envId=top-sql-50
-- solution 1
select 
(select distinct salary 
from employee
order by salary desc
limit 1 offset 1)
as secondhighestsalary;

-- solution 2
select max(salary) as secondhighestsalary
from employee
where salary < (select max(salary) from employee)