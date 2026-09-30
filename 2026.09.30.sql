alter session set nls_date_format='YYYY-MM-DD';

drop table emp purge ;

CREATE TABLE EMP ( 
  EMPNO     NUMBER(4, 0), 
  ENAME     VARCHAR2(10), 
  JOB       VARCHAR2(9), 
  MGR       NUMBER(4, 0), 
  HIREDATE  DATE, 
  SAL       NUMBER(7, 2),
  COMM      NUMBER(7, 2), 
  DEPTNO    NUMBER(2, 0));

insert into emp values (7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,'1982-02-22',1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,'1981-04-02',2975,null,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,null,30);
insert into emp values (7782,'CLARK','MANAGER',7839,'1981-06-09',2450,null,10);
-- insert into emp values (7788,'SCOTT','ANALYST',7566,'1987-04-17',3000,null,20);
insert into emp values (7839,'KING','PRESIDENT',null,'1981-11-17',5000,null,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
-- insert into emp values (7876,'ADAMS','CLERK',7788,'1987-05-23',1100,null,20);
insert into emp values (7900,'JAMES','CLERK',7698,'1981-12-03',950,null,30);
insert into emp values (7902,'FORD','ANALYST',7566,'1981-12-03',3000,null,20);
insert into emp values (7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);


CREATE UNIQUE INDEX PK_EMP ON EMP (EMPNO) ;
ALTER TABLE EMP ADD  CONSTRAINT PK_EMP PRIMARY KEY (EMPNO);

/*----------------------------------------*/
drop table professor purge ;

create table professor
(profno number(4) primary key,
 name  varchar2(20) not null, 
 id  varchar2(15) not null,
 position varchar2 (30) not null,
 pay number (3) not null,
 hiredate  date not null,
 bonus number(4) ,
 deptno  number(3),
 email  varchar2(50),
 hpage  varchar2(50)) ;


insert into professor
values(1001,'Audie Murphy','Murphy','a full professor',550,to_date('1980-06-23','YYYY-MM-DD'),100,101,'captain@abc.net','http://www.abc.net');

insert into professor
values(1002,'Angela Bassett','Bassett','assistant professor',380,to_date('1987-01-30','YYYY-MM-DD'),60,101,'sweety@abc.net','http://www.abc.net');

insert into professor
values (1003,'Jessica Lange','Lange','instructor',270,to_date('1998-03-22','YYYY-MM-DD'),null,101,'pman@power.com','http://www.power.com');

insert into professor
values (2001,'Winona Ryder','Ryder','instructor',250,to_date('2001-09-01','YYYY-MM-DD'),null,102,'lamb1@hamail.net',null);

insert into professor
values (2002,'Michelle Pfeiffer','Pfeiffer','assistant professor',350,to_date('1985-11-30','YYYY-MM-DD'),80,102,'number1@naver.com','http://num1.naver.com');

insert into professor
values (2003,'Whoopi Goldberg','Goldberg','a full professor',490,to_date('1982-04-29','YYYY-MM-DD'),90,102,'bdragon@naver.com',null);

insert into professor
values (3001,'Emma Thompson','Thompson','a full professor',530,to_date('1981-10-23','YYYY-MM-DD'),110,103,'angel1004@hanmir.com',null);

insert into professor
values (3002,'Julia Roberts','Roberts','assistant professor',330,to_date('1997-07-01','YYYY-MM-DD'),50,103,'naone10@empal.com',null);

insert into professor
values (3003,'Sharon Stone','Stone','instructor',290,to_date('2002-02-24','YYYY-MM-DD'),null,103,'only_u@abc.com',null);

insert into professor
values (4001,'Meryl Streep','Streep','a full professor',570,to_date('1981-10-23','YYYY-MM-DD'),130,201,'chebin@daum.net',null);

insert into professor
values (4002,'Susan Sarandon','Sarandon','assistant professor',330,to_date('2009-08-30','YYYY-MM-DD'),null,201,'gogogo@def.com',null);

insert into professor
values (4003,'Nicole Kidman','Kidman','assistant professor',310,to_date('1999-12-01','YYYY-MM-DD'),50,202,'mypride@hanmail.net',null);

insert into professor
values (4004,'Holly Hunter','Hunter','instructor',260,to_date('2009-01-28','YYYY-MM-DD'),null,202,'ironman@naver.com',null);

insert into professor
values (4005,'Meg Ryan','Ryan','a full professor',500,to_date('1985-09-18','YYYY-MM-DD'),80,203,'standkang@naver.com',null);

insert into professor 
values (4006,'Andie Macdowell','Macdowell','instructor',220,to_date('2010-06-28','YYYY-MM-DD'),null,301,'napeople@jass.com',null);

insert into professor
values (4007,'Jodie Foster','Foster','assistant professor',290,to_date('2001-05-23','YYYY-MM-DD'),30,301,'silver-her@daum.net',null);

/*-----------------------------------------*/
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

/*-----------------------------------------*/

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

commit;

-- 1. 사원의 직급(JOB) 이 CLEARK 이면 sal 의 10%, SALESMAN 이면
--   sal 의 20%, 아니면 sal의 30%를 보너스로 지급할 예정이다.
--   사원의 사원번호, 이름, 직급(JOB), 월급, 보너스를 출력하시오.
--   * DECODE 구문 사용 *

select empno, ename, job, sal, DECODE(job, 'CLEARK', sal * 0.1, 'SALESMAN', sal * 0.2, sal * 0.3) as "보너스"
from emp;

select empno, ename, job, sal, CASE
                                WHEN job = 'CLEARK' THEN sal * 0.1
                                WHEN job = 'SALESMAN' THEN sal * 0.2
                                ELSE sal * 0.3
                              END as "보너스"
from emp;

-- 2. 사원의 월급이 1000 미만이면 50%, 1000이상 2000 미만이면 20%, 그 이상이면 10%를 보너스로 지급하고자 한다. 사원번호, 사원이름, 월급, 보너스를 출력하시오.
select empno, ename, sal, CASE
                            WHEN sal < 1000 THEN sal * 0.5
                            WHEN sal >= 1000 AND sal < 2000 THEN sal * 0.2
                            WHEN sal >= 2000 THEN sal * 0.1
                          END as "보너스"
from emp;

-- 3. 학생 테이블에서 주민번호와 성별을 출력하시오.
--   성별은 주민번호 7번째 자리가 1이면 남성, 2이면 여성을 출력하시오.
select jumin, DECODE(substr(jumin, 7, 1), 1, '남성', 2, '여성') as "성별"
from student;

select jumin, CASE
                WHEN substr(jumin, 7, 1) = 1 THEN '남성'
                WHEN substr(jumin, 7, 1) = 2 THEN '여성'
              END as "성별"
from student;

-- 4. 10번 부서 월급의 평균, 최고, 최저, 인원수를 구하여 출력하라.
select avg(sal) as "월급의 평균", MAX(sal) as "최고", MIN(sal) as "최저", count(*) as "인원수"
from emp
where deptno = 10;

-- 5. 각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호,
--           업무명, 인원수를 출력하라.

select deptno, job, count(*) as "인원수"
from emp
group by deptno, job
order by deptno;

-- 6. 같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 
--          출력하라.
select job, count(*)
from emp
group by job
having count(*) >= 4;

-- 7. 사원들을 입사일 순서대로 가장 먼저 입사한 순서대로 순위를 매기시오
select empno, ename, hiredate, RANK() OVER (ORDER BY hiredate ASC) as "순위",
    dense_rank() over (order by hiredate asc),
    row_number() over (order by hiredate asc)
from emp;

-- 8. 81년 9월 27일에 입사한 사원이 있다고 가정하면 이 사원은 몇 번째로 
--   입사한 사원이 되는가?
select rank('1981-09-27') within group (order by hiredate) as "순위"
from emp;

-- 9. 사원들의 입사일 순서대로 이름과 입사일,  월급, 월급의 누계를 구하시오.
select ename, hiredate, sal, SUM(sal) OVER (ORDER BY hiredate) as "누계"
from emp;
-- 위 결과 9, 10번 누계가 똑같은 이유는 hiredate 동점자라서 전부 합계로 취급함
select ename, hiredate, sal, SUM(sal) OVER (ORDER BY hiredate, ename) as "누계"
from emp;

-- 10. 학생 테이블에서 학번 순서대로, 학번, 이름, 학과번호(deptno1), 몸무게, 그리고 *각 학과번호별*로 몸무계의 누계를 계산하시오.
select studno, name, deptno1, weight, SUM(weight) OVER(PARTITION BY deptno1 ORDER BY studno) as "몸무계 누계"
from student;

-- 추가문제) 세 번째로 입사한 사원의 이름을 출력하세요
select *
from (select ename, hiredate, RANK() OVER (ORDER BY hiredate) as "순위" from emp
)
where 순위 = 3;

