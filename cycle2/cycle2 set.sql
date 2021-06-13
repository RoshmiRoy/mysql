CREATE TABLE SAILORS
(
sid  INT,
sname  VARCHAR(10),
rating INT,
age  INT
);
DESCRIBE SAILORS;
INSERT INTO SAILORS(sid,sname,rating,age)VALUES(22,'DUSTIN',7,45);
INSERT INTO SAILORS(sid,sname,rating,age)VALUES(29,'BRUTAS',1,33);
INSERT INTO SAILORS(sid,sname,rating,age)VALUES(31,'LUBBER',8,55);
INSERT INTO SAILORS(sid,sname,rating,age)VALUES(32,'ANDY',8,25);
INSERT INTO SAILORS(sid,sname,rating,age)VALUES(58,'RUSTY',10,35);
INSERT INTO SAILORS(sid,sname,rating,age)VALUES(64,'HORATIO',7,35);
INSERT INTO SAILORS(sid,sname,rating,age)VALUES(71,'ZORBA',10,16);
INSERT INTO SAILORS(sid,sname,rating,age)VALUES(74,'HORATIO',9,35);
INSERT INTO SAILORS(sid,sname,rating,age)VALUES(85,'ART',3,26);
INSERT INTO SAILORS(sid,sname,rating,age)VALUES(95,'BOB',3,64);
SELECT * FROM SAILORS;
CREATE TABLE BOATS
(
bid  INT,
bname  VARCHAR(10),
color VARCHAR(10)
);
describe boats;
INSERT INTO BOATS(bid,bname,color)VALUES(101,'INTERLAKE','BLUE');
INSERT INTO BOATS(bid,bname,color)VALUES(102,'INTERLAKE','RED');
INSERT INTO BOATS(bid,bname,color)VALUES(103,'CLIPPER','GREEN');
INSERT INTO BOATS(bid,bname,color)VALUES(104,'MARINE','RED');
SELECT * FROM BOATS;

CREATE TABLE RESERVES
(
sid  INT,
bid  INT,
day DATE
);
INSERT INTO RESERVES(sid,bid,day)VALUES(22,101,'98-10-10');
INSERT INTO RESERVES(sid,bid,day)VALUES(22,102,'98-10-10');
INSERT INTO RESERVES(sid,bid,day)VALUES(22,103,'98-08-10');
INSERT INTO RESERVES(sid,bid,day)VALUES(22,104,'98-07-10');
INSERT INTO RESERVES(sid,bid,day)VALUES(31,102,'98-10-11');
INSERT INTO RESERVES(sid,bid,day)VALUES(31,103,'98-06-11');
INSERT INTO RESERVES(sid,bid,day)VALUES(31,104,'98-12-11');
INSERT INTO RESERVES(sid,bid,day)VALUES(64,101,'98-05-09');
INSERT INTO RESERVES(sid,bid,day)VALUES(64,102,'98-08-09');
INSERT INTO RESERVES(sid,bid,day)VALUES(74,103,'98-08-09');

SELECT * FROM RESERVES;

SELECT sname ,age FROM SAILORS;
SELECT * FROM SAILORS, RESERVES  WHERE sailors.sid = reserves.sid  AND bid = 101;
SELECT sname FROM SAILORS WHERE rating > 7;
SELECT sname FROM SAILORS,RESERVES,BOATS WHERE boats.bid = 103 AND boats.bid   = reserves.bid
AND sailors.sid = reserves.sid;
SELECT DISTINCT sname FROM SAILORS,RESERVES,BOATS WHERE color = 'Red'AND boats.bid   = reserves.bid
    AND sailors.sid = reserves.sid;

SELECT DISTINCT sname FROM SAILORS,RESERVES,BOATS WHERE ( color = 'Red' OR color = 'Green')
   AND boats.bid   = reserves.bid AND sailors.sid = reserves.sid;

7 SELECT DISTINCT color FROM SAILORS,RESERVES,BOATS WHERE sname = 'Lubber'
AND boats.bid   = reserves.bid AND sailors.sid = reserves.sid;
8  SELECT DISTINCT sname FROM SAILORS,RESERVES,BOATS WHERE color = 'Red'AND
boats.bid = reserves.bid AND sailors.sid = reserves.sid UNION
SELECT DISTINCT sname FROM SAILORS,RESERVES,BOATS WHERE color = 'Green' AND
 boats.bid = reserves.bid AND sailors.sid = reserves.sid;
9. SELECT DISTINCT sname FROM SAILORS,RESERVES WHERE reserves.sid = sailors.sid;

10. SELECT sname,reserves.sid FROM RESERVES,SAILORS WHERE sailors.sid = reserves.sid 
 GROUP BY DAY,reserves.sid,sname HAVING COUNT(DAY)>1 ;
11.SELECT sname,age FROM SAILORS WHERE age =(SELECT MIN(age) FROM sailors) ; 
12 SELECT sname FROM SAILORS WHERE rating >(SELECT MAX(rating) FROM SAILORS WHERE sname = 'Horatio');
13.SELECT sname,sid FROM(SELECT sname,reserves.sid,COUNT(bid) AS id FROM RESERVES,SAILORS
  WHERE reserves.sid = sailors.sid GROUP BY reserves.SID,sname) a WHERE id =( SELECT COUNT(bid) FROM BOATS);
14 SELECT COUNT(c.sname)FROM(SELECT DISTINCT sname FROM Sailors) c;  
 15 SELECT AVG(age) FROM SAILORS; 
16 SELECT rating,AVG(age) FROM SAILORS GROUP BY rating; 
17 SELECT a.rating,b.mean FROM(SELECT COUNT(sname) AS num,rating FROM SAILORS GROUP BY rating HAVING COUNT(sname)>1)a,
(SELECT rating,AVG(age) AS mean FROM SAILORS GROUP BY rating ) b WHERE a.rating = b.rating;