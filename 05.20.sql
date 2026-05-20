------------------------------------------
-- 5/22 실습문제 테이블
------------------------------------------

-- 주의 : department 테이블은 이름이 중복되어
--         department2 로 변경함.

drop table assign;
drop table project ;
drop table employee;
drop table department2 ;

purge recyclebin ;

create table department2
(
  dept      varchar2(10),
  phone     varchar2(15),
  office    varchar2(10),
  constraint pk_department2 primary key(dept) 
) ;

insert into department2 values ('총무부', '02-201-2343', '301호');
insert into department2 values ('관리부', '02-201-4367', '103호');
insert into department2 values ('인사부', '02-201-0932', '201호');

create table employee
(
  emp_id varchar2(3),
  name   varchar2(10),
  period_emp number(3),
  dept varchar2(10),
  constraint pk_employee primary key(emp_id),
  constraint fk_employee foreign key(dept) references department2(dept)
);

insert into employee values ('100', '김경호', 10, '총무부') ;
insert into employee values ('101', '자우림', 12, '관리부') ;
insert into employee values ('102', '김범수', 8,  '인사부') ;
insert into employee values ('103', '윤민수', 8,  '인사부') ;
insert into employee values ('104', '박정현', 9,  '총무부') ;
insert into employee values ('105', '박완규', 12, '관리부') ;

create table project
(
  project_name varchar2(10),
  address varchar2(10),
  period number(3),
  constraint pk_project primary key(project_name)
);

insert into project values ('A', '서울', 2) ;
insert into project values ('B', '부산', 4) ;
insert into project values ('C', '대전', 1) ;

create table assign
(
  emp_id varchar2(3),
  project_name varchar2(10),
  constraint fk1_assign foreign key(emp_id) references employee(emp_id),
  constraint fk2_assign foreign key(project_name) references project(project_name)
);

insert into assign values ('100', 'A') ;
insert into assign values ('100', 'C') ;
insert into assign values ('101', 'A') ;
insert into assign values ('103', 'B') ;
insert into assign values ('104', 'B') ;
insert into assign values ('104', 'A') ;

commit ;

-- 1. 근무기간(period_emp)이 10년 이상인 사원의 이름과 그들이 참여하고 있는 프로젝트명을 검색하라.
select e.name, a.project_name
from employee e join assign a on (e.emp_id = a.emp_id)
where e.period_emp >= 10;

-- assign 컬럼만 필요할 경우 이렇게 풀이도 가능
select *
from assign
where emp_id in (select emp_id from employee where period_emp >= 10);

-- 2. 프로젝트명이 'A' 인 업무에 참여하고 있는 사원의 이름과 부서명(dept)를 검색하라.
select e.name, e.dept
from employee e join assign a on (e.emp_id = a.emp_id)
where a.project_name = 'A';

select name, dept
from employee
where emp_id in (select emp_id from assign where project_name = 'A');

-- 3. 주소가 '서울'인 곳에서 진행 중인 프로젝트에 참여하는 사원의 사원의 이름과 사번을 검색하라.
select e.name, e.emp_id
from employee e join assign a on (e.emp_id = a.emp_id) join project p on (a.project_name = p.project_name)
where p.address = '서울';

-- 4. 기간(period)이 2년 이상인 프로젝트에 참여하는 사원의 이름과 부서명을 검색하라.
select e.name, e.dept
from employee e join assign a on (e.emp_id = a.emp_id) join project p on (a.project_name = p.project_name)
where p.period >= 2;

-- 5. ‘총무부’ 사원들이 참여하고 있는 프로젝트 이름과 기간을 검색하라.
select p.project_name, p.period
from employee e join assign a on (e.emp_id = a.emp_id) join project p on (a.project_name = p.project_name)
where e.dept  = '총무부';

-- 6. 부서별 사원 수와 평균 근무기간을 검색하라.
select dept, count(*) as "사원 수", avg(period_emp) as "평균 근무시간"
from employee
group by dept;

-- 7. 부서별 사원들이 참여하고 있는 프로젝트의 평균 기간을 검색하라.
select e.dept, avg(p.period) as "평균 기간"
from employee e join assign a on (e.emp_id = a.emp_id) join project p on (a.project_name = p.project_name)
group by e.dept;

-- 8. 프로젝트별 참여하고 있는 사원 수와 평균 근무기간을 검색하라.
select a.project_name, count(*) as "사원 수", avg(e.period_emp) as "평균 근무기간"
from employee e join assign a on (e.emp_id = a.emp_id)
group by a.project_name;

-- 9. 근무기간이 10년 이상인 사원들이 참여하고 있는 프로젝트 수를 검색하라.
select count(distinct a.project_name) as "프로젝트 수"
from employee e join assign a on (e.emp_id = a.emp_id)
where e.period_emp >= 10;

-- 10. 프로젝트에 참여하고 있지 않은 사원의 이름과 부서명을 검색하라.
select name, dept
from employee
where emp_id NOT IN (select emp_id from assign);

select *
from employee e left outer join assign a on e.emp_id = a.emp_id
where a.emp_id is null;


-- 추가. 박정현이 참여하고 있는 프로젝트에 참여하고 있는 사원들의 사번을 검색하라.
select emp_id
from assign
where project_name IN (select a2.project_name from employee e2 join assign a2 on (e2.emp_id = a2.emp_id) where e2.name = '박정현');

select emp_id
from assign
where project_name in (select project_name from assign where emp_id in (select emp_id from employee where name = '박정현'));

