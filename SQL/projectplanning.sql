SET @r1:=0,@r2:=0;

SELECT pstart.start_date,pend.end_date
FROM (
    SELECT @r1:=@r1+1 AS N,
    start_date 
    FROM projects 
    WHERE start_date NOT IN
    (SELECT end_date from projects)) as pstart 
    JOIN (SELECT @r2:=@r2+1 as N,
                end_date FROM projects
                WHERE end_date NOT IN 
                (SELECT start_date from projects)) AS pend
                ON pstart.N=pend.N 
                ORDER BY pend.end_date-pstart.start_date,pstart.start_date;