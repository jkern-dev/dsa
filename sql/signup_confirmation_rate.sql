-- https://datalemur.com/questions/signup-confirmation-rate
SELECT 
  round(count(b.email_id) / count(distinct a.email_id)::decimal,2) as confirm_rate
FROM emails a 
left join (
  select distinct email_id
  from texts 
  where signup_action = 'Confirmed'
 ) b on a.email_id = b.email_id
;