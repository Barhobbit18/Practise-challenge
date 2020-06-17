---version 1----------------

SELECT s.name
FROM students s 
     ,friends f
     ,packages p1
     ,packages p2
	 
WHERE s.ID = f.ID
  AND f.friend_ID = p2.ID
  AND s.ID = p1.ID
  AND p1.salary < p2.salary
ORDER BY p2.salary;



---version2------------------

SELECT s.name
FROM students s 
    JOIN friends f
    ON s.ID = f.ID
    JOIN packages p2
    ON f.friend_ID = p2.ID
    JOIN packages p1
    ON s.ID = p1.ID

WHERE  p1.salary < p2.salary
ORDER BY p2.salary;





