WITH t1 AS (
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id)
    
select h1.hacker_id, h2.name,sum(max_score) as total_score
from t1 h1 join Hackers h2 on h1.hacker_id=h2.hacker_id
group by h1.hacker_id,h2.name
having sum(max_score)!=0
order by total_score desc, h1.hacker_id asc
