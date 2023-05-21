-----Data Manipulating Language---
-- NO.1
SELECT * FROM employee;
INSERT INTO employee (fname,lname,ssn,bdate,address,sex,salary,Superssn,dno) 
VALUES ('Aya',  'Sabry',102672,'1998-01-01 00:00:00+02','43 Dokki St. El Mohandiseen .Giza','F',1000,112233,30);

-- NO.2
INSERT INTO employee (fname,lname,ssn,bdate,address,sex,dno) 
VALUES ('Alaa',  'Khaled',102660,'1999-01-01 00:00:00+02','45 Orabi St. El Mohandiseen .Giza','F',30);

-- NO.3
SELECT * FROM departments;
INSERT INTO departments (dname,dnum,mgrssn,"MGRStart Date")  VALUES ('DEPT IT',  100,112233,'1-11-2006');

-- NO.4
UPDATE departments SET mgrSSN = 968574 WHERE dnum=100;
UPDATE departments SET mgrSSN = 102672 WHERE dnum=20;
UPDATE employee SET superssn = 102672 WHERE ssn=102660;


-- NO.5
SELECT * FROM employee;
SELECT * FROM departments;
SELECT * FROM dependent;
SELECT * FROM works_for;
SELECT * FROM project;

UPDATE  employee SET superssn = 102672 WHERE superssn = 223344 ;
UPDATE departments SET mgrSSN = 102672 WHERE mgrSSN=223344;
DELETE FROM works_for WHERE essn=223344;
DELETE FROM dependent WHERE essn=223344;
DELETE FROM employee WHERE ssn=223344;
 

-- NO.6
UPDATE employee SET salary=salary+(salary*0.2) WHERE ssn=102672;
SELECT * FROM employee;

-----Task 2----

-- NO.1
SELECT * FROM employee;

-- NO.2
SELECT fname, lname, salary, dno
FROM employee;

-- NO.3
SELECT Pname, plocation, Dnum FROM project;
								
-- NO.4
SELECT fname|| ' ' ||lname AS "full_name", (12*salary*0.1) AS "ANNUAL COMM"
FROM employee;

-- NO.5
SELECT ssn, fname, salary
FROM employee
WHERE salary >1000;

-- NO.6
SELECT ssn, fname, salary,(12*salary)  AS "Annual_salary"
FROM employee
WHERE (12*salary)>10000 ;

-- NO.7
SELECT fname, salary, sex
FROM employee
WHERE sex = 'F';

-- NO.8
SELECT dnum, dname
FROM departments
WHERE mgrssn=968574;

-- NO.9

SELECT pnumber, pname, plocation
FROM project
WHERE dnum=10;