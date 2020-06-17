SELECT
    C.Company_code, 
    C.founder,
    COUNT(DISTINCT L.Lead_Manager_code),
    COUNT(DISTINCT S.Senior_Manager_code),
    COUNT(DISTINCT M.Manager_code),
    count(DISTINCT E.Employee_code)
FROM Company C
JOIN Lead_Manager L 
ON L.Company_code = C.Company_code
JOIN Senior_Manager S 
ON S.Lead_Manager_code = L.Lead_Manager_code
JOIN Manager M 
ON M.Senior_Manager_code = S.Senior_Manager_code
JOIN Employee E 
ON E.Manager_code = M.Manager_code
GROUP BY C.Company_code,C.founder
ORDER BY C.Company_code ASC;










SELECT C.Company_code,
       C.founder,
  (SELECT COUNT(DISTINCT Lead_Manager_code)
   FROM Lead_Manager L
   WHERE L.Company_code = C.Company_code),
  (SELECT COUNT(DISTINCT Senior_Manager_code)
   FROM Senior_Manager S
   WHERE S.Company_code = C.Company_code),
  (SELECT COUNT(DISTINCT Manager_code)
   FROM Manager M
   WHERE M.Company_code = C.Company_code),
  (SELECT COUNT(DISTINCT Employee_code)
   FROM Employee E
   WHERE E.Company_code = C.Company_code)
FROM Company C
ORDER BY C.Company_code ASC;



