-- https://leetcode.com/problems/patients-with-a-condition/?envType=study-plan-v2&envId=top-sql-50
select 
    patient_id,
    patient_name,
    conditions
from patients
where conditions like 'DIAB1%' or conditions like '% DIAB1%';