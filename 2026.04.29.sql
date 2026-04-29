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

select d.deposit_num, c.name, d.balance 
from client c, deposit d 
WHERE c.ssn = d.ssn;

select d.deposit_num, c.name, d.balance 
from client c join deposit d on c.ssn = d.ssn;

select d.deposit_num, c.name, d.balance 
from client c join deposit d using(ssn);

select d.deposit_num, c.name, d.balance 
from client c natural join deposit d;

select d.deposit_num, d.branch_name, d.balance
from client c, deposit d
WHERE c.ssn = d.ssn and c.name = '김기식';

select d.deposit_num, d.branch_name, d.balance
from client c join deposit d on c.ssn = d.ssn
where c.name = '김기식';

select c.name, d.balance
from client c,  deposit d
where c.ssn = d.ssn and d.branch_name = '성남지점' and c.name Like '박%';

select c.name, d.balance
from client c join deposit d on c.ssn = d.ssn
where d.branch_name = '성남지점' and c.name Like '박%';

select d.deposit_num, d.balance, d.branch_name
from deposit d, branch b, client c
where d.ssn = c.ssn and d.branch_name = b.branch_name and c.name = b.branch_head;

select d.deposit_num, d.balance, d.branch_name
from (branch b join deposit d on b.branch_name = d.branch_name) 
        join client c on d.ssn = c.ssn
where c.name = b.branch_head;


select c.name, d.balance
from (branch b join deposit d on b.branch_name = d.branch_name) 
        join client c on d.ssn = c.ssn
where c.address = b.address;

select count(Distinct ssn)
from deposit
where branch_name = '성남지점';

select branch_name ,sum(balance)
from deposit
group by branch_name
order by sum(balance) desc;

select c.name, sum(d.balance)
from client c, deposit d
where c.ssn = d.ssn
group by c.name;

select c.name, sum(d.balance)
from client c join deposit d on c.ssn = d.ssn
group by c.name;


select branch_name, sum(balance)
from deposit
group by branch_name
having sum(balance) >= 2000000;

select branch_name, count(distinct ssn)
from deposit
where balance >= 1000000
group by branch_name;