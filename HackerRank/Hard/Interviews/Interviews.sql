SELECT
        c.contest_id,
        c.hacker_id,
        c.name,
        SUM(IFNULL(ss.tots, 0)) AS ts,
        SUM(IFNULL(ss.totas, 0)) AS tas,
        SUM(IFNULL(vs.totv, 0)) AS tv,
        SUM(IFNULL(vs.totuv, 0)) AS tuv
FROM contests c
JOIN colleges clg ON clg.contest_id = c.contest_id
JOIN challenges chlg ON chlg.college_id = clg.college_id
LEFT JOIN
(
        SELECT challenge_id, SUM(total_submissions) AS tots, SUM(total_accepted_submissions) AS totas
        FROM submission_stats
        GROUP BY challenge_id
) ss
ON ss.challenge_id = chlg.challenge_id
LEFT JOIN
(
        SELECT challenge_id, SUM(total_views) AS totv, SUM(total_unique_views) AS totuv
        FROM view_stats
        GROUP BY challenge_id
) vs
ON vs.challenge_id = chlg.challenge_id
GROUP BY 1,2,3
HAVING ts + tas + tv + tuv != 0
ORDER BY 1;
