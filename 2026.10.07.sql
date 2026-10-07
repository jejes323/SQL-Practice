drop table department purge;
create table department
( deptno number(3) primary key ,
  dname varchar2(50) not null,
  part number(3),
  build  varchar2(30)) ;

insert into department 
values (101,'Computer Engineering',100,'Information Bldg');

insert into department
values (102,'Multimedia Engineering',100,'Multimedia Bldg');

insert into department
values (103,'Software Engineering',100,'Software Bldg');

insert into department
values (201,'Electronic Engineering',200,'Electronic Control Bldg');

insert into department
values (202,'Mechanical Engineering',200,'Machining Experiment Bldg');

insert into department
values (203,'Chemical Engineering',200,'Chemical Experiment Bldg');

insert into department
values (301,'Library and Information science',300,'College of Liberal Arts');

insert into department
values (100,'Department of Computer Information',10,null);

insert into department
values (200,'Department of Mechatronics',10,null);

insert into department
values (300,'Department of Humanities and Society',20,null);

insert into department
values (10,'College of Engineering',null,null);

insert into department
values (20,'College of Liberal Arts',null,null);

---------------

drop table student purge;

create table student
( studno number(4) primary key,
  name   varchar2(30) not null,
  id varchar2(20) not null unique,
  grade number check(grade between 1 and 6),
  jumin char(13) not null,
  birthday  date,
  tel varchar2(15),
  height  number(4),
  weight  number(3),
  deptno1 number(3),
  deptno2 number(3),
  profno  number(4)) ;

insert into student values (
9411,'James Seo','75true',4,'7510231901813',to_date('1975-10-23','YYYY-MM-DD'),'055)381-2158',180,72,101,201,1001);

insert into student values (
9412,'Rene Russo','Russo',4,'7502241128467',to_date('1975-02-24','YYYY-MM-DD'),'051)426-1700',172,64,102,null,2001);

insert into student values (
9413,'Sandra Bullock','Bullock',4,'7506152123648',to_date('1975-06-15','YYYY-MM-DD'),'053)266-8947',168,52,103,203,3002);

insert into student values (
9414,'Demi Moore','Moore',4,'7512251063421',to_date('1975-12-25','YYYY-MM-DD'),'02)6255-9875',177,83,201,null,4001);

insert into student values (
9415,'Danny Glover','Glover',4,'7503031639826',to_date('1975-03-03','YYYY-MM-DD'),'031)740-6388',182,70,202,null,4003);

insert into student values (
9511,'Billy Crystal','Crystal',3,'7601232186327',to_date('1976-01-23','YYYY-MM-DD'),'055)333-6328',164,48,101,null,1002);

insert into student values (
9512,'Nicholas Cage','Cage',3,'7604122298371',to_date('1976-04-12','YYYY-MM-DD'),'051)418-9627',161,42,102,201,2002);

insert into student values (
9513,'Micheal Keaton','Keaton',3,'7609112118379',to_date('1976-09-11','YYYY-MM-DD'),'051)724-9618',177,55,202,null,4003);

insert into student values (
9514,'Bill Murray','Murray',3,'7601202378641',to_date('1976-01-20','YYYY-MM-DD'),'055)296-3784',160,58,301,101,4007);

insert into student values (
9515,'Macaulay Culkin','Culkin',3,'7610122196482',to_date('1976-10-12','YYYY-MM-DD'),'02)312-9838',171,54,201,null,4001);

insert into student values (
9611,'Richard Dreyfus','Dreyfus',2,'7711291186223',to_date('1977-11-29','YYYY-MM-DD'),'02)6788-4861',182,72,101,null,1002);

insert into student values (
9612,'Tim Robbins','Robbins',2,'7704021358674',to_date('1977-04-02','YYYY-MM-DD'),'055)488-2998',171,70,102,null,2001);

insert into student values (
9613,'Wesley Snipes','Snipes',2,'7709131276431',to_date('1977-09-13','YYYY-MM-DD'),'053)736-4981',175,82,201,null,4002);

insert into student values (
9614,'Steve Martin','Martin',2,'7702261196365',to_date('1977-02-26','YYYY-MM-DD'),'02)6175-3945',166,51,201,null,4003);

insert into student values (
9615,'Daniel Day-Lewis','Day-Lewis',2,'7712141254963',to_date('1977-12-14','YYYY-MM-DD'),'051)785-6984',184,62,301,null,4007);

insert into student values (
9711,'Danny Devito','Devito',1,'7808192157498',to_date('1978-08-19','YYYY-MM-DD'),'055)278-3649',162,48,101,null,null);

insert into student values (
9712,'Sean Connery','Connery',1,'7801051776346',to_date('1978-01-05','YYYY-MM-DD'),'02)381-5440',175,63,201,null,null);

insert into student values (
9713,'Christian Slater','Slater',1,'7808091786954',to_date('1978-08-09','YYYY-MM-DD'),'031)345-5677',173,69,201,null,null);

insert into student values (
9714,'Charlie Sheen','Sheen',1,'7803241981987',to_date('1978-03-24','YYYY-MM-DD'),'055)423-9870',179,81,102,null,null);

insert into student values (
9715,'Anthony Hopkins','Hopkins',1,'7802232116784',to_date('1978-02-23','YYYY-MM-DD'),'02)6122-2345',163,51,103,null,null);

------------------
create table gift
( gno  number ,
  gname varchar2(30) ,
  g_start  number ,
  g_end  number ) ;

insert into gift values(1,'Tuna Set',1,100000);
insert into gift values(2,'Shampoo Set',100001,200000);
insert into gift values(3,'Car wash Set',200001,300000);
insert into gift values(4,'Kitchen Supplies Set',300001,400000);
insert into gift values(5,'Mountain bike',400001,500000);
insert into gift values(6,'LCD Monitor',500001,600000);
insert into gift values(7,'Notebook',600001,700000);
insert into gift values(8,'Wall-Mountable TV',700001,800000);
insert into gift values(9,'Drum Washing Machine',800001,900000);
insert into gift values(10,'Refrigerator',900001,1000000);

-----------------

DROP TABLE customer purge;

create table customer
(gno  number(8) ,
 gname varchar2(30) ,
 jumin char(13) ,
 point number) ;

insert into customer values (20010001,'James Seo','7510231369824',980000);
insert into customer values (20010002,'Mel Gibson','7502241128467',73000);
insert into customer values (20010003,'Bruce Willis','7506152123648',320000);
insert into customer values (20010004,'Bill Pullman','7512251063421',65000);
insert into customer values (20010005,'Liam Neeson','7503031639826',180000);
insert into customer values (20010006,'Samuel Jackson','7601232186327',153000);
insert into customer values (20010007,'Ahnjihye','7604212298371',273000);
insert into customer values (20010008,'Jim Carrey','7609112118379',315000);
insert into customer values (20010009,'Morgan Freeman','7601202378641',542000);
insert into customer values (20010010,'Arnold Scharz','7610122196482',265000);
insert into customer values (20010011,'Brad Pitt','7711291186223',110000);
insert into customer values (20010012,'Michael Douglas','7704021358674',99000);
insert into customer values (20010013,'Robin Williams','7709131276431',470000);
insert into customer values (20010014,'Tom Hanks','7702261196365',298000);
insert into customer values (20010015,'Angela Bassett','7712141254963',420000);
insert into customer values (20010016,'Jessica Lange','7808192157498',598000);
insert into customer values (20010017,'Winona Ryder','7801051776346',625000);
insert into customer values (20010018,'Michelle Pfeiffer','7808091786954',670000);
insert into customer values (20010019,'Whoopi Goldberg','7803242114563',770000);
insert into customer values (20010020,'Emma Thompson','7802232116784',730000);
commit ;

----------------------

DROP TABLE EMP purge;

CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) ,
 CONSTRAINT EMP_PRIMARY_KEY PRIMARY KEY (EMPNO));

INSERT INTO EMP VALUES (7369,'SMITH', 'CLERK',    7902,to_date('80-12-17'), 800, NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN', 'SALESMAN', 7698,to_date('81-02-20'),1600, 300, 30);
INSERT INTO EMP VALUES (7521,'WARD',  'SALESMAN', 7698,to_date('81-02-22'),1250, 500, 30);
INSERT INTO EMP VALUES (7566,'JONES', 'MANAGER',  7839,to_date('81-04-02'),2975, NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN', 7698,to_date('81-09-28'),1250, 1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE', 'MANAGER',  7839,to_date('81-05-01'),2850, NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK', 'MANAGER',  7839,to_date('81-06-09'),2450, NULL,10);
--INSERT INTO EMP VALUES (7788,'SCOTT', 'ANALYST',  7566,to_date('87-04-19'),3000, NULL,20);
INSERT INTO EMP VALUES (7839,'KING',  'PRESIDENT',NULL,to_date('81-11-17'),5000, NULL,10);
--INSERT INTO EMP VALUES (7876,'ADAMS', 'CLERK',    7788,to_date('87-05-23'),1100, NULL,20);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN', 7698,to_date('81-09-08'),1500, 0,   30);
INSERT INTO EMP VALUES (7900,'JAMES', 'CLERK',    7698,to_date('81-12-03'), 950, NULL,30);
INSERT INTO EMP VALUES (7902,'FORD',  'ANALYST',  7566,to_date('81-04-02'),3000, NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',    7782,to_date('82-01-23'),1300, NULL,10);


commit ;

-- 1. 학생테이블(student)과 학과 테이블(department) 테이블을 사용하여 
-- 학생이름, 전공학과번호(deptno1), 1전공학과이름을 출력하시오.
select s.name, s.deptno1, d.dname
from student s join department d 
on s.deptno1 = d.deptno;

-- 2. customer 테이블과 gift 테이블을 join 하여 고객이 자기 포인트보다 낮은 포인트의 상품 중
-- 한가지를 선택할 수 있다고 할 때 Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.
SELECT c.gname, c.point, g.gname
FROM customer c JOIN gift g 
ON c.point >= g.g_start
where g.gname = 'Notebook';

-- 3.emp 테이블에서 사원번호, 사원이름, 입사일, 자신보다 먼저 입사한 사람 인원수를 출력하세요.
-- 단, 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요
-- (Oracle Join 구문과 ANSI Join 구문으로 각각 SQL를 작성하세요)
SELECT e1.empno, e1.ename, e1.hiredate, count(e2.empno)
FROM emp e1 LEFT JOIN emp e2 
ON e1.hiredate > e2.hiredate
group by e1.empno, e1.ename, e1.hiredate
order by count(e2.empno) asc;

SELECT e1.empno, e1.ename, e1.hiredate, count(e2.empno)
FROM emp e1, emp e2 
WHERE e1.hiredate > e2.hiredate(+)
group by e1.empno, e1.ename, e1.hiredate
order by count(e2.empno) asc;

-- 4. 아래와 같은 구조의 일반 테이블을 생성하세요.
-- 단, 보너스는 같이 입력되지 않으면 기본값 0으로 처리함
CREATE TABLE new_emp (
    NO NUMBER(5) PRIMARY KEY,
    NAME VARCHAR2(20),
    HIREDATE DATE,
    BONUS NUMBER(6,2) default(0)
);

-- 5. emp 테이블에서 empno, ename, sal, comm 으로 이루어진 new_emp2 테이블을 생성하고 해당 속성 값을 복사하시오.
CREATE TABLE new_emp2 AS
SELECT empno, ename, sal, comm
from emp;

-- 6. 위 문제에서 생성한 new_emp2 테이블에 DATE 타입을 가진 BIRTHDAY 컬럼을 추가하는 쿼리를 쓰세요. 
-- 단 해당 컬럼이 추가될 때 기본값으로 현재날짜( SYSDATE ) 가 자동으로 입력되도록 하세요.
ALTER TABLE new_emp2 
ADD BIRTHDAY DATE DEFAULT SYSDATE;

-- 7. new_emp2 테이블의 BIRTHDAY 컬럼 이름을 BIRTH로 변경하는 쿼리를 쓰세요.
ALTER TABLE new_emp2
RENAME COLUMN BIRTHDAY TO BIRTH;

-- 8. new_emp2 테이블의 empno 컬럼의 길이를 NUMBER(7) 로 변경하는 쿼리를 쓰세요
ALTER TABLE new_emp2
MODIFY (empno NUMBER(7));

-- 9. 위의 new_emp2 테이블에 sal + comm 값을 가지는 가상 컬럼 total 을 추가하시오.
ALTER TABLE new_emp2
ADD total NUMBER GENERATED ALWAYS AS (sal + comm);

-- 10. new_emp2 테이블의 컬럼 중에서 BIRTH 컬럼을 삭제하는 쿼리를 쓰세요.
ALTER TABLE new_emp2 DROP COLUMN BIRTH;

-- 11. new_emp2 테이블의 컬럼은 남겨 놓고 데이터만 삭제하는 쿼리를 쓰세요.
DELETE FROM new_emp2;

-- 12. new_emp2 테이블을 완전히 삭제하는 쿼리를 쓰세요.
DROP TABLE new_emp2;