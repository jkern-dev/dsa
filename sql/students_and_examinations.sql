-- https://leetcode.com/problems/students-and-examinations/?envType=study-plan-v2&envId=top-sql-50
select a.student_id, a.student_name, b.subject_name, count(c.student_id) as attended_exams
from students a
cross join subjects b 
left join examinations c on a.student_id = c.student_id
                         and b.subject_name = c.subject_name 
group by 1,2,3
order by 1,2;   