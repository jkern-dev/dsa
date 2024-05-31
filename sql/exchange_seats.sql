-- https://leetcode.com/problems/exchange-seats/description/?envType=study-plan-v2&envId=top-sql-50
select 
    id,
    case 
        when id%2 = 0 then (lag(student) over (order by id))
        else ifnull(lead(student) over (order by id), student)
    end as "student"
from Seat