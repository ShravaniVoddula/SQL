with cte as (select name, occupation ,
        row_number() over ( partition by occupation order by name  ) as rn 
from 
OCCUPATIONS
)

select 
 max(case when Occupation="Doctor" then name end),
max(case when Occupation="Professor" then name end),
max(case when Occupation="Singer" then name end),
max(case when Occupation="Actor" then name end)
from cte
group by rn
