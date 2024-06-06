-- https://datalemur.com/questions/top-fans-rank
with top_ten as (
  SELECT gsr.song_id, a.artist_name 
  FROM global_song_rank gsr 
  inner join songs s on gsr.song_id = s.song_id 
  inner join artists a on a.artist_id = s.artist_id
  where rank <= 10
)
select *
from (
  select artist_name, dense_rank() over(order by total_appearances desc) as artist_rank
  from (
    select artist_name, count(*) as total_appearances
    from top_ten
    group by 1
  ) agg 
) final 
where artist_rank <= 5
