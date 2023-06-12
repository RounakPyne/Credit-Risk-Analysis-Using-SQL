/*Which home owners are the most defaulters.*/
select person_home_ownership,(sum(loan_status)/count(*))*100 as default_rate 
from credit_risk_dataset
group by person_home_ownership;