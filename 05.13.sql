drop table student purge;
drop table department purge;

create table department 
(
	dept_id 	varchar2(10) 	not null,
	dept_name 	varchar2(20) 	not null,
	office 		varchar2(20),
	constraint pk_department primary key(dept_id)
);

create table student 
(
	stu_id 		varchar2(10) 	not null,
	resident_id 	varchar2(14) 	not null,
	name 		varchar2(10) 	not null,
	year 		int,
	address 	varchar2(10),
	dept_id 	varchar2(10),
	constraint pk_student primary key(stu_id),
	constraint fk_student foreign key(dept_id) references 
		department(dept_id)
);


insert into department values('920', '컴퓨터공학과', '201호') ;
insert into department values('923', '산업공학과', '207호') ;
insert into department values('925', '전자공학과', '308호') ;

insert into student 
values('1292001', '1825409', '김광식', 3, '서울', 920) ;
insert into student 
values('1292002', '1730021', '김정현', 3, '서울', 920) ;
insert into student 
values('1292003', '2308302', '김현정', 4, '대전', 920) ;
insert into student 
values('1292301', '2704012', '김현정', 2, '대구', 923) ;
insert into student 
values('1292303', '1524390', '박광수', 3, '광주', 923) ;
insert into student 
values('1292305', '1809003', '김우주', 4, '부산', 923) ;
insert into student 
values('1292501', '1506390', '박철수', 3, '대전', 925) ;
insert into student 
values('1292502', '1809003', '백태성', 3, '서울', 925) ;

commit ;

create view v_stud1 as 
select stu_id, resident_id, name
from student;


Insert into v_stud1 values ('1234567', '1234567', '홍길동');

select * from v_stud1;
select * from student;

delete from v_stud1 where stu_id = '1234567';

create view v_stud920 as
select * from student
where dept_id = 920;

select * from v_stud920;

update v_stud920 set dept_id = 923
where name = '김정현';

create view v_stud925 as
select * from student
where dept_id = 925
with check option;

select * from v_stud925;

update v_stud925 set dept_id = 923
where name = '박철수';

update v_stud925 set name = '홍길동'
where name = '박철수';

create view v_stud2 as
select s.stu_id, s.name, d.dept_id, d.dept_name
from student s join department d on s.dept_id = d.dept_id
where d.dept_name = '컴퓨터공학과';

select * from v_stud2;

insert into v_stud2 values ('1000', '홍길동', 100, '경영학과');

drop view v_stud1;
drop view v_stud2;