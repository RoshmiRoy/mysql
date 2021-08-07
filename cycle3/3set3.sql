CREATE TABLE employee
(ssn INT,
ename VARCHAR(40) NOT NULL,
desig VARCHAR(20),
dno INT,
doj DATE,
salary INT,
PRIMARY KEY (ssn));

CREATE TABLE department
(dnumber INT,
dname VARCHAR(20),
loc VARCHAR(40),
mgrssn INT REFERENCES employee(ssn),
PRIMARY KEY(dnumber)
);
CREATE TABLE Project
(pnumber INT,
pname VARCHAR(15),
dnum INT,
FOREIGN KEY(dnum) REFERENCES department(dnumber),
PRIMARY KEY(pnumber)
);
CREATE TABLE Work_in
(essn INT,
pno INT,
hours INT,
FOREIGN KEY (essn)
REFERENCES employee(ssn),
FOREIGN KEY (pno) REFERENCES Project(pnumber),
FOREIGN KEY (hours) REFERENCES department(dnumber)
);
INSERT INTO employee(ssn,ename,desig,dno,doj,salary)VALUES(1,'Abhi','HR',2,'2009-04-12',70000 );
INSERT INTO employee(ssn,ename,desig,dno,doj,salary)VALUES(2,'bhama','admin',1,'2008-03-10',75000 );
INSERT INTO employee(ssn,ename,desig,dno,doj,salary)VALUES(3,'chriz','sales',3,'2015-06-23',35000 );
INSERT INTO employee(ssn,ename,desig,dno,doj,salary)VALUES(4,'diya','production',5,'2015-07-21',32000 );
INSERT INTO employee(ssn,ename,desig,dno,doj,salary)VALUES(5,'govind','production',5,'2015-09-12',35000 );
INSERT INTO employee(ssn,ename,desig,dno,doj,salary)VALUES(6,'hima','finance',4,'2013-01-19',51000 );
INSERT INTO employee(ssn,ename,desig,dno,doj,salary)VALUES(7,'ira','hr',2,'2010-03-15',45000 );
INSERT INTO employee(ssn,ename,desig,dno,doj,salary)VALUES(8,'sandeep','finance',4,'2010-07-26',49000 );

insert into department(dnumber,dname,loc)values(1,'Admin','Chennai'),(2,'HR','Chennai'),(3,'Sales','Kochi'),(4,'Finance','Delhi'),
(5,'Production','Thiruvananthapuram'); 
UPDATE department SET mgrssn=2 WHERE dnumber=1;
UPDATE department SET mgrssn=1 WHERE dnumber=2; 
UPDATE department SET mgrssn=3 WHERE dnumber=3; 
UPDATE department SET mgrssn=6 WHERE dnumber=4; 
UPDATE department SET mgrssn=7 WHERE dnumber=2;
UPDATE department SET mgrssn=4 WHERE dnumber=5; 
UPDATE department SET mgrssn=5 WHERE dnumber=5;  
insert into Project(pnumber,pname,dnum)values(11,'Bancs Trsry',3),(12,'Nielesan',5),(13,'World Bnk',1),(14,'Airlines',1),(15,'Amex',4); 
insert into Work_in(essn,pno)values(1,14),(4,13),(8,12),(6,15),(2,11),(3,13); 
SELECT e.ename FROM employee e LEFT OUTER JOIN department d on d.dnumber=e.dno WHERE e.salary BETWEEN 30000 AND 40000 AND d.dnumber=5;
SELECT e.ename,d.dname FROM employee e LEFT OUTER JOIN department d on e.dno=d.dnumber ORDER BY d.dname ASC,e.ename ASC; 
SELECT p.pnumber,p.pname,count(e.ssn) FROM Work_in w LEFT OUTER JOIN Project p on w.pno=p.pnumber LEFT OUTER JOIN
 employee e on w.essn=e.ssn GROUP BY p.pname,p.pnumber;
 create VIEW emp_dept_view as select  * from employee NATURAL JOIN department;
 CREATE SYNONYM FROM   emp_dept_view;
select * from emp_dept;
Select * From employee e,department d WHERE e.dno=d.dnumber;
SELECT * FROM employee e,department d WHERE NOT(e.dno=d.dnumber);
SELECT * FROM employee e LEFT OUTER JOIN department d ON e.dno=d.dnumber; 
SELECT * FROM employee e RIGHT OUTER JOIN department d ON e.dno=d.dnumber; 
SELECT * FROM employee e INNER JOIN department d ON e.dno=d.dnumber;