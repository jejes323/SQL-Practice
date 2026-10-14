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
/*---------------------------------*/
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

/*------------------------*/

-- 0. emp테이블과 구조가 같은 emp10, emp20 테이블을 만드시오.

create table emp10 as
select *
from emp
where 1 = 2;

create table emp20 as
select *
from emp
where 1 = 2;


-- 1. emp 테이블에서 부서번호가 10번인 사원들은 emp10에 부서번호가 20인 사원들은 emp20에 삽입하시오. 

INSERT ALL
    WHEN deptno = 10 THEN INTO emp10 VALUES (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    WHEN deptno = 20 THEN INTO emp20 VALUES (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT *
FROM emp;

-- 2. emp테이블에서 부서번호가 30번 부서의 사람들을 읽어서 emp10, emp20 모두에 삽입하시오

INSERT ALL
    INTO emp10 VALUES (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    INTO emp20 VALUES (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT *
FROM emp
WHERE deptno = 30;

-- [ MERGE 예제 ]

-- 3. emp 테이블에서 10번 부서 사람들의 (empno, ename, deptno)로 emp10 테이블을 생성하시오.
create table emp10 as
select empno, ename, deptno
from emp
where deptno = 10;

-- 4. emp테이블의 20번 부서 사람들의 (empno, ename, deptno)로 emp20 테이블을 생성하시오.
create table emp20 as
select empno, ename, deptno
from emp
where deptno = 20;

-- 5. emp 테이블의 (empno, ename, deptno) 속성만을 가지는 emp_all 테이블 구조를 생성하시오.
create table emp_all as
select empno, ename, deptno
from emp
where 1 = 2;

-- 6. emp10, emp20 을 emp_all 테이블에 합치시오. 
merge into emp_all ea
using emp10 e10 on (ea.empno = e10.empno)
when matched then
    update set ea.ename = e10.ename, ea.deptno = e10.deptno
when not matched then
    insert values (e10.empno, e10.ename, e10.deptno);
    
merge into emp_all ea
using emp20 e20 on (ea.empno = e20.empno)
when matched then
    update set ea.ename = e20.ename, ea.deptno = e20.deptno
when not matched then
    insert values (e20.empno, e20.ename, e20.deptno);
    
-- 7. emp10에 사원 추가 (7999, ADD, 10)
INSERT INTO emp10 VALUES (7999, 'ADD', 10);

-- 8. emp20 테이블에 7902번 사원의 이름을 COCA로 변경
UPDATE emp20 SET ename = 'COCA' WHERE empno = 7902;

-- 9. emp_all 테이블로 emp10, emp20 을 다시 합치고 결과를 확인 하시오.
merge into emp_all ea
using emp10 e10 on (ea.empno = e10.empno)
when matched then
    update set ea.ename = e10.ename, ea.deptno = e10.deptno
when not matched then
    insert values (e10.empno, e10.ename, e10.deptno);
    
merge into emp_all ea
using emp20 e20 on (ea.empno = e20.empno)
when matched then
    update set ea.ename = e20.ename, ea.deptno = e20.deptno
when not matched then
    insert values (e20.empno, e20.ename, e20.deptno);
    
    
-- 1. 아래의 표를 보고 테이블을 생성하면서 제약조건을 설정하세요. 
create table tcons (
    no number(5),
    name varchar2(20),
    jumin varchar2(13) constraint tcons_jumin_nn not null,
    area number,
    deptno number(3),
    
    constraint tcons_no_pk primary key(no),
    constraint tcons_jumin_uk unique(jumin),
    constraint tcons_area_ck check(area >= 1 and area <= 4)
    
);

select * from user_constraints
where table_name = 'TCONS';

-- 2. 위의 tcons 테이블에 deptno 속성에 department 테이블의 deptno 속성을 참조하는 외래키를 추가하시오.
ALTER table tcons
add constraint tcons_deptno_fk
foreign key (deptno)
references department(deptno);

-- 3. 위의 tcons 테이블에서 name 속성에 not null 제약조건을 추가하시오.
alter table tcons
modify (name constraint tcons_name_nn not null);

-- not null은 create table에서 속성 바로 옆에 붙기 때문에 modify를 사용해야함, default도 마찬가지

-- 4. 위 2번에서 추가한 외래키 제약조건을 diable 시키시오. 
-- 단 diable 후에 insert/update/delete 등의 문장은 수행되도록 설정하시오.
alter table tcons
disable novalidate constraint tcons_deptno_fk;

-- 5. 4에서 disable한 제약조건을 다시 enable하시오.
-- 단, 이전에 입력된 값들에 대한 검사를 하지 않도록 하시오.  
alter table tcons
enable novalidate constraint tcons_deptno_fk;