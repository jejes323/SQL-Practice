/*--------------------------------------*/
-- alter session set nls_date_format='YYYY-MM-DD';

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

/*--------------------------------------*/
drop table dept purge ;
CREATE TABLE DEPT (
  DEPTNO   NUMBER(2,0), 
  DNAME    VARCHAR2(14), 
  LOC      VARCHAR2(13));

insert into dept values (10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values (40,'OPERATIONS','BOSTON');

CREATE UNIQUE INDEX PK_DEPT ON DEPT (DEPTNO);
ALTER TABLE DEPT ADD  CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO);

ALTER TABLE EMP ADD CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO);

#--------------------------------
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

commit;

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

commit;
 

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

drop table emp2 cascade constraint ;

CREATE TABLE EMP2 (
 EMPNO       NUMBER  PRIMARY KEY,
 NAME        VARCHAR2(30) NOT NULL,
 BIRTHDAY    DATE,
 DEPTNO      VARCHAR2(06) NOT NULL,
 EMP_TYPE    VARCHAR2(30),
 TEL         VARCHAR2(15),
 HOBBY       VARCHAR2(30),
 PAY         NUMBER,
 POSITION    VARCHAR2(30),
 PEMPNO      NUMBER ) ;

INSERT INTO EMP2 VALUES (19900101,'Kurt Russell',TO_DATE('19640125','YYYYMMDD'),'0001','Permanent employee','054)223-0001','music',100000000,'Boss',null);
INSERT INTO EMP2 VALUES (19960101,'AL Pacino',TO_DATE('19730322','YYYYMMDD'),'1000','Permanent employee','02)6255-8000','reading',72000000,'Department head',19900101);
INSERT INTO EMP2 VALUES (19970201,'Woody Harrelson',TO_DATE('19750415','YYYYMMDD'),'1000','Permanent employee','02)6255-8005','Fitness',50000000,'Section head',19960101);
INSERT INTO EMP2 VALUES (19930331,'Tommy Lee Jones',TO_DATE('19760525','YYYYMMDD'),'1001','Perment employee','02)6255-8010','bike',60000000,'Deputy department head',19960101);
INSERT INTO EMP2 VALUES (19950303,'Gene Hackman',TO_DATE('19730615','YYYYMMDD'),'1002','Perment employee','02)6255-8020','Marathon',56000000,'Section head',19960101);
INSERT INTO EMP2 VALUES (19966102,'Kevin Bacon',TO_DATE('19720705','YYYYMMDD'),'1003','Perment employee','052)223-4000','Music',75000000,'Department head',19900101);
INSERT INTO EMP2 VALUES (19930402,'Hugh Grant',TO_DATE('19720815','YYYYMMDD'),'1004','Perment employee','042)998-7005','Climb',51000000,'Section head',19966102);
INSERT INTO EMP2 VALUES (19960303,'Keanu Reeves',TO_DATE('19710925','YYYYMMDD'),'1005','Perment employee','031)564-3340','Climb',35000000,'Deputy Section chief',19966102);
INSERT INTO EMP2 VALUES (19970112,'Val Kilmer',TO_DATE('19761105','YYYYMMDD'),'1006','Perment employee','054)223-4500','Swim',68000000,'Department head',19900101);
INSERT INTO EMP2 VALUES (19960212,'Chris O''Donnell',TO_DATE('19721215','YYYYMMDD'),'1007','Perment employee','054)223-4600',null,49000000,'Section head',19970112);
INSERT INTO EMP2 VALUES (20000101,'Jack Nicholson',TO_DATE('19850125','YYYYMMDD'),'1008','Contracted Worker','051)123-4567','Climb', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000102,'Denzel Washington',TO_DATE('19830322','YYYYMMDD'),'1009','Contracted Worker','031)234-5678','Fishing', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000203,'Richard Gere',TO_DATE('19820415','YYYYMMDD'),'1010','Contracted Worker','02)2345-6789','Baduk', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000334,'Kevin Costner',TO_DATE('19810525','YYYYMMDD'),'1011','Contracted Worker','053)456-7890','Singing', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000305,'JohnTravolta',TO_DATE('19800615','YYYYMMDD'),'1008','Probation','051)567-8901','Reading book', 22000000,'',19960212);
INSERT INTO EMP2 VALUES (20006106,'Robert De Niro',TO_DATE('19800705','YYYYMMDD'),'1009','Probation','031)678-9012','Driking',   22000000,'',19960212);
INSERT INTO EMP2 VALUES (20000407,'Sly Stallone',TO_DATE('19800815','YYYYMMDD'),'1010','Probation','02)2789-0123','Computer game', 22000000,'',19960212);
INSERT INTO EMP2 VALUES (20000308,'Tom Cruise',TO_DATE('19800925','YYYYMMDD'),'1011','Intern','053)890-1234','Golf', 20000000,'',19960212);
INSERT INTO EMP2 VALUES (20000119,'Harrison Ford',TO_DATE('19801105','YYYYMMDD'),'1004','Intern','042)901-2345','Drinking',   20000000,'',19930402);
INSERT INTO EMP2 VALUES (20000210,'Clint Eastwood',TO_DATE('19801215','YYYYMMDD'),'1005','Intern','031)345-3456','Reading book', 20000000,'',19960303);
COMMIT;

drop table dept2 cascade constraint;

CREATE TABLE DEPT2 (
 DCODE   VARCHAR2(06)  PRIMARY KEY,
 DNAME   VARCHAR2(30) NOT NULL,
 PDEPT VARCHAR2(06) ,
 AREA        VARCHAR2(30)) ;

INSERT INTO DEPT2 VALUES ('0001','President','','Pohang Main Office');
INSERT INTO DEPT2 VALUES ('1000','Management Support Team','0001','Seoul Branch Office');
INSERT INTO DEPT2 VALUES ('1001','Financial Management Team','1000','Seoul Branch Office');
INSERT INTO DEPT2 VALUES ('1002','General affairs','1000','Seoul Branch Office');
INSERT INTO DEPT2 VALUES ('1003','Engineering division','0001','Pohang Main Office');
INSERT INTO DEPT2 VALUES ('1004','H/W Support Team','1003','Daejeon Branch Office');
INSERT INTO DEPT2 VALUES ('1005','S/W Support Team','1003','Kyunggi Branch Office');
INSERT INTO DEPT2 VALUES ('1006','Business Department','0001','Pohang Main Office');
INSERT INTO DEPT2 VALUES ('1007','Business Planning Team','1006','Pohang Main Office');
INSERT INTO DEPT2 VALUES ('1008','Sales1 Team','1007','Busan Branch Office');
INSERT INTO DEPT2 VALUES ('1009','Sales2 Team','1007','Kyunggi Branch Office');
INSERT INTO DEPT2 VALUES ('1010','Sales3 Team','1007','Seoul Branch Office');
INSERT INTO DEPT2 VALUES ('1011','Sales4 Team','1007','Ulsan Branch Office');

commit;

DROP TABLE cal purge ;

CREATE TABLE cal
   (weekno  varchar2(1),
    day   varchar2(5),
    dayno varchar2(2)) ; 

insert into cal values ('1','SUN','1');
insert into cal values ('1','MON','2');
insert into cal values ('1','TUE','3');
insert into cal values ('1','WED','4');
insert into cal values ('1','THU','5');
insert into cal values ('1','FRI','6');
insert into cal values ('1','SAT','7');
insert into cal values ('2','SUN','8');
insert into cal values ('2','MON','9');
insert into cal values ('2','TUE','10');
insert into cal values ('2','WED','11');
insert into cal values ('2','THU','12');
insert into cal values ('2','FRI','13');
insert into cal values ('2','SAT','14');
insert into cal values ('3','SUN','15');
insert into cal values ('3','MON','16');
insert into cal values ('3','TUE','17');
insert into cal values ('3','WED','18');
insert into cal values ('3','THU','19');
insert into cal values ('3','FRI','20');
insert into cal values ('3','SAT','21');
insert into cal values ('4','SUN','22');
insert into cal values ('4','MON','23');
insert into cal values ('4','TUE','24');
insert into cal values ('4','WED','25');
insert into cal values ('4','THU','26');
insert into cal values ('4','FRI','27');
insert into cal values ('4','SAT','28');
insert into cal values ('5','SUN','29');
insert into cal values ('5','MON','30');
insert into cal values ('5','TUE','31');
commit ;

DROP TABLE gift purge ;

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
commit ;


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

DROP TABLE hakjum purge ;

create table hakjum
(grade char(3) ,
 min_point  number ,
 max_point  number )  ; 

insert into hakjum values ('A+',96,100);
insert into hakjum values ('A0',90,95);
insert into hakjum values ('B+',86,89);
insert into hakjum values ('B0',80,85);
insert into hakjum values ('C+',76,79);
insert into hakjum values ('C0',70,75);
insert into hakjum values ('D',0,69);

commit;


drop table score purge ;

create table score
(studno  number ,
 total number) ;

insert into score values (9411,97);
insert into score values (9412,78);
insert into score values (9413,83);
insert into score values (9414,62);
insert into score values (9415,88);
insert into score values (9511,92);
insert into score values (9512,87);
insert into score values (9513,81);
insert into score values (9514,79);
insert into score values (9515,95);
insert into score values (9611,89);
insert into score values (9612,77);
insert into score values (9613,86);
insert into score values (9614,82);
insert into score values (9615,87);
insert into score values (9711,91);
insert into score values (9712,88);
insert into score values (9713,82);
insert into score values (9714,83);
insert into score values (9715,84);

commit ;

drop table p_grade purge ;

create table p_grade
( position  varchar2(30) ,
  s_age number ,
  e_age number ,
  s_year number ,
  e_year number ,
  s_pay  number ,
  e_pay  number ) ;

insert into p_grade values ('Manager',0,24,1,2,12000000,29990000);
insert into p_grade values ('Deputy Section chief',25,28,3,5,30000000,45000000);
insert into p_grade values ('Section head',29,32,6,8,45010000,51000000);
insert into p_grade values ('Deputy department head',33,36,9,10,51010000,60000000);
insert into p_grade values ('Department head',37,40,11,13,60010000,75000000);
insert into p_grade values ('Director',41,55,14,99,75010000,100000000);

commit ;


drop table t_reg purge ;

CREATE TABLE t_reg
( text varchar2(10)) ;

INSERT ALL
INTO t_reg VALUES('ABC123')
INTO t_reg VALUES('ABC 123')
INTO t_reg VALUES('ABC  123')
INTO t_reg VALUES('abc 123')
INTO t_reg VALUES('abc  123')
INTO t_reg VALUES('a1b2c3')
INTO t_reg VALUES('aabbcc123')
INTO t_reg VALUES('?/!@#$*&')
INTO t_reg VALUES('\~*().,')
INTO t_reg VALUES(123123)
INTO t_reg VALUES('123abc')
INTO t_reg VALUES('abc')
SELECT  *  FROM dual ;

commit;


-- insert all test table

drop table p_01 purge;
drop table p_02 purge;

CREATE TABLE p_01
(no  number ,
 name varchar2(15) ) ;

CREATE TABLE p_02
(no number ,
 name varchar2(15) );



-- merge test table

drop table pt_01 purge;
drop table pt_02 purge;
drop table p_total purge;

create table pt_01
(sno varchar2(8) , pno char(4) , qty number , price  number) ;

create table pt_02
(sno varchar2(8) , pno char(4) , qty number , price number) ;

create table p_total
(sno  varchar2(8) , pno char(4) , qty number , price number) ;

INSERT ALL
 INTO pt_01 VALUES ('12010101','1000',1,500)
 INTO pt_01 VALUES ('12010102','1001',1,400)
 INTO pt_01 VALUES ('12010103','1003',1,300)
 INTO pt_02 VALUES ('12010201','1004',1,600)
 INTO pt_02 VALUES ('12010202','1000',1,500)
 INTO pt_02 VALUES ('12010203','1005',1,700)
 SELECT * FROM dual ;

commit;

-- DML error logging test table

DROP Table dml_err_test purge;

CREATE TABLE dml_err_test
( no number primary key,
  name varchar2(10)) ;

INSERT ALL
INTO dml_err_test VALUES (1,'AAA')
INTO dml_err_test VALUES (2,'BBB')
SELECT  * FROM dual ;

commit ;

create or replace procedure print_table( p_query in varchar2 )
AUTHID CURRENT_USER
is
    l_theCursor     integer default dbms_sql.open_cursor;
    l_columnValue   varchar2(4000);
    l_status        integer;
    l_descTbl       dbms_sql.desc_tab;
    l_colCnt        number;
begin
    execute immediate
    'alter session set
        nls_date_format=''yyyy-mm-dd:hh24:mi:ss'' ';
    dbms_sql.parse(  l_theCursor,  p_query, dbms_sql.native );
    dbms_sql.describe_columns
    ( l_theCursor, l_colCnt, l_descTbl );
    for i in 1 .. l_colCnt loop
        dbms_sql.define_column
        (l_theCursor, i, l_columnValue, 4000);
    end loop;
    l_status := dbms_sql.execute(l_theCursor);
    while ( dbms_sql.fetch_rows(l_theCursor) > 0 ) loop
        for i in 1 .. l_colCnt loop
            dbms_sql.column_value
            ( l_theCursor, i, l_columnValue );
            dbms_output.put_line
            ( rpad( l_descTbl(i).col_name, 30 )
              || ': ' ||
              l_columnValue );
        end loop;
        dbms_output.put_line( '-----------------' );
    end loop;
    execute immediate
        'alter session set nls_date_format=''yyyy-mm-dd'' ';
exception
    when others then
      execute immediate
          'alter session set nls_date_format=''yyyy-mm-dd'' ';
      raise;
end;
 /


-- Constraint test table

drop table t_novalidate purge ;


CREATE TABLE t_novalidate
( no number primary key ,
  name varchar2(10) not null ) ;

INSERT INTO t_novalidate VALUES(1,'AAA');
INSERT INTO t_novalidate VALUES(2,'BBB');
INSERT INTO t_novalidate VALUES(3,'CCC');
COMMIt ;

drop table t_validate purge ;


CREATE TABLE t_validate
 ( no number
    CONSTRAINT tv_no_pk PRIMARY KEY ,
   name  varchar2(10)
    CONSTRAINT tv_name_nn NOT NULL) ;

INSERT INTO t_validate VALUES (1,'AAA');
INSERT INTO t_validate VALUES (2,'BBB');
INSERT INTO t_validate VALUES (3,'CCC');
COMMIT ;

drop table t_enable purge;

CREATE TABLE t_enable
 ( no number
    CONSTRAINT te_no_pk PRIMARY KEY ,
   name varchar2(10)
    CONSTRAINT te_name_nn NOT NULL) ;



-- group function test table

drop table product purge ;

CREATE TABLE product
( p_code  number(3) primary key,
  p_name varchar2(20) not null ,
  p_price  number) ;


insert into product values (100,'Shrimp snack',800);
insert into product values (101,'Patato snack',900);
insert into product values (102,'Peanut snack',1000);
insert into product values (103,'Sesame snack',900);
insert into product values (104,'Onion snack',800);
insert into product values (105,'Sweet potato snack',1500);
commit;

drop table panmae purge ;

create table panmae
( p_date varchar2(8) not null,
  p_code number not null,
  p_qty  number ,
  p_total number ,
  p_store varchar2(5) ) ;


insert into panmae values ('20110101',100,3,2400,'1000');
insert into panmae values ('20110101',101,5,4500,'1001');
insert into panmae values ('20110101',102,2,2000,'1003');
insert into panmae values ('20110101',103,6,5400,'1004');
insert into panmae values ('20110102',102,2,2000,'1000');
insert into panmae values ('20110102',103,5,4500,'1002');
insert into panmae values ('20110102',104,3,2400,'1002');
insert into panmae values ('20110102',105,2,3000,'1000');
insert into panmae values ('20110103',100,10,8000,'1004');
insert into panmae values ('20110103',100,2,1600,'1000');
insert into panmae values ('20110103',100,3,2400,'1001');
insert into panmae values ('20110103',101,4,3600,'1003');
insert into panmae values ('20110104',100,2,1600,'1002');
insert into panmae values ('20110104',100,4,3200,'1003');
insert into panmae values ('20110104',100,5,4000,'1004');
insert into panmae values ('20110104',101,3,2700,'1001');
insert into panmae values ('20110104',101,4,3600,'1002');
insert into panmae values ('20110104',101,3,2700,'1003');
insert into panmae values ('20110104',102,4,4000,'1001');
insert into panmae values ('20110104',102,2,2000,'1002');
insert into panmae values ('20110104',103,2,1800,'1003');


commit;

drop table member purge ;
create table member
(no number(4) not null ,
 name varchar2(20) not null ,
 jumin char(13) primary key ,
 passwd varchar2(10) not null ,
 id  varchar2(10) not null unique ,
 an_key varchar2(10) ,
 an_key_dap  varchar2(15) ) ;


insert into member
 values (1001,'Nicholas Cage','7510231234567','a1234','simson','wife?','Jodie Foster') ;

insert into member
 values(1002,'Jodie Foster','7509222345678','b1234','bobby','husband?','Nicholas Cage') ;

insert into member
 values (1003,'Macaulay Culkin','1410234567890','c1234','daddy','father?','Nicholas Cage');

insert into member
 values (1004,'Nicole Kidman','1609223456789','d1234','mommy','Mather?','Jodie Foster') ;



commit;
drop table t_reg2 purge ;
create table t_reg2
(no number , 
 ip varchar2(20)) ;

insert into t_reg2 values (1,'10.10.0.1') ;
insert into t_reg2 values (2,'10.10.10.1') ;
insert into t_reg2 values (3,'172.16.5.100') ;
insert into t_reg2 values (4,'172.61.186.2') ;
insert into t_reg2 values (5,'172.61.168.2') ;
insert into t_reg2 values (6,'255.255.255.0') ;
commit;

drop table fruit purge ;
create table fruit (name varchar2(10) , price number(5)) ;
insert into fruit values ('apple' , 100) ;
insert into fruit values ('grape' , 200) ;
insert into fruit values ('orange' ,300) ;
commit;

drop table loan purge ;

create table loan
( l_date varchar2(8) not null,
  l_code number not null,
  l_qty  number ,
  l_total number ,
  l_store varchar2(5) ) ;


insert into loan values ('20110101',100,3,2400,'1000');
insert into loan values ('20110101',101,5,4500,'1001');
insert into loan values ('20110101',102,2,2000,'1003');
insert into loan values ('20110101',103,6,5400,'1004');
insert into loan values ('20110102',102,2,2000,'1000');
insert into loan values ('20110102',103,5,4500,'1002');
insert into loan values ('20110102',104,3,2400,'1002');
insert into loan values ('20110102',105,2,3000,'1000');
insert into loan values ('20110103',100,10,8000,'1004');
insert into loan values ('20110103',100,2,1600,'1000');
insert into loan values ('20110103',100,3,2400,'1001');
insert into loan values ('20110103',101,4,3600,'1003');
insert into loan values ('20110104',100,2,1600,'1002');
insert into loan values ('20110104',100,4,3200,'1003');
insert into loan values ('20110104',100,5,4000,'1004');
insert into loan values ('20110104',101,3,2700,'1001');
insert into loan values ('20110104',101,4,3600,'1002');
insert into loan values ('20110104',101,3,2700,'1003');
insert into loan values ('20110104',102,4,4000,'1001');
insert into loan values ('20110104',102,2,2000,'1002');
insert into loan values ('20110104',103,2,1800,'1003');

drop table emp cascade constraints ;

CREATE TABLE EMP ( 
  EMPNO     NUMBER(4, 0), 
  ENAME     VARCHAR2(10), 
  JOB       VARCHAR2(9), 
  MGR       NUMBER(4, 0), 
  HIREDATE  DATE, 
  SAL       NUMBER(7, 2),
  COMM      NUMBER(7, 2), 
  DEPTNO    NUMBER(2, 0)) ;

insert into emp values (7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,'1982-02-22',1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,'1981-04-02',2975,null,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,null,30);
insert into emp values (7782,'CLARK','MANAGER',7839,'1981-06-09',2450,null,10);
--insert into emp values (7788,'SCOTT','ANALYST',7566,'1987-04-17',3000,null,20);
insert into emp values (7839,'KING','PRESIDENT',null,'1981-11-17',5000,null,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
--insert into emp values (7876,'ADAMS','CLERK',7788,'1987-05-23',1100,null,20);
insert into emp values (7900,'JAMES','CLERK',7698,'1981-12-03',950,null,30);
insert into emp values (7902,'FORD','ANALYST',7566,'1981-12-03',3000,null,20);
insert into emp values (7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

drop table dept CASCADE CONSTRAINTS purge  ;

CREATE TABLE DEPT (
  DEPTNO   NUMBER(2,0), 
  DNAME    VARCHAR2(14), 
  LOC      VARCHAR2(13)) ;

insert into dept values (10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values (40,'OPERATIONS','BOSTON');

CREATE UNIQUE INDEX PK_DEPT ON DEPT (DEPTNO);
ALTER TABLE DEPT ADD  CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO);

ALTER TABLE EMP ADD CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO);


====================================

drop table professor purge;

create table professor
(profno number(4) primary key,
 name  varchar2(10) not null, 
 id  varchar2(15) not null,
 position varchar2 (10) not null,
 pay number (3) not null,
 hiredate  date not null,
 bonus number(4) ,
 deptno  number(3),
 email  varchar2(50),
 hpage  varchar2(50)) ;

insert into professor
values(1001,'조인형','captain','정교수',550,to_date('1980-06-23','YYYY-MM-DD'),100,101,'captain@abc.net','http://www.abc.net');

insert into professor
values(1002,'박승곤','sweety','조교수',380,to_date('1987-01-30','YYYY-MM-DD'),60,101,'sweety@abc.net','http://www.abc.net');

insert into professor
values (1003,'송도권','powerman','전임강사',270,to_date('1998-03-22','YYYY-MM-DD'),null,101,'pman@power.com','http://www.power.com');

insert into professor
values (2001,'양선희','lamb1','전임강사',250,to_date('2001-09-01','YYYY-MM-DD'),null,102,'lamb1@hamail.net',null);

insert into professor
values (2002,'김영조','number1','조교수',350,to_date('1985-11-30','YYYY-MM-DD'),80,102,'number1@naver.com','http://num1.naver.com');

insert into professor
values (2003,'주승재','bluedragon','정교수',490,to_date('1982-04-29','YYYY-MM-DD'),90,102,'bdragon@naver.com',null);

insert into professor
values (3001,'김도형','angel1004','정교수',530,to_date('1981-10-23','YYYY-MM-DD'),110,103,'angel1004@hanmir.com',null);

insert into professor
values (3002,'나한열','naone10','조교수',330,to_date('1997-07-01','YYYY-MM-DD'),50,103,'naone10@empal.com',null);

insert into professor
values (3003,'김현정','only-u','전임강사',290,to_date('2002-02-24','YYYY-MM-DD'),null,103,'only_u@abc.com',null);

insert into professor
values (4001,'심슨','simson','정교수',570,to_date('1981-10-23','YYYY-MM-DD'),130,201,'chebin@daum.net',null);

insert into professor
values (4002,'최슬기','gogogo','조교수',330,to_date('2009-08-30','YYYY-MM-DD'),null,201,'gogogo@def.com',null);

insert into professor
values (4003,'박원범','mypride','조교수',310,to_date('1999-12-01','YYYY-MM-DD'),50,202,'mypride@hanmail.net',null);

insert into professor
values (4004,'차범철','ironman','전임강사',260,to_date('2009-01-28','YYYY-MM-DD'),null,202,'ironman@naver.com',null);

insert into professor
values (4005,'바비','standkang','정교수',500,to_date('1985-09-18','YYYY-MM-DD'),80,203,'standkang@naver.com',null);

insert into professor 
values (4006,'전민','napeople','전임강사',220,to_date('2010-06-28','YYYY-MM-DD'),null,301,'napeople@jass.com',null);

insert into professor
values (4007,'허은','silver-her','조교수',290,to_date('2001-05-23','YYYY-MM-DD'),30,301,'silver-her@daum.net',null);

commit;

drop table department purge;
create table department
( deptno number(3) primary key ,
  dname varchar2(20) not null,
  part number(3),
  build  varchar2(14));

insert into department 
values (101,'컴퓨터공학과',100,'정보관');

insert into department
values (102,'멀티미디어공학과',100,'멀티미디어관');

insert into department
values (103,'소프트웨어공학과',100,'소프트웨어관');

insert into department
values (201,'전자공학과',200,'전자제어관');

insert into department
values (202,'기계공학과',200,'기계실험관');

insert into department
values (203,'화학공학과',200,'화학실습관');

insert into department
values (301,'문헌정보학과',300,'인문관');

insert into department
values (100,'컴퓨터정보학부',10,null);

insert into department
values (200,'메카트로닉스학부',10,null);

insert into department
values (300,'인문사회학부',20,null);

insert into department
values (10,'공과대학',null,null);

insert into department
values (20,'인문대학',null,null);

commit;
 

drop table student purge;

create table student
( studno number(4) primary key,
  name   varchar2(10) not null,
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
9411,'서진수','75true',4,'7510231901810',to_date('1975-10-23','YYYY-MM-DD'),'055)381-2158',180,72,101,201,1001);

insert into student values (
9412,'서재수','pooh94',4,'7502241128467',to_date('1975-02-24','YYYY-MM-DD'),'051)426-1700',172,64,102,null,2001);

insert into student values (
9413,'이미경','angel000',4,'7506152123648',to_date('1975-06-15','YYYY-MM-DD'),'053)266-8947',168,52,103,203,3002);

insert into student values (
9414,'김재수','gunmandu',4,'7512251063421',to_date('1975-12-25','YYYY-MM-DD'),'02)6255-9875',177,83,201,null,4001);

insert into student values (
9415,'박동호','pincle1',4,'7503031639826',to_date('1975-03-03','YYYY-MM-DD'),'031)740-6388',182,70,202,null,4003);

insert into student values (
9511,'김신영','bingo',3,'7601232186327',to_date('1976-01-23','YYYY-MM-DD'),'055)333-6328',164,48,101,null,1002);

insert into student values (
9512,'신은경','jjang1',3,'7604122298371',to_date('1976-04-12','YYYY-MM-DD'),'051)418-9627',161,42,102,201,2002);

insert into student values (
9513,'오나라','nara5',3,'7609112118379',to_date('1976-09-11','YYYY-MM-DD'),'051)724-9618',177,55,202,null,4003);

insert into student values (
9514,'구유미','guyume',3,'7601202378641',to_date('1976-01-20','YYYY-MM-DD'),'055)296-3784',160,58,301,101,4007);

insert into student values (
9515,'임세현','shyun1',3,'7610122196482',to_date('1976-10-12','YYYY-MM-DD'),'02)312-9838',171,54,201,null,4001);

insert into student values (
9611,'일지매','onejimae',2,'7711291186223',to_date('1977-11-29','YYYY-MM-DD'),'02)6788-4861',182,72,101,null,1002);

insert into student values (
9612,'김진욱','samjang7',2,'7704021358674',to_date('1977-04-02','YYYY-MM-DD'),'055)488-2998',171,70,102,null,2001);

insert into student values (
9613,'안광훈','nonnon1',2,'7709131276431',to_date('1977-09-13','YYYY-MM-DD'),'053)736-4981',175,82,201,null,4002);

insert into student values (
9614,'김문호','munho',2,'7702261196365',to_date('1977-02-26','YYYY-MM-DD'),'02)6175-3945',166,51,201,null,4003);

insert into student values (
9615,'노정호','star123',2,'7712141254963',to_date('1977-12-14','YYYY-MM-DD'),'051)785-6984',184,62,301,null,4007);

insert into student values (
9711,'이윤나','prettygirl',1,'7808192157498',to_date('1978-08-19','YYYY-MM-DD'),'055)278-3649',162,48,101,null,null);

insert into student values (
9712,'안은수','silverwt',1,'7801051776346',to_date('1978-01-05','YYYY-MM-DD'),'02)381-5440',175,63,201,null,null);

insert into student values (
9713,'인영민','youngmin',1,'7808091786954',to_date('1978-08-09','YYYY-MM-DD'),'031)345-5677',173,69,201,null,null);

insert into student values (
9714,'김주현','kimjh',1,'7803241981987',to_date('1978-03-24','YYYY-MM-DD'),'055)423-9870',179,81,102,null,null);

insert into student values (
9715,'허우','wooya2702',1,'7802232116780',to_date('1978-02-23','YYYY-MM-DD'),'02)6122-2345',163,51,103,null,null);

commit;

drop table emp2 cascade constraint ;

CREATE TABLE EMP2 (
 EMPNO       NUMBER  PRIMARY KEY,
 NAME        VARCHAR2(10) NOT NULL,
 BIRTHDAY    DATE,
 DEPTNO      VARCHAR2(06) NOT NULL,
 EMP_TYPE    VARCHAR2(08),
 TEL         VARCHAR2(15),
 HOBBY       VARCHAR2(30),
 PAY         NUMBER,
 POSITION    VARCHAR2(08),
 PEMPNO      NUMBER
);

INSERT INTO EMP2 VALUES (19900101,'나사장',TO_DATE('19640125','YYYYMMDD'),'0001','정규직','054)223-0001','음악감상',100000000,'대표이사',null);
INSERT INTO EMP2 VALUES (19960101,'전부장',TO_DATE('19730322','YYYYMMDD'),'1000','정규직','02)6255-8000','독서',72000000,'부장',19900101);
INSERT INTO EMP2 VALUES (19970201,'최일도',TO_DATE('19750415','YYYYMMDD'),'1000','정규직','02)6255-8005','운동',50000000,'과장',19960101);
INSERT INTO EMP2 VALUES (19930331,'백원만',TO_DATE('19760525','YYYYMMDD'),'1001','정규직','02)6255-8010','자전거타기',60000000,'차장',19960101);
INSERT INTO EMP2 VALUES (19950303,'천만득',TO_DATE('19730615','YYYYMMDD'),'1002','정규직','02)6255-8020','마라톤',56000000,'과장',19960101);
INSERT INTO EMP2 VALUES (19966102,'일지매',TO_DATE('19720705','YYYYMMDD'),'1003','정규직','052)223-4000','음악감상',75000000,'부장',19900101);
INSERT INTO EMP2 VALUES (19930402,'유관순',TO_DATE('19720815','YYYYMMDD'),'1004','정규직','042)998-7005','등산',51000000,'과장',19966102);
INSERT INTO EMP2 VALUES (19960303,'김문호',TO_DATE('19710925','YYYYMMDD'),'1005','정규직','031)564-3340','등산',35000000,'대리',19966102);
INSERT INTO EMP2 VALUES (19970112,'노정호',TO_DATE('19761105','YYYYMMDD'),'1006','정규직','054)223-4500','수영',68000000,'부장',19900101);
INSERT INTO EMP2 VALUES (19960212,'이윤나',TO_DATE('19721215','YYYYMMDD'),'1007','정규직','054)223-4600',null,49000000,'과장',19970112);
INSERT INTO EMP2 VALUES (20000101,'이태백',TO_DATE('19850125','YYYYMMDD'),'1008','계약직','051)123-4567','등산', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000102,'김설악',TO_DATE('19830322','YYYYMMDD'),'1009','계약직','031)234-5678','낚시', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000203,'최오대',TO_DATE('19820415','YYYYMMDD'),'1010','계약직','02)2345-6789','바둑', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000334,'박지리',TO_DATE('19810525','YYYYMMDD'),'1011','계약직','053)456-7890','노래', 30000000,'',19960212);
INSERT INTO EMP2 VALUES (20000305,'정북악',TO_DATE('19800615','YYYYMMDD'),'1008','수습직','051)567-8901','독서', 22000000,'',19960212);
INSERT INTO EMP2 VALUES (20006106,'유도봉',TO_DATE('19800705','YYYYMMDD'),'1009','수습직','031)678-9012','술',   22000000,'',19960212);
INSERT INTO EMP2 VALUES (20000407,'윤주왕',TO_DATE('19800815','YYYYMMDD'),'1010','수습직','02)2789-0123','오락', 22000000,'',19960212);
INSERT INTO EMP2 VALUES (20000308,'강월악',TO_DATE('19800925','YYYYMMDD'),'1011','인턴직','053)890-1234','골프', 20000000,'',19960212);
INSERT INTO EMP2 VALUES (20000119,'장금강',TO_DATE('19801105','YYYYMMDD'),'1004','인턴직','042)901-2345','술',   20000000,'',19930402);
INSERT INTO EMP2 VALUES (20000210,'나한라',TO_DATE('19801215','YYYYMMDD'),'1005','인턴직','031)345-3456','독서', 20000000,'',19960303);
COMMIT;

drop table dept2 cascade constraint;

CREATE TABLE DEPT2 (
 DCODE   VARCHAR2(06)  PRIMARY KEY,
 DNAME   VARCHAR2(20) NOT NULL,
 PDEPT VARCHAR2(06) ,
 AREA        VARCHAR2(16)
);

INSERT INTO DEPT2 VALUES ('0001','사장실','','포항본사');
INSERT INTO DEPT2 VALUES ('1000','경영지원부','0001','서울지사');
INSERT INTO DEPT2 VALUES ('1001','재무관리팀','1000','서울지사');
INSERT INTO DEPT2 VALUES ('1002','총무팀','1000','서울지사');
INSERT INTO DEPT2 VALUES ('1003','기술부','0001','포항본사');
INSERT INTO DEPT2 VALUES ('1004','H/W지원','1003','대전지사');
INSERT INTO DEPT2 VALUES ('1005','S/W지원','1003','경기지사');
INSERT INTO DEPT2 VALUES ('1006','영업부','0001','포항본사');
INSERT INTO DEPT2 VALUES ('1007','영업기획팀','1006','포항본사');
INSERT INTO DEPT2 VALUES ('1008','영업1팀','1007','부산지사');
INSERT INTO DEPT2 VALUES ('1009','영업2팀','1007','경기지사');
INSERT INTO DEPT2 VALUES ('1010','영업3팀','1007','서울지사');
INSERT INTO DEPT2 VALUES ('1011','영업4팀','1007','울산지사');

commit;

DROP TABLE cal purge ;

CREATE TABLE cal
   (week  varchar2(1),
    day   varchar2(2),
    num_day varchar2(2)) ;

insert into cal values ('1','일','1');
insert into cal values ('1','월','2');
insert into cal values ('1','화','3');
insert into cal values ('1','수','4');
insert into cal values ('1','목','5');
insert into cal values ('1','금','6');
insert into cal values ('1','토','7');
insert into cal values ('2','일','8');
insert into cal values ('2','월','9');
insert into cal values ('2','화','10');
insert into cal values ('2','수','11');
insert into cal values ('2','목','12');
insert into cal values ('2','금','13');
insert into cal values ('2','토','14');
insert into cal values ('3','일','15');
insert into cal values ('3','월','16');
insert into cal values ('3','화','17');
insert into cal values ('3','수','18');
insert into cal values ('3','목','19');
insert into cal values ('3','금','20');
insert into cal values ('3','토','21');
insert into cal values ('4','일','22');
insert into cal values ('4','월','23');
insert into cal values ('4','화','24');
insert into cal values ('4','수','25');
insert into cal values ('4','목','26');
insert into cal values ('4','금','27');
insert into cal values ('4','토','28');
insert into cal values ('5','일','29');
insert into cal values ('5','월','30');
insert into cal values ('5','화','31');
commit ;

DROP TABLE gift purge ;

create table gift
( gno  number ,
  gname varchar2(15) ,
  g_start  number ,
  g_end  number );

insert into gift values(1,'참치세트',1,100000);
insert into gift values(2,'샴푸세트',100001,200000);
insert into gift values(3,'세차용품세트',200001,300000);
insert into gift values(4,'주방용품세트',300001,400000);
insert into gift values(5,'산악용자전거',400001,500000);
insert into gift values(6,'LCD모니터',500001,600000);
insert into gift values(7,'노트북',600001,700000);
insert into gift values(8,'벽걸이TV',700001,800000);
insert into gift values(9,'드럼세탁기',800001,900000);
insert into gift values(10,'양쪽문냉장고',900001,1000000);
commit ;

DROP TABLE gogak purge;

create table gogak
(gno  number(8) ,
 gname varchar2(12) ,
 jumin char(13) ,
 point number) ;

insert into gogak values (20010001,'서진수','7510231369824',980000);
insert into gogak values (20010002,'서재수','7502241128467',73000);
insert into gogak values (20010003,'이미경','7506152123648',320000);
insert into gogak values (20010004,'김재수','7512251063421',65000);
insert into gogak values (20010005,'박동호','7503031639826',180000);
insert into gogak values (20010006,'김신영','7601232186327',153000);
insert into gogak values (20010007,'신은경','7604212298371',273000);
insert into gogak values (20010008,'오나라','7609112118379',315000);
insert into gogak values (20010009,'김설희','7601202378641',542000);
insert into gogak values (20010010,'임세현','7610122196482',265000);
insert into gogak values (20010011,'최순규','7711291186223',110000);
insert into gogak values (20010012,'정현영','7704021358674',99000);
insert into gogak values (20010013,'안광훈','7709131276431',470000);
insert into gogak values (20010014,'모병환','7702261196365',298000);
insert into gogak values (20010015,'노정호','7712141254963',420000);
insert into gogak values (20010016,'이윤나','7808192157498',598000);
insert into gogak values (20010017,'안은수','7801051776346',625000);
insert into gogak values (20010018,'인영민','7808091786954',670000);
insert into gogak values (20010019,'김지영','7803242114563',770000);
insert into gogak values (20010020,'허우','7802232116780',730000);
commit ;

DROP TABLE hakjum purge ;

create table hakjum
(grade char(3) ,
 min_point  number ,
 max_point  number );

insert into hakjum values ('A+',96,100);
insert into hakjum values ('A0',90,95);
insert into hakjum values ('B+',86,89);
insert into hakjum values ('B0',80,85);
insert into hakjum values ('C+',76,79);
insert into hakjum values ('C0',70,75);
insert into hakjum values ('D',0,69);

commit;


drop table exam_01 purge ;

create table exam_01
(studno  number ,
 total number);

insert into exam_01 values (9411,97);
insert into exam_01 values (9412,78);
insert into exam_01 values (9413,83);
insert into exam_01 values (9414,62);
insert into exam_01 values (9415,88);
insert into exam_01 values (9511,92);
insert into exam_01 values (9512,87);
insert into exam_01 values (9513,81);
insert into exam_01 values (9514,79);
insert into exam_01 values (9515,95);
insert into exam_01 values (9611,89);
insert into exam_01 values (9612,77);
insert into exam_01 values (9613,86);
insert into exam_01 values (9614,82);
insert into exam_01 values (9615,87);
insert into exam_01 values (9711,91);
insert into exam_01 values (9712,88);
insert into exam_01 values (9713,82);
insert into exam_01 values (9714,83);
insert into exam_01 values (9715,84);

commit ;

drop table p_grade purge ;

create table p_grade
( position  varchar2(10) ,
  s_age number ,
  e_age number ,
  s_year number ,
  e_year number ,
  s_pay  number ,
  e_pay  number );

insert into p_grade values ('주임',0,24,1,2,12000000,29990000);
insert into p_grade values ('대리',25,28,3,5,30000000,45000000);
insert into p_grade values ('과장',29,32,6,8,45010000,51000000);
insert into p_grade values ('차장',33,36,9,10,51010000,60000000);
insert into p_grade values ('부장',37,40,11,13,60010000,75000000);
insert into p_grade values ('이사',41,55,14,99,75010000,100000000);

commit ;


drop table reg_test purge ;

CREATE TABLE reg_test
( text varchar2(10)) ;

INSERT ALL
INTO reg_test VALUES('ABC123')
INTO reg_test VALUES('ABC 123')
INTO reg_test VALUES('abc 123')
INTO reg_test VALUES('a1b2c3')
INTO reg_test VALUES('aabbcc123')
INTO reg_test VALUES('?/!@#$*&')
INTO reg_test VALUES('\~*().,')
INTO reg_test VALUES(123123)
INTO reg_test VALUES('123abc')
SELECT  *  FROM dual ;

commit;


#-- insert all 실습용 테이블

drop table p_01 purge;
drop table p_02 purge;

CREATE TABLE p_01
(no  number ,
 name varchar2(10) );

CREATE TABLE p_02
(no number ,
 name varchar2(10) );



#-- merge 실습용 테이블

drop table pt_01 purge;
drop table pt_02 purge;
drop table p_total purge;

create table pt_01
(판매번호 varchar2(8) , 제품번호 char(4) , 수량 number , 금액 number) ;

create table pt_02
(판매번호 varchar2(8) , 제품번호 char(4) , 수량 number , 금액 number) ;

create table p_total
(판매번호  varchar2(8) , 제품번호 char(4) , 수량 number , 금액 number) ;

INSERT ALL
 INTO pt_01 VALUES ('12010101','1000',1,500)
 INTO pt_01 VALUES ('12010102','1001',1,400)
 INTO pt_01 VALUES ('12010103','1003',1,300)
 INTO pt_02 VALUES ('12010201','1004',1,600)
 INTO pt_02 VALUES ('12010202','1000',1,500)
 INTO pt_02 VALUES ('12010203','1005',1,700)
 SELECT * FROM dual ;

commit;

#-- DML 에러 로깅 기능 실습용 테이블

DROP Table dml_err_test purge;

CREATE TABLE dml_err_test
( no number primary key,
  name varchar2(10));

INSERT ALL
INTO dml_err_test VALUES (1,'AAA')
INTO dml_err_test VALUES (2,'BBB')
SELECT  * FROM dual ;

commit ;

create or replace procedure print_table( p_query in varchar2 )
AUTHID CURRENT_USER
is
    l_theCursor     integer default dbms_sql.open_cursor;
    l_columnValue   varchar2(4000);
    l_status        integer;
    l_descTbl       dbms_sql.desc_tab;
    l_colCnt        number;
begin
    execute immediate
    'alter session set
        nls_date_format=''yyyy-mm-dd:hh24:mi:ss'' ';
    dbms_sql.parse(  l_theCursor,  p_query, dbms_sql.native );
    dbms_sql.describe_columns
    ( l_theCursor, l_colCnt, l_descTbl );
    for i in 1 .. l_colCnt loop
        dbms_sql.define_column
        (l_theCursor, i, l_columnValue, 4000);
    end loop;
    l_status := dbms_sql.execute(l_theCursor);
    while ( dbms_sql.fetch_rows(l_theCursor) > 0 ) loop
        for i in 1 .. l_colCnt loop
            dbms_sql.column_value
            ( l_theCursor, i, l_columnValue );
            dbms_output.put_line
            ( rpad( l_descTbl(i).col_name, 30 )
              || ': ' ||
              l_columnValue );
        end loop;
        dbms_output.put_line( '-----------------' );
    end loop;
    execute immediate
        'alter session set nls_date_format=''yyyy-mm-dd'' ';
exception
    when others then
      execute immediate
          'alter session set nls_date_format=''yyyy-mm-dd'' ';
      raise;
end;
 /


#-- 제약조건 테스트용 테이블

drop table test_novalidate purge ;

CREATE TABLE test_novalidate
( no number primary key ,
  name varchar2(10) not null );

INSERT INTO test_novalidate VALUES(1,'AAA');
INSERT INTO test_novalidate VALUES(2,'BBB');
INSERT INTO test_novalidate VALUES(3,'CCC');
COMMIt ;

drop table test_validate purge ;

CREATE TABLE test_validate
 ( no number
    CONSTRAINT tv_no_pk PRIMARY KEY ,
   name  varchar2(10)
    CONSTRAINT tv_name_nn NOT NULL) ;

INSERT INTO test_validate VALUES (1,'AAA');
INSERT INTO test_validate VALUES (2,'BBB');
INSERT INTO test_validate VALUES (3,'CCC');
COMMIT ;

drop table test_enable purge;

CREATE TABLE test_enable
 ( no number
    CONSTRAINT te_no_pk PRIMARY KEY ,
   name varchar2(10)
    CONSTRAINT te_name_nn NOT NULL) ;



#-- 집계함수 연습을 위한 테이블

drop table product purge ;

CREATE TABLE product
( p_code  number(3) primary key,
  p_name varchar2(20) not null ,
  p_price  number) ;


insert into product values (100,'새우짱',800);
insert into product values (101,'감자짱',900);
insert into product values (102,'맛큰산',1000);
insert into product values (103,'에이서',900);
insert into product values (104,'맛짱구',800);
insert into product values(105,'샤보레',1500);
commit;

drop table panmae purge ;

create table panmae
( p_date varchar2(8) not null,
  p_code number not null,
  p_qty  number ,
  p_total number ,
  p_store varchar2(5) );


insert into panmae values ('20110101',100,3,2400,'1000');
insert into panmae values ('20110101',101,5,4500,'1001');
insert into panmae values ('20110101',102,2,2000,'1003');
insert into panmae values ('20110101',103,6,5400,'1004');
insert into panmae values ('20110102',102,2,2000,'1000');
insert into panmae values ('20110102',103,5,4500,'1002');
insert into panmae values ('20110102',104,3,2400,'1002');
insert into panmae values ('20110102',105,2,3000,'1000');
insert into panmae values ('20110103',100,10,8000,'1004');
insert into panmae values ('20110103',100,2,1600,'1000');
insert into panmae values ('20110103',100,3,2400,'1001');
insert into panmae values ('20110103',101,4,3600,'1003');
insert into panmae values ('20110104',100,2,1600,'1002');
insert into panmae values ('20110104',100,4,3200,'1003');
insert into panmae values ('20110104',100,5,4000,'1004');
insert into panmae values ('20110104',101,3,2700,'1001');
insert into panmae values ('20110104',101,4,3600,'1002');
insert into panmae values ('20110104',101,3,2700,'1003');
insert into panmae values ('20110104',102,4,4000,'1001');
insert into panmae values ('20110104',102,2,2000,'1002');
insert into panmae values ('20110104',103,2,1800,'1003');


commit;

drop table member purge ;

create table member
(no number(4) not null ,
 name varchar2(10) not null ,
 jumin char(13) primary key ,
 passwd varchar2(10) not null ,
 id  varchar2(15) not null unique ,
 an_key varchar2(15) ,
 an_key_dap  varchar2(20) );


insert into member
 values (1001,'서유딩','7510231234567','a1234','simson','아내이름?','김초딩') ;

insert into member
 values(1002,'김초딩','7509222345678','b1234','bobby','남편이름?','서유딩') ;

insert into member
 values (1003,'서새알','1410234567890','c1234','daddy','아빠이름?','서유딩');

insert into member
 values (1004,'서공룡알','1609223456789','d1234','mommy','엄마이름?','김초딩') ;

commit;


-- 1. emp 테이블에서 사원의 사원번호를 입력 받아서 사원의 이름, 부서번호 출력(묵시적 커서)
-- 사원이 한명도 없는 경우 "해당사원이 없습니다." 라고 출력하는 exception 절을 추가하시오.

set serveroutput on
show errors
set verify off
declare
    v_ename emp.ename%TYPE;
    v_deptno emp.deptno%TYPE;
begin
    select ename, deptno
        into v_ename, v_deptno
    from emp
    where empno = &사원번호;
    dbms_output.put_line( v_ename || v_deptno);
    
exception
    when no_data_found then
        dbms_output.put_line('해당 사원이 없습니다.');
end;
/

-- 2.  professor 테이블에서 부서번호(deptno)를 사용자로 부터 입력 받아서 해당 부서에서 
--  일하는 교수의 교수번호(profno)와 이름(name)을 출력하는 프로그램을 수행해 보고,
--  해당 부서에 교수가 한 명도 없는 경우(출력되는 결과가 없는 경우)
--  NOT_FOUND 라는 exception을 정의하고 이를 발생시켜
--  "해당 부서에 속한 교수가 없습니다" 라는 메시지를 출력하도록 하시오.

set serveroutput
show errors
set verify off

declare
    v_prof professor%ROWTYPE;
    
    cursor prof_cursor is
        select profno, name
        from professor
        where deptno =  &부서번호;
        
    not_found exception;

begin
    open prof_cursor;
    
    loop
        fetch prof_cursor into v_prof.profno, v_prof.name;
        exit when prof_cursor%NOTFOUND;
        
        dbms_output.put_line ( '교수번호:' || v_prof.profno || '  ' ||  '교수이름:' || v_prof.name );  
        
    end loop ;
    
    if prof_cursor%ROWCOUNT = 0 then
        close prof_cursor;
        raise not_found;
    end if;
    
    dbms_output.put_line('ROWCOUNT:' || prof_cursor%ROWCOUNT) ;
    close prof_cursor;
    
exception
    when not_found then
         dbms_output.put_line('해당 부서에 속한 교수가 없습니다.');
end;
/

-- 3. 위의 2번 문제에서  해당 부서에 교수가 한 명도 없는 경우(출력되는 결과가 없는 경우)
--    exception을 발생하지말고, 오라클 에러를 발생시키시오.
--    에러번호 : -2001
--    에러메시지 : "해당 부서에 속한 교수가 없습니다" 
set serveroutput on
show errors
set verify off

declare

    v_prof professor%ROWTYPE;
    
    cursor prof_cursor is
        select profno, name
        from professor
        where deptno = &부서번호;
   
begin
    open prof_cursor;
    
    loop
        fetch prof_cursor into v_prof.profno, v_prof.name;
        exit when prof_cursor%NOTFOUND;
        
        dbms_output.put_line ( '교수번호:' || v_prof.profno || '  ' ||  '교수이름:' || v_prof.name );  
        
    end loop ;
    
    if prof_cursor%ROWCOUNT = 0 then
        close prof_cursor;
        raise_application_error(-2001, '해당 부서에 교수가 한명도 없습니다.');
    end if;
    
    dbms_output.put_line('ROWCOUNT:' || prof_cursor%ROWCOUNT) ;
    close prof_cursor;
        
end;
/

-- 4. student 테이블에서 height, weight 속성을 이용하여 BMI 지수를 구하는 함수를 
-- 작성헤서 name, height, weight, bmi를 출력하시오.
-- ( 주의 : student 테이블에 키는 cm 단위임 )

set serveroutput on
show errors
set verify off

create or replace function bmi (
    v_height number,
    v_weight number
) return number
is
    v_bmi number;
begin
    v_bmi := v_weight / power((v_height / 100), 2);
    return (v_bmi);
end;
/
    
    
select name, height, weight, round(bmi(height, weight), 3) as "BMI"
from student;

-- emp테이블을 조회하여 사원들의 empno, ename, hiredate, 15% 인상 후 총연봉을 출력하세요.
-- 단 총연봉은 (sal*12) + comm으로 계산함

create or replace function total_sal (
    v_sal number,
    v_comm number
) return number
is
    v_tsal number;
begin
    v_tsal := (v_sal * 12 + nvl(v_comm, 0)) * 1.15;
    return (v_tsal);
end;
/

select empno, ename, hiredate, total_sal(sal, comm) from emp;