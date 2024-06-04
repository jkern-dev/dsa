-- https://leetcode.com/problems/tree-node/
select id, 
case 
    when parent_id = 0 then "Root"
    when leaf_count > 0 then "Inner"
    else "Leaf"
end as type 
from (
    select a.id, count(l.p_id) as leaf_count, count(p.id) as parent_id
    from Tree a 
    left join Tree l on a.id = l.p_id
    left join Tree p on a.p_id = p.id
    group by 1
) agg
