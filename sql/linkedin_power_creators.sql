-- https://datalemur.com/questions/linkedin-power-creators-part2
select profile_id
from (
  select 
    profile_id,
    a.followers as emp_followers,
    c.followers as company_followers,
    row_number() over(partition by a.profile_id order by c.followers desc) as top_company
  from personal_profiles a  
  inner join employee_company b on a.profile_id = b.personal_profile_id
  inner join company_pages c on b.company_id = c.company_id 
) agg 
where emp_followers > company_followers
and top_company = 1
order by profile_id
