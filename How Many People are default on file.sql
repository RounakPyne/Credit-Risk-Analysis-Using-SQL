/*How Many People are default on file*/
select cb_person_default_on_file , (sum(loan_status)/count(*))*100 as default_rate
from credit_risk_dataset
group by cb_person_default_on_file
