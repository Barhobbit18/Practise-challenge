
SELECT N,
CASE
     WHEN P IS NULL THEN 'Root'
    WHEN (SELECT COUNT(*) FROM BST bb WHERE bb.P = b.N) > 0 THEN 'Inner'
ELSE 'Leaf' END
FROM BST b
ORDER BY N;