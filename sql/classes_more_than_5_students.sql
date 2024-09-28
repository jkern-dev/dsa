-- https://leetcode.com/problems/classes-more-than-5-students/?envType=study-plan-v2&envId=top-sql-50
select 
    class
from courses
group by class
having count(distinct student) >= 5;