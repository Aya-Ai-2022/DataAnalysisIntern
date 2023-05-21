-- NO.1
WITH previous_query AS (
select Dname as Department_name, DNum as Department_id ,MGRSSN as mg from departments)
SELECT previous_query.Department_id,previous_query.Department_name,
	employee.ssn as ManagerID,employee.fname|| ' ' || employee.lname AS Manager
FROM previous_query
JOIN employee
	ON  previous_query.mg=employee.ssn;

-- NO.2
SELECT dname, pname
FROM departments , project 
WHERE departments.dnum=project.dnum;

-- NO.3

SELECT dependent.*, employee.fname|| ' ' || employee.lname AS empName
FROM  dependent ,employee 
WHERE essn=ssn;


-- NO.4
SELECT dependent.dependent_name, dependent.Sex from dependent 
where essn in (

select SSN from employee 
where employee.sex = 'F')and  dependent.sex = 'F'
UNION

SELECT dependent.dependent_name, dependent.Sex from dependent 
where essn in (

select SSN from employee where employee.sex ='M') and dependent.sex = 'M';


  
-- NO.5
SELECT pname, pnumber, plocation
FROM project
WHERE city in ('ALex', 'Cairo');
	
-- NO.6
SELECT *
FROM project
WHERE Pname like 'A%' or Pname like 'a%';
	
-- NO.7
SELECT *
FROM employee
WHERE dno=30 and (salary between 1000 and 2000);
	
-- NO.8
SELECT employee.fname|| ' ' || employee.lname AS empName
FROM employee join works_for on  employee.ssn=works_for.essn and employee.dno=10
join project 
on works_for.pno=project.pnumber and project.pname='Al Rabwah' and
 works_for.hours>=10;
	
-- NO.9
	SELECT  emp1.fname|| ' ' || emp1.lname AS empName
FROM employee as emp1,employee as emp2
WHERE emp1.Superssn=emp2.ssn and emp2.fname = 'Kamel'and emp2.lname =
'Mohamed';

-- NO.10

SELECT  Pname, sum(Hours) AS Hours
FROM works_for , project 
WHERE works_for.pno= project.pnumber
GROUP BY 1;

-- NO.11
SELECT employee.fname|| ' ' || employee.lname AS empName , project.pname
FROM employee, project , works_for  
WHERE works_for.essn=employee.ssn and works_for.pno=project.pnumber
ORDER BY 2;

-- NO.13
SELECT dno, dname, max(employee.salary) AS MAXSALARY, min(employee.salary) AS
MINSALARY, round(avg(employee.salary)) AS AVGSALARY
FROM departments , employee 
WHERE departments.dnum=employee.dno
GROUP BY 1, 2;

-- NO.13

SELECT departments.*
FROM departments , employee 
WHERE departments.dnum =employee.dno and employee.SSN in(select min(ssn) from employee);



	

      
--NO.14

SELECT e.fname|| ' ' || e.lname AS empname
FROM employee AS e, departments AS d
WHERE e.ssn=d.mgrssn
and e.ssn NOT IN (select ESSN from dependent);
	


-- NO.15
SELECT e.dno, d.dname, count(e.ssn)
FROM employee AS e, departments AS d
WHERE e.dno=d.dnum
GROUP BY e.dno, d.dname
HAVING avg(e.salary)<=(select avg(salary) from employee);


-- NO.16
	SELECT e.dno, e.lname, e.fname, p.pname
FROM works_for AS w, employee AS e, project AS p
WHERE w.essn=e.ssn and w.pno=p.pnumber
ORDER BY e.dno, e.lname, e.fname;

-- NO.17

SELECT p.pnumber, d.dname, e.lname, e.address, e.bdate
FROM employee AS e, departments AS d, project AS p
WHERE p.city = 'Cairo' and p.dnum=d.dnum and d.mgrssn=e.ssn;


