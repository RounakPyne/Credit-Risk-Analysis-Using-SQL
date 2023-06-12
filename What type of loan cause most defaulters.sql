/*What type of loan cause most defaulters*/
select loan_intent,(sum(loan_status)/count(*))*100 as default_rate
from credit_risk_dataset
group by loan_intent;
