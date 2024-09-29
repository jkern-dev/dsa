-- https://datalemur.com/questions/matching-skills
select candidate_id
from (
  SELECT 
    candidate_id, 
    sum(case when skill = 'Python' then 1 else 0 end) as python_skill,
    sum(case when skill = 'PostgreSQL' then 1 else 0 end) as postgres_skill,
    sum(case when skill = 'Tableau' then 1 else 0 end) as tableau_skill
  FROM candidates
  group by candidate_id
) agg 
where python_skill > 0
and postgres_skill > 0
and tableau_skill > 0;
