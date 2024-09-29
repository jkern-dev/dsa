-- https://leetcode.com/problems/delete-duplicate-emails/?envType=study-plan-v2&envId=top-sql-50
with email_rnk as (
    select
    id,
    email,
    row_number() over (partition by email order by id asc) as email_count
from person
)
delete from person where id in (
    select id
    from email_rnk
    where email_count > 1
)
