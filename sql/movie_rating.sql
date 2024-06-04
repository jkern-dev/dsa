(
    select name as results
    from movierating a
    inner join users b on a.user_id = b.user_id 
    group by 1
    order by count(*) desc, name
    limit 1
)
union all
(
    select title as results
    from movierating a
    inner join movies b on a.movie_id = b.movie_id 
    where extract(year from created_at) = '2020'
    and extract(month from created_at) = '02'
    group by 1
    order by avg(rating) desc, title 
    limit 1
)