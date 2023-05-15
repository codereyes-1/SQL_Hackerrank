-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.

-- You can try casting the LAT_N column to a numeric data type before applying the ROUND function, like this:


SELECT ROUND(MAX(CAST(LAT_N AS NUMERIC(18, 4))), 4) AS max_lat_n_rounded
FROM STATION
WHERE LAT_N < 137.2345;