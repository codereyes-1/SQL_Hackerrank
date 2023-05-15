-- The sum of all values in LAT_N rounded to a scale of 2 decimal places.
-- The sum of all values in LONG_W rounded to a scale of 2 decimal places.


select cast(sum(LAT_N) as decimal(18,2)) as lat,
cast(sum(LONG_W) as decimal(18,2)) as lon from STATION;

