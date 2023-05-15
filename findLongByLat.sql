SELECT CAST(LONG_W AS NUMERIC(18, 4)) AS LONG_W
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;