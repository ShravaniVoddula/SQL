with t1 as (
select hacker_id , count(challenge_id) as total
from Challenges 
group by hacker_id),

t2 as (
select max(total) as maxi
from t1),

t3 as (
SELECT hacker_id, total, maxi
FROM t1
CROSS JOIN t2
),
