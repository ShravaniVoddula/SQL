Select 
   T1.company_code,  
   T2.founder, 
   count(Distinct T1.lead_manager_code) AS L,
   count(Distinct T1.senior_manager_code) AS S,
   count(Distinct T1.manager_code)  AS M,
   count(Distinct T1.employee_code)  AS E
from Employee T1 
Join Company T2 
on T1.company_code=T2.company_code
Group by T1.company_code,T2.founder;
