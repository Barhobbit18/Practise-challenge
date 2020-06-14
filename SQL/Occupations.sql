--Methode1
SELECT
    min(case when Occupation = 'Doctor' then Name end) AS Doctor
    ,min(case when Occupation = 'Professor' then Name end) AS Professor
    ,min(case when Occupation = 'Singer' then Name end) AS Singer
    ,min(case when Occupation = 'Actor' then Name end) AS Actor
FROM
    (
    select 
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS RN,
        Occupation,
        Name
    FROM OCCUPATIONS
    )t
    GROUP BY RN
	
	


--Methode- its the same -----------------------------------------------------------------
select 
    ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS RowNumber
    ,Occupation
    ,Name
INTO #Yeah
FROM OCCUPATIONS



SELECT
    min(case when Occupation = 'Doctor' then Name end) AS Doctor
    ,min(case when Occupation = 'Professor' then Name end) AS Professor
    ,min(case when Occupation = 'Singer' then Name end) AS Singer
    ,min(case when Occupation = 'Actor' then Name end) AS Actor
FROM #Yeah
GROUP BY RowNumber