CREATE TABLE STUDENT_INFO
(
Sid         INT UNIQUE ,
Stud_name   VARCHAR(20) NOT NULL,
stude_score INT DEFAULT 20
);
describe STUDENT_INFO;
ALTER TABLE STUDENT_INFO ADD PRIMARY KEY(sid);
DESCRIBE STUDENT_INFO;
INSERT INTO STUDENT_INFO VALUES(1,'ANN',198),(2,'ANNA',123),(3,'ROSHMI',190),(4,'LIY',200);

UPDATE STUDENT_INFO SET stude_score = stude_score + 5 WHERE stude_score > 150;
SELECT * FROM STUDENT_INFO;

CREATE TABLE WORKER
(
worker_id INT,
first_name VARCHAR(15),
last_name VARCHAR(15),
salary INT,
joining_date date,
department VARCHAR(15)
);
ALTER TABLE WORKER ADD PRIMARY KEY(worker_id);
DESCRIBE WORKER;
INSERT INTO worker VALUES (1,'monika','arora',100000,'2014-02-20','hr'),(2,'niharika','verma',80000,'2014-06-11','admin'),
(3,'vishal','singhal',300000,'2014-02-20','hr'),(4,'amithabh','singh',500000,'2014-02-20','admin'),
(5,'vivek','bhati',500000,'2014-06-11','admin'),
(6,'vipul','diwan',200000,'2014-06-11','account'),
(7,'satich','kumar',75000,'2014-01-20','admin');
SELECT * FROM WORKER;
CREATE TABLE bonus
( 
Worker_ID INT,
 bonus_date DATE, 
bonus_amount INT
 );
ALTER TABLE bonus ADD CONSTRAINT fk_cod_csd 
      FOREIGN KEY(Worker_ID) REFERENCES 
     worker(Worker_ID) ON DELETE CASCADE ;
INSERT INTO bonus VALUES (1,'2016-02-20',5000),(2,'2016-06-11',3000),(3,'2016-02-20',4000),(1,'2016-02-20',4500),
(2,'2016-06-11',3500);
select *from bonus;     

4.SELECT first_name AS worker_name FROM worker;
5.SELECT * FROM worker ORDER BY trim(first_name) ASC ;

6 SELECT * FROM worker WHERE trim(first_name) != 'vipul' AND trim(first_name)   != 'satich';

7 select *from worker where department='admin';
8 SELECT * FROM worker WHERE salary BETWEEN 100000 AND 500000;
9 SELECT upper(first_name) FROM worker;
 10 SELECT distinct department FROM worker;
11 SELECT SUBSTR(first_name,  1, 3) AS small FROM worker;
12 SELECT rtrim(first_name) FROM worker; 
13 SELECT ltrim(department) FROM worker;
14 SELECT distinct department, LENGTH(department) FROM worker ;
15 SELECT REPLACE(first_name, 'a', 'A') AS fname FROM worker;
16 SELECT first_name,last_name,department,salary,bonus_amount  FROM worker,bonus WHERE worker.worker_id = bonus.worker_id
 AND bonus_amount  > 4000 ;
17 DELETE from worker WHERE worker_id=7;
SELECT * FROM worker;
18 ALTER TABLE bonus DROP CONSTRAINT fk_cod_csd;
 ALTER TABLE bonus ADD CONSTRAINT fk_cod_na FOREIGN KEY(Worker_ID) 
REFERENCES worker(Worker_ID) ON DELETE no action ;
19 DELETE from worker WHERE worker_id=8;
SELECT * FROM worker;
