/*Which Loan grade has more defaulters.*/
select loan_grade,(sum(loan_status)/count(*))*100 as default_rate
from credit_risk_dataset
group by loan_grade
order by loan_grade