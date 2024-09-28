-- https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/submissions/1405218149/?envType=study-plan-v2&envId=top-sql-50
select teacher_id, count(distinct subject_id) as cnt
from teacher
group by teacher_id;