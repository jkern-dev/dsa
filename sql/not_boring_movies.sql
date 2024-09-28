-- https://leetcode.com/problems/not-boring-movies/?envType=study-plan-v2&envId=top-sql-50
select *
from cinema 
where id%2 = 1
and description <> 'Boring'
order by rating desc;