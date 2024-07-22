With CTE As 
  ( SELECT LAT_N ,
           ROW_NUMBER() OVER(ORDER BY LAT_N) AS ROW_NUM FROM STATION )

SELECT ROUND(LAT_N,4)
FROM CTE 
Where ROW_NUM = (Select CEIL((COUNT(ID)/2))
                 From Station);
