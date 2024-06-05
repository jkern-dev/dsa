-- https://datalemur.com/questions/median-search-freq
with searches as (
  select searches
  from search_frequency
  group by searches, generate_series(1, num_users)
)
select 
round(PERCENTILE_CONT(.50) within group(
      order by searches)::DECIMAL,1) as median 
from searches

