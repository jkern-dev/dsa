-- https://datalemur.com/questions/invalid-search-pct
with search_metrics as (
select 
  country,
  num_search,
  invalid_result_pct,
  num_search * invalid_result_pct as total_invalid
  from search_category
  where invalid_result_pct is not null
)
select 
  country,
  sum(num_search) as total_search,
  round(sum(total_invalid) / sum(num_search),2) as invalid_searches_pct
from search_metrics
group by country
order by 1,2,3