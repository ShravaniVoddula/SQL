select 
    (case
         when Grade <8 then null
         WHEN Grade >=8 then Name
          end) AS Name, Grade,Marks
from(


select T1.Name,T2.Grade AS Grade,T1.Marks
from  Students T1 JOIN Grades  T2 ON T1.Marks between T2.Min_Mark AND T2.Max_mark
    ) AS T12
order by Grade desc,Name,Marks  asc
