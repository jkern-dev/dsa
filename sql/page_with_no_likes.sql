-- https://datalemur.com/questions/sql-page-with-no-likes
SELECT distinct a.page_id
FROM pages a
left join page_likes b on a.page_id = b.page_id
where b.page_id is null
order by a.page_id;