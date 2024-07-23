select t4.name 
from 


(select  t1.id as id, 
         t1.f_id as f_id,
         t1.salary as sal,
         t2.salary as f_salary         
from 
(select F.ID as id , 
        F.friend_id as f_id,
        P.salary as salary
from friends f 
join packages p 
on p. ID =f. ID) as t1
join packages t2 on t1.f_id = t2.id) as t3
join students T4 On t4.id=t3.id
where t3.sal<t3.f_salary  
order by t3.f_salary  
