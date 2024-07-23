
SELECT f1.*
FROM functions f1, functions f2
WHERE f1.x = f2.y AND f1.y = f2.x 
GROUP BY f1.x, f1.y
HAVING COUNT(*)>1 OR f1.x < f1.y 
ORDER BY f1.x;
