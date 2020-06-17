SELECT * 
FROM
(SELECT h.hacker_id
 ,name
 ,SUM(s.maxscore) AS sumTotal
FROM hackers h
JOIN 
    (SELECT hacker_id
     ,challenge_id
     , max(score) AS maxscore 
     FROM submissions
    GROUP BY hacker_id, challenge_id) AS s
    ON h.hacker_id=s.hacker_id
GROUP BY h.hacker_id, h.name) AS r 
WHERE r.sumTotal > 0
ORDER BY r.sumTotal DESC, hacker_id;