-- https://datalemur.com/questions/off-topic-maps-ugc
with category_counts as (
  select 
    place_category,
    count(distinct content_id) as content_count
  from maps_ugc_review a  
  inner join place_info b on a.place_id = b.place_id
  where content_tag = 'Off-topic'
  group by 1 
  order by 2 desc
),
category_ranks as (
  select 
  place_category,
  content_count,
  rank() over (order by content_count desc) as content_rank
  from category_counts
)
select place_category
from category_ranks
where content_rank = 1
order by place_category;

