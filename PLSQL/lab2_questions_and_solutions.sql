--1. Display all employees whose emp id is odd
select * from employees where mod(employee_id, 2)!=0;

--2. Write a query that print only now time in 24 Hours
select to_char(sysdate, 'hh24:mi:ss')
from dual;


-- 3. Write a Query that get number of years, months between a constant date ex : 24-
-- 2-2022 and employees hire date
-- Option #1
SELECT TRUNC(MONTHS_BETWEEN(sysdate,hire_date)) AS Years_Months,
TRUNC(MONTHS_BETWEEN(sysdate,hire_date)/12) AS Months
FROM employees;
-- Option #2
SELECT ROUND(MONTHS_BETWEEN(sysdate,hire_date),2) AS Years_Months
FROM employees;
-- update
SELECT TRUNC(months_between(TO_DATE('24-2-2022','dd-mm-yyyy'), hire_date)/12) AS
YEARS,
MOD(TRUNC(months_between(TO_DATE('24-2-2022','dd-mm-yyyy'), hire_date)/12),2) AS
MONTHS
FROM employees;


-- 4. Write a query that displays the grade of all employees based on the value of the
-- column JOB ID, as per the table shown below:
-- JOB_ID GRADE
-- AD_ASST A
-- IT_PROG B
-- SA_REP C
-- FI_MGR D
-- None of above F
SELECT job_id,
CASE job_id
WHEN 'IT_PROG' THEN 'B'
WHEN 'SA_REP' THEN 'C'
when 'AD_ASST' then 'A'
when 'FI_MGR' then 'D'
ELSE 'F'
END AS "EMPLOYEE GRADE"
FROM employees;
-- 5. Display the employees names and commissions for all employees, if no
-- commission, displays (no commission). Hint : use to_char function
SELECT first_name, last_name, commission_pct, nvl(TO_CHAR(commission_pct, '.99'),'No Commission');
FROM employees;

FROM employees;
-- 6. Write a Query that get the date of the First Sun day in the next month
-- Print it in format like 14-december-2020
select to_char((next_day(last_day(sysdate),1)),'DD-month-YYYY') from dual;

-- 7. Write a Query that get the last day date after 3 months from today
-- Print it in format like 14-december-2020
select to_char(last_day(add_months(sysdate,3)),'DD-month-YYYY') from dual;


-- 8. Display the employee’s name, hire date and salary review date, which is the first
-- Monday after six months of service. Label the column Review. Format the dates
-- to appear in the format similar to “Sunday, the Seventh of September, 1981 “.
select FIRST_NAME||' '||LAST_NAME as name_e ,HIRE_DATE
,trim(to_char(next_day(add_months(HIRE_DATE,6),2),'Day,ddspth "of" Month,yyyy'))as review
from employees;

--9. Write a query to show employees hired only in 2005 and 2006
select first_name, last_name, hire_date FROM employees where extract(year from hire_date)
in(2005,2006);

-- 10. Write a query to print the employees net salary : net_salary = salary + comm *
-- salary / 100 .. and solve any null values.
select LAST_NAME , salary ,salary +(nvl(COMMISSION_PCT,0)*(salary/100) ) as net_salary from
employees;


-- 11. Create a new column in table employees : named : employee_notes
-- varchar2(250)
-- - Update for each employee with for example /
-- Employee no. 101 named Neena Kochaar takes salary = 17000 and works as
-- AD_VP in dept no. 90
update employees
set employee_notes = 'Employee no. '||employee_id ||' Named '||FIRST_NAME||' '|| LAST_NAME||'
Takes Salary = '||salary||' and works as '||job_id||' in Department NO. '||DEPARTMENT_ID;