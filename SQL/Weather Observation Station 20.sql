SELECT 
CAST(S.LAT_N as DECIMAL(9,4))
FROM station AS S
    WHERE 
    (SELECT COUNT(Lat_N) 
    FROM STATION WHERE Lat_N < S.LAT_N ) = (select count(Lat_N) 
                                         FROM station
                                         WHERE Lat_N > S.LAT_N);