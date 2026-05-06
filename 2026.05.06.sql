--오라클 scott 계정에 들어 있는 예제 테이블 완성본

host echo Building Oracle demonstration tables.  Please wait.
set termout off
DROP TABLE EMP purge;
DROP TABLE DEPT purge;
DROP TABLE BONUS purge;
DROP TABLE SALGRADE purge;


CREATE TABLE DEPT (
 DEPTNO              NUMBER(2) NOT NULL,
 DNAME               VARCHAR2(14),
 LOC                 VARCHAR2(13),
 CONSTRAINT DEPT_PRIMARY_KEY PRIMARY KEY (DEPTNO));

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) ,
 CONSTRAINT EMP_FOREIGN_KEY FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
 CONSTRAINT EMP_PRIMARY_KEY PRIMARY KEY (EMPNO));

INSERT INTO EMP VALUES (7369,'SMITH', 'CLERK',    7902,to_date('80-12-17'), 800, NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN', 'SALESMAN', 7698,to_date('81-02-20'),1600, 300, 30);
INSERT INTO EMP VALUES (7521,'WARD',  'SALESMAN', 7698,to_date('81-02-22'),1250, 500, 30);
INSERT INTO EMP VALUES (7566,'JONES', 'MANAGER',  7839,to_date('81-04-02'),2975, NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN', 7698,to_date('81-09-28'),1250, 1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE', 'MANAGER',  7839,to_date('81-05-01'),2850, NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK', 'MANAGER',  7839,to_date('81-06-09'),2450, NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT', 'ANALYST',  7566,to_date('87-04-19'),3000, NULL,20);
INSERT INTO EMP VALUES (7839,'KING',  'PRESIDENT',NULL,to_date('81-11-17'),5000, NULL,10);
INSERT INTO EMP VALUES (7876,'ADAMS', 'CLERK',    7788,to_date('87-05-23'),1100, NULL,20);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN', 7698,to_date('81-09-08'),1500, 0,   30);
INSERT INTO EMP VALUES (7900,'JAMES', 'CLERK',    7698,to_date('81-12-03'), 950, NULL,30);
INSERT INTO EMP VALUES (7902,'FORD',  'ANALYST',  7566,to_date('81-04-02'),3000, NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',    7782,to_date('82-01-23'),1300, NULL,10);

CREATE TABLE BONUS (
 ENAME               VARCHAR2(10),
 JOB                 CHAR(9),
 SAL                 NUMBER,
 COMM                NUMBER);

CREATE TABLE SALGRADE (
 GRADE               NUMBER,
 LOSAL               NUMBER,
 HISAL               NUMBER);

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

COMMIT;

-- *주의* ssn(주민번호) 뒷자리만 들어 있음

drop table deposit  purge;
drop table client  purge;
drop table branch  purge;


create table client (
   ssn      char(7),
   name    char(12),
   address  varchar(20),
   phone    char(15),
   constraint pk_client primary key(ssn)
);


create table branch (
   branch_name varchar2(20),
   branch_head  char(12),
   address       varchar2(20),
   constraint pk_branch primary key(branch_name)
);

create table deposit (
   deposit_num   char(3),
   ssn            char(7),
   balance        number(10),
   branch_name  varchar2(20),
   constraint pk_deposit primary key(deposit_num),
   constraint fk_deposit1 foreign key(ssn) references client(ssn),
   constraint fk_deposit2 foreign key(branch_name) references branch(branch_name)
);



insert into client values ( '1234123', '김기식', '서울', '010-2121-1231' );
insert into client values ( '1273121', '홍순태', '서울', '010-3242-2352' );
insert into client values ( '2312593', '강지선', '부산', '010-5223-3214' );
insert into client values ( '2123121', '황현희', '부산', '010-5394-0909' );
insert into client values ( '1298101', '정성태', '대구', '010-4392-3241' );
insert into client values ( '2109211', '박선희', '서울', '010-7984-1383' );
insert into client values ( '1248311', '이기상', '대전', '010-5335-9786' );
insert into client values ( '1235721', '박지성', '서울', '010-5910-2312' );
insert into client values ( '2212123', '이영순', '부산', '010-9876-2323' );
insert into client values ( '1234125', '차두리', '제주', '010-5920-2312' );


insert into branch values ( '서울지점', '강동희', '서울' );
insert into branch values ( '성남지점', '박찬주', '성남' );
insert into branch values ( '광주지점', '김기백', '광주' );
insert into branch values ( '대구지점', '김기식', '대구' );
insert into branch values ( '부산지점', '홍상순', '부산' );
insert into branch values ( '대전지점', '이연희', '대전' );
insert into branch values ( '제주지점', '고희경', '제주' );
                                                                
insert into deposit values ( '100', '1234123', 330000,  '서울지점' );
insert into deposit values ( '101', '2312593', 120000,  '대전지점' );
insert into deposit values ( '102', '1248311', 2300000, '성남지점' );
insert into deposit values ( '103', '1273121', 560000,  '광주지점' );
insert into deposit values ( '104', '1235721', 870000,  '성남지점' );
insert into deposit values ( '105', '1234123', 9000,    '대구지점' );
insert into deposit values ( '106', '1234123', 110000,  '대구지점' );
insert into deposit values ( '107', '2123121', 1900000, '서울지점' );
insert into deposit values ( '108', '1273121', 320000,  '광주지점' );
insert into deposit values ( '109', '2109211', 560000,  '성남지점' );
insert into deposit values ( '110', '1273121', 1200000, '서울지점' );
insert into deposit values ( '111', '1298101', 900000,  '제주지점' );

commit ;

-- 1. 성남 지점에서 계설된 계좌를 가지고 있는 고객의 이름을 출력하시오.
select c.name
from client c join deposit d on c.ssn = d.ssn
where d.branch_name = '성남지점';

-- 2. 계좌번호 101번 계좌의 잔액보다 잔액이 많은 계좌를 출력하시오.
select *
from deposit
where balance > (select balance from deposit where deposit_num = '101');

select d2.*
from deposit d1, deposit d2
where d1.deposit_num = '101' and d1.balance < d2.balance;

-- 3. 서울지점에서 계설된 모든 계좌보다 잔액이 많은 계좌를 출력하시오.
select *
from deposit
where balance > all(select balance from deposit where branch_name = '서울지점');

select *
from deposit
where balance > (select max(balance) from deposit where branch_name = '서울지점');

-- 4. 예금 계좌를 소유하고 있지 않은 고객의 이름과 전화번호를 검색하라. (중첩질의사용)
select c.name, c.phone
from client c left outer join deposit d on c.ssn=d.ssn
where d.deposit_num is null;

-- 5. ‘ALLEN'의 직무와 같은 사람의 이름, 부서번호, 급여, 직무를 출력하라. 
select ename, deptno, sal, JOB
from emp
where job IN (select job from emp where ename = 'ALLEN');

select e2.ename, e2.deptno, e2.sal, e2.job
from emp e1, emp e2
where e1.ename='ALLEN' and e1.job = e2.job;

-- 6. 전체 사원의 평균 임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라.
select e.empno, e.ename, d.dname, e.HIREDATE, d.loc, e.sal
from EMP e join DEPT d on e.DEPTNO = d.DEPTNO
where e.sal > (select avg(sal) from emp);

-- 급여가 30번 부서의 모든 사원의 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select empno, ename, sal
from emp
where sal > all(select sal from emp where deptno = 30);

-- 8. 급여가 30번 부서의 어떤 사원의 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select empno, ename, sal
from emp
where sal > any(select sal from emp where deptno = 30);

-- 9. EMP Table에 있는 EMPNO와 MGR을 이용하여 사원번호와 사원이름, 매니저 이름을 출력하라 
select e.empno, e.ename as employee_name, m.ename as manager_name
from emp e join emp m on e.mgr = m.empno;