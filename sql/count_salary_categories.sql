-- https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50
select 
    "Low Salary" as category,
    count(*) as accounts_count
from Accounts
where income < 20000

union all

select
    "Average Salary" as category,
    count(*) as accounts_count
from Accounts
where income between 20000 and 50000

union all

select
    "High Salary" as category,
    count(*) as accounts_count
from Accounts
where income > 50000