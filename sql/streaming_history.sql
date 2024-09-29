-- https://datalemur.com/questions/spotify-streaming-history
select 
user_id,
song_id,
sum(song_plays) as song_plays
from (
  select 
  user_id,
  song_id,
  song_plays
  from songs_history
  
  union all 
  
  select user_id,
  song_id,
  count(*) as song_plays
  from songs_weekly
  where listen_time <= '08/04/2022 23:59:59'
  group by 1,2
) agg 
group by user_id, song_id
order by 3 desc;
