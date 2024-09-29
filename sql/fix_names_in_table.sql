-- https://leetcode.com/problems/fix-names-in-a-table/submissions/1406313418/?envType=study-plan-v2&envId=top-sql-50
select 
    user_id,
    concat(
        upper(substring(name,1,1)),
        lower(substring(name,2,length(name)))
    ) as name 
from users
order by user_id asc;
