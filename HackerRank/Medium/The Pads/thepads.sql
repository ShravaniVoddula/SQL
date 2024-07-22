CREATE TEMPORARY TABLE temp_table1 AS
Select Concat(Name, "(",substring(Occupation,1,1),")") As Name
From OCCUPATIONS
order by Name ASC;
CREATE TEMPORARY TABLE temp_table2 AS
select Concat("There are a total of ",count(Occupation), " ",lower(Occupation),"s.") as Name
From OCCUPATIONS
group by Occupation
order by count(Occupation), Occupation Asc;

SELECT * FROM temp_table1
UNION 
SELECT * FROM temp_table2;
