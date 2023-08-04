/*NAME: SHRAVANI REDDY VODDULA
  UTA ID: 1001956618*/


/*Query 1.)  
 Retrieve the average ratings of the movies by genre for each year from 2012 to 
2016 for each genre, Drama, and Thriller.  */ 

select STARTYEAR,GENRES,YEARLY_AVG
  from (
   select st.STARTYEAR as STARTYEAR, 'Thriller' as GENRES, round(avg(ar.AVERAGERATING),8) as YEARLY_AVG
	     from TITLE_BASICS st join TITLE_RATINGS ar on st.TConST = ar.TConST 
	     where TITLETYPE = 'movie' and st.STARTYEAR between '2012' and '2016' and GENRES like '%Thriller%' 
	     group by st.STARTYEAR
union all	
select st.STARTYEAR as STARTYEAR, 'Drama' as GENRES, round(avg(ar.AVERAGERATING),8) as YEARLY_AVG
	    from TITLE_BASICS st join TITLE_RATINGS ar on st.TConST = ar.TConST 
	    where TITLETYPE = 'movie' and st.STARTYEAR between '2012' and '2016' and GENRES like '%Drama%' 
	    group by st.STARTYEAR
)TEMP 
order by STARTYEAR, GENRES;

/*STAR GENRES   YEARLY_AVG
---- -------- ----------
2012 Drama     6.4406874
2012 Thriller 5.66996149
2013 Drama    6.45925704
2013 Thriller 5.65238612
2014 Drama    6.49834586
2014 Thriller 5.63001072
2015 Drama    6.45345238
2015 Thriller 5.74272635
2016 Drama    6.56193021
2016 Thriller 5.79269311 
--------------------------------------------------------------------------------------------------------------------------------------------- */

/*Query 2.) 
 
Choose one of the genres from Adventure, Action, or Comedy. For each year 
from 1998 to 2012 and for the chosen genre, find out the actor/actress names 
with the highest average rating. There can be multiple actors/actresses with the */

SELECT ST.startyear YEAR, 'Adventure' AS GENRES, AR.AVERAGERATING  HIGHEST_AVG_ACTORRATING, PN.PRIMARYNAME  MOST_POPULAR_ACTOR 
FROM sharmac.TITLE_RATINGS AR 
JOIN sharmac.TITLE_PRINCIPALS TP ON AR.TCONST=TP.TCONST 
JOIN sharmac.TITLE_BASICS ST ON AR.TCONST=ST.TCONST
JOIN sharmac.NAME_BASICS PN ON TP.NCONST=PN.NCONST
JOIN (SELECT ST1.startyear START_YEAR, MAX(AR1.AVERAGERATING) RATINGS
      FROM sharmac.TITLE_RATINGS AR1 
      JOIN sharmac.TITLE_PRINCIPALS TP1 ON AR1.TCONST=TP1.TCONST 
      JOIN sharmac.TITLE_BASICS ST1 ON AR1.TCONST=ST1.TCONST
      JOIN sharmac.NAME_BASICS PN1 ON TP1.NCONST=PN1.NCONST
      WHERE  AR1.numvotes > ='50000' AND ST1.TITLETYPE = 'movie' AND ST1.startyear BETWEEN '1998' AND '2012' AND ST1.Genres LIKE '%Adventure%' AND TP1.ORDERING='1'
      GROUP BY ST1.startyear) DETAILS ON
      (ST.startyear = DETAILS.START_YEAR AND DETAILS.RATINGS = AR.AVERAGERATING)
    WHERE  AR.numvotes > ='50000' AND ST.TITLETYPE = 'movie' AND ST.startyear BETWEEN '1998' AND '2012' AND ST.Genres LIKE '%Adventure%' AND TP.ORDERING='1'
ORDER BY YEAR;
/*
YEAR GENRES    HIGHEST_AVG_ACTORRATING
---- --------- -----------------------
MOST_POPULAR_ACTOR
--------------------------------------------------------------------------------
1998 Adventure                     7.7
Johnny Depp

1999 Adventure                       8
Eli Marienthal

2000 Adventure                     8.5
Russell Crowe


YEAR GENRES    HIGHEST_AVG_ACTORRATING
---- --------- -----------------------
MOST_POPULAR_ACTOR
--------------------------------------------------------------------------------
2001 Adventure                     8.8
Elijah Wood

2002 Adventure                     8.7
Elijah Wood

2003 Adventure                     8.9
Elijah Wood


YEAR GENRES    HIGHEST_AVG_ACTORRATING
---- --------- -----------------------
MOST_POPULAR_ACTOR
--------------------------------------------------------------------------------
2004 Adventure                     8.2
Chieko Baish??

2005 Adventure                     8.3
Christian Bale

2006 Adventure                       8
Daniel Craig


YEAR GENRES    HIGHEST_AVG_ACTORRATING
---- --------- -----------------------
MOST_POPULAR_ACTOR
--------------------------------------------------------------------------------
2006 Adventure                       8
Leonardo DiCaprio

2007 Adventure                     8.1
Emile Hirsch

2008 Adventure                     8.4
Ben Burtt


YEAR GENRES    HIGHEST_AVG_ACTORRATING
---- --------- -----------------------
MOST_POPULAR_ACTOR
--------------------------------------------------------------------------------
2009 Adventure                     8.3
Edward Asner

2009 Adventure                     8.3
Brad Pitt

2010 Adventure                     8.8
Leonardo DiCaprio


YEAR GENRES    HIGHEST_AVG_ACTORRATING
---- --------- -----------------------
MOST_POPULAR_ACTOR
--------------------------------------------------------------------------------
2011 Adventure                     8.1
Daniel Radcliffe

2011 Adventure                     8.1
Hrithik Roshan

2012 Adventure                     8.1
Ranbir Kapoor


YEAR GENRES    HIGHEST_AVG_ACTORRATING
---- --------- -----------------------
MOST_POPULAR_ACTOR
--------------------------------------------------------------------------------
2012 Adventure                     8.1
Robert Downey Jr.


19 rows selected.
------------------------------------------------------------------------------------------*/




 
