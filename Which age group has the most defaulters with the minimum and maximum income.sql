/*Which age group has the most defaulters with the minimum and maximum income*/
 
select
case
when person_age >= 20  and  person_age <= 30 then "20 to 30"
when person_age >= 30  and  person_age <= 40 then "30 to 40"
when person_age >= 40  and  person_age <= 50 then "40 to 50"
when person_age >= 50  and  person_age <= 60 then "50 to 60"
when person_age >= 60  and  person_age <= 70 then "60 to 70"
when person_age >= 70  and  person_age <= 80 then "70 to 80"
when person_age >= 80  and  person_age <= 90 then "80 to 90"
when person_age >= 90  and  person_age <= 100 then "90 to 100"
else ">100"
end as Age_Group,
 min(person_income) as `Minimum Income` ,max(person_income) as `Maximum Income`, round((sum(loan_status)/count(*))*100,2) as default_rate
from credit_risk_dataset 
group by Age_Group
order by person_age asc;