SET QUOTED_IDENTIFIER ON
;
With numbers(Number) as
(
    Select 2 as Number
        union all
    Select Number + 1
        from numbers
        where Number < 1000     
) 

, primelist as (

SELECT 1 as category, pNum.number as value
FROM numbers pNum
LEFT JOIN
(

SELECT DISTINCT pNum.number

   FROM numbers as pNum
   INNER JOIN numbers as Vergelyk
   ON  pNum.number > Vergelyk.number
   AND ((pNum.number * 1.0)/Vergelyk.number) = 
        (CEILING(((pNum.number * 1.0)/Vergelyk.number))  * 1.0)) nonprimelist
    ON nonprimelist.number = pNum.number
    WHERE nonprimelist.number IS NULL)

SELECT
     CAST(STUFF(
     (select CAST('&' AS varchar(1)) + cast(primelist.value as varchar(100))
     from primelist
     order by value
     for xml path(''), type).value('.[1]','nvarchar(max)')
     , 1, 1, '' ) AS VARCHAR(1025)) AS Prime_Numbers
option (maxrecursion 0);