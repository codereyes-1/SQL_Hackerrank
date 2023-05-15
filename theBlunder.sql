-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary. 
-- Write a query calculating the amount of error (i.e.actual - miscalculated average monthly salaries), and round it up to the next integer.


-- In this query, I've added a filter condition (WHERE Salary NOT LIKE '%[^0-9]%') to exclude rows where the Salary column contains non-numeric characters. This helps avoid conversion errors.

WITH temp AS (
    SELECT CAST(Salary AS INT) AS Zeroes,
           CAST(REPLACE(Salary, '0', '') AS INT) AS noZeroes
    FROM EMPLOYEES
    WHERE Salary NOT LIKE '%[^0-9]%'
)
SELECT CEILING(AVG(CAST(Zeroes AS DECIMAL))-AVG(CAST(REPLACE(noZeroes,'0','') AS DECIMAL)))
FROM temp;





