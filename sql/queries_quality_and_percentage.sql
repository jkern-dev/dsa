-- https://leetcode.com/problems/queries-quality-and-percentage/?envType=study-plan-v2&envId=top-sql-50
select 
query_name,
round(sum(quality) / count(*),2) as quality,
round((sum(poor_query) / count(*))*100,2) as poor_query_percentage
from (
    select 
        query_name,
        result,
        position,
        rating,
        rating / position as quality,
        case when rating < 3 then 1 else 0 end as poor_query
    from queries
    where query_name is not null
) agg
group by query_name;
