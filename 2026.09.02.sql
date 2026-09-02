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

-- 1. 모든 테이블 리스트를 출력하라
select * from tab;

-- 2. 모든 테이블의 구조를 출력하라
DESC EMP;

-- 3. 사원테이블에서 모든 데이터를 출력하라
select * from emp;

-- 4. 사원테이블에서 사원번호, 사원이름, 월급을 출력하라
select EMPNO, ENAME, SAL from emp;

-- 5. 사원테이블에서 월급을 뽑는데 중복된 데이터가 없게 출력하라
select distinct sal from emp;

-- 6. 사원테이블에서 사원이름과 월급을 출력하는데 각각의 컬럼명을 "이 름","월 급"으로 바꿔서 출력하라. 단, ALIAS에 공백 추가
select ENAME as "이 름", sal as "월 급" from emp;

-- 7. 사원테이블에서 사원이름, 월급을 뽑고, 월급과 커미션을  더한 값을 출력하는데 컬럼명을 '실급여'이라고 해서 출력하라.
-- (단, 커미션이 0이거나  NULL 인 사람 제외)
select ENAME, sal + comm as "실급여"
from emp
where comm is not NULL and comm != 0;

-- 8. 사원테이블에서 'SMITH'이라는 사원의 사원번호, 이름, 월급을 출력하라
select empno, ename, sal
from emp
where ename = 'SMITH';

-- 9. 사원테이블에서 직위가 'SALESMAN'인 사원의 사원번호, 이름, 직위를 출력하라
select empno, ename, job
from emp
where job = 'SALESMAN';

-- 10. 사원테이블에서 사원번호가 7499, 7521, 7654인 사원의 사원번호, 이름 월급을 출력하라
select empno, ename, sal
from emp
where EMPNO IN (7499, 7521, 7654);

-- 11. 사원테이블에서 월급이 1500에서 3000사이인 사원의 사원번호, 이름, 월급을 출력하라.
select empno, ename, sal
from emp
where sal >= 1500 AND sal <= 3000;

-- 12. 사원테이블에서 이름의 첫글자가 A이고 마지막 글자가 N이 아닌 사원의 이름을 출력하라
select ename
from emp
where ename LIKE 'A%' AND ename NOT LIKE '%N';

-- 13. 사원테이블에서 월급이 많은 순으로 모든 정보를 출력하라
select *
from emp
order by sal desc;
