-- Obs 13
-- Query the sum of Northern Latitudes (LAT _N) from STATION having values greater than 38.7880 and less than 137.2345.
-- Truncate your answer to 4 decimal places.



select cast(sum(LAT_N) as decimal (18,4)) from STATION where LAT_N > 38.7880 and LAT_N < 137.2345;



-- Obs16

-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.

select cast(min(LAT_N) as decimal (18,4)) from STATION where LAT_N > 38.7880;



-- Obs 17

-- Query the Western Longitude (LONG_W)where the smallest
-- Northern Latitude (LAT_N) in STATION is greater than 38.7780.
-- Round your answer to 4 decimal places.


select cast(min(LONG_W) as decimal (18,4)) from STATION
where LAT_N = (
    select min(LAT_N) from station where
LAT_N > 38.7780);




-- Obs 18

-- Query the Manhattan Distance between points P1 and P, and round it to a scale of 4 decimal places.

-- Definition: The distance between two points measured along axes at right angles. In a plane with p1 at (x1, y1) and p2 at (x2, y2), it is |x1 - x2| + |y1 - y2|.


with temp as (
    select (min(LAT_N) - max(LAT_N)) AS lati, (min(LONG_W) - max(LONG_W)) AS longw FROM STATION
    )
    select round(lati + longw, 4) from temp;

-- returns -259.68590000, incorrect


with temp as (
    select cast(abs(min(LAT_N)) - abs(max(LAT_N)) as decimal (18,4)) AS lati, cast(abs(min(LONG_W)) - abs(max(LONG_W)) as decimal (18,4))  AS longw FROM STATION
    )
    select abs(round(lati + longw, 4)) from temp;

    -- Correct! 259.6859





-- Obs 19

-- Query the Euclidean Distance between points Pi and P2 and format your answer to display 4 decimal digits. https://xlinux.nist.gov/dads/HTML/euclidndstnc.html

-- √((x1 - x2)² + (y1 - y2)²)


WITH temp AS (
  SELECT
    CAST(SQUARE(MIN(LAT_N) - MAX(LAT_N)) + SQUARE(MIN(LONG_W) - MAX(LONG_W)) AS DECIMAL(18, 4)) AS distance_squared
  FROM STATION
)
SELECT
  CASE
    WHEN distance_squared IS NULL THEN NULL -- Handle null values
    ELSE CAST(SQRT(distance_squared) AS DECIMAL(18, 4)) -- Round to 4 decimal places
  END AS euclidean_distance
FROM temp;



-- Obs 20

-- A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

WITH cte AS (
  SELECT
    LAT_N,
    ROW_NUMBER() OVER (ORDER BY LAT_N) AS RowNumber,
    COUNT(*) OVER () AS TotalRows
  FROM STATION
)
SELECT
  CAST(ROUND(AVG(LAT_N), 4) AS DECIMAL(18,4)) AS median
FROM cte
WHERE RowNumber IN ((TotalRows + 1) / 2, (TotalRows + 2) / 2);