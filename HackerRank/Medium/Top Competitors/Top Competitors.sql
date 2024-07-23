
select S.hacker_id as H, h2.name
from Submissions  S join Challenges C on C.challenge_id=S.challenge_id
JOIN Difficulty D ON D.difficulty_level = C.difficulty_level
join Hackers h2 on h2.hacker_id =S.hacker_id
WHERE (S.score=D.score) 
Group by S.hacker_id,h2.name
Having COUNT(C.challenge_id) > 1
ORDER BY COUNT(C.challenge_id) DESC, H asc
