--didn't use INTO # this time ;)

;WITH dateGroup AS (
	SELECT 
		dayMark = ROW_NUMBER () OVER (ORDER BY submission_date ASc)
		,[submission_date]
		
	FROM Submissions
	GROUP BY [submission_date]
)
,hackerGroup AS (
	SELECT
        dayMark = ROW_NUMBER () OVER (PARTITION BY hacker_id ORDER BY submission_date ASc)  
        , dayID=ROW_NUMBER () OVER (PARTITION BY submission_date ORDER BY COUNT(*) desc,[hacker_id] ASc) 		
        ,[submission_date]
		,hacker_id
  	
	FROM Submissions
	GROUP BY submission_date,hacker_id
)

,uniqueCount AS (
   SELECT 
	dg.dayMark
	,dg.submission_date
	,COUNT(hacker_id) AS uniqueCount


    FROM dateGroup dg
    LEFT JOIN hackerGroup hg
	 on dg.dayMark=hg.dayMark 
	 and dg.submission_date=hg.submission_date
   GROUP BY dg.dayMark,dg.submission_date
   )
   SELECT 
   hg.submission_date
   ,uniqueCount
   ,hg.hacker_id
	,name 
   FROM hackerGroup hg
   LEFT JOIN uniqueCount u
   ON hg.submission_date = u.submission_date
   LEFT JOIN Hackers h
   ON hg.hacker_id = h.hacker_id
   where dayID =1
