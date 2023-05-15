-- Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers


with temp as (
select (salary * months) as earnings
    from Employee
)
-- this will group by earnings having earnings = max(earnings) then will select max(earnings) and count(*) how many.
select max(earnings) as max_earnings, count(*) as max_qty from temp
group by earnings
having earnings = (
    select max(earnings) from temp
)
;