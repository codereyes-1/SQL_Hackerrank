-- Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

select 
    co.company_code, 
    co.founder,
    count(distinct lm.lead_manager_code),
    count(distinct sm.senior_manager_code),
    count(distinct m.manager_code),
    count(distinct e.employee_code)
from Company as co
left join Lead_Manager as lm on lm.company_code = co.company_code
left join Senior_Manager as sm on sm.lead_manager_code = lm.lead_manager_code
left join Manager as m on m.senior_manager_code = sm.senior_manager_code
left join Employee as e on e.manager_code = m.manager_code
group by co.company_code, co.founder
order by co.company_code asc