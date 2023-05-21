
-- 1-Display the last name concatenated with the job id, separated by a comma and
-- space and name the column [Employee and Title] as alias

select LAST_NAME||', '||JOB_ID as "Employee and Title"
from employees;

-- 2-Display the last name and salary for all employees whose salary is not in the
-- range of $1500 and $7000.
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 1500 AND 7000;
-- 3-Display the last name, salary and commission for all employees who earn
-- commissions, Sort data in descending order of salary and commissions.
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

-- 4- Display the last name, job id and salary for all employees whose job id is
-- SA_REP or PU_MAN and their salary is not equal to $9500, $9000 or $8000


select LAST_NAME ,job_id, salary from employees where upper(job_id) in
(upper('SA_REP') ,upper('PU_MAN')) and salary not in(9500,9000,8000) ;
--5-Display all information about employees whose last name begin with letter 's' or letter 'S'


SELECT *
FROM employees
WHERE UPPER(last_name) LIKE UPPER('s%');
--6-Display all employees whose first name contains letter before last ‘e’ or ‘E’
SELECT *
FROM employees
WHERE UPPER(first_name) LIKE UPPER('%e_');
-- 7- Write a query that displays the first three letters of the employee full name,
-- and the length of his full name.

select substr(FIRST_NAME||' '||LAST_NAME,1,3) as name_, FIRST_NAME||'
'||LAST_NAME as "Emp Name",length(FIRST_NAME||' '||LAST_NAME)as
len_full_name from employees;



