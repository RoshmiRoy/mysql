CREATE TABLE STUDENT(
sid INT,
name VARCHAR(20),
dob VARCHAR(20),
pmark INT,
cmark INT,
mmark int);
DESCRIBE STUDENT;
INSERT INTO STUDENT(sid,name,dob,pmark,cmark,mmark)VALUES(1022,'MARIA','20-DEC-2001',45,50,28);

INSERT INTO STUDENT(sid,name,dob,pmark,cmark,mmark)VALUES(1027,'ROSHMI','17-DEC-1980',65,12,45);

INSERT INTO STUDENT(sid,name,dob,pmark,cmark,mmark)VALUES(1024,'SANDRA','29-MAY-1999',32,56,70);

INSERT INTO STUDENT(sid,name,dob,pmark,cmark,mmark)VALUES(1025,'ANJITHA','03-JUN-1998',50,57,56);

INSERT INTO STUDENT(sid,name,dob,pmark,cmark,mmark)VALUES(1026,'NISHA','01-APRIL-1994',30,46,49);

SELECT * FROM STUDENT;


SELECT sid,name FROM STUDENT WHERE dob=(SELECT MAX(dob) FROM STUDENT);

SELECT  * FROM STUDENT WHERE mmark >=40 and (pmark>=40 or cmark >=40);
alter table STUDENT add total int;
alter table STUDENT add average float(10,3);
describe STUDENT;
select name from STUDENT where mmark=(select max(mmark) from STUDENT);

select name from STUDENT where cmark=(select min(cmark) from STUDENT);

update STUDENT set total=pmark+cmark+mmark;
select * from STUDENT;

UPDATE STUDENT SET average=total/3;

SELECT * FROM STUDENT ORDER BY total DESC;

ALTER TABLE STUDENT CHANGE   average  avg_mark INT;

SELECT * FROM STUDENT;
SELECT AVG(avg_mark) AS overall_average FROM STUDENT;

SELECT * FROM STUDENT WHERE avg_mark > (SELECT AVG(avg_mark) FROM STUDENT);

SELECT COUNT(*) FROM STUDENT WHERE avg_mark >(SELECT AVG(avg_mark) FROM STUDENT);
