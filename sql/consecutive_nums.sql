-- https://leetcode.com/problems/consecutive-numbers/?envType=study-plan-v2&envId=top-sql-50
select distinct l1.num as consecutivenums
from logs l1 
inner join logs l2 on l1.id = l2.id - 1 and l1.num = l2.num
inner join logs l3 on l1.id = l3.id - 2 and l1.num = l3.num;