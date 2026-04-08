-- 1번
Create Table publisher (
    pcode NUMBER(3),
    pname VARCHAR2(20),
    address VARCHAR2(50),
    CONSTRAINT publisher_pocde_pk PRIMARY KEY (pcode)
);

-- 2번
Create Table publisher2 (
    pcode NUMBER(3) CONSTRAINT publisher_pocde_pk2 PRIMARY KEY,
    pname VARCHAR2(20),
    address VARCHAR2(50)
    
);

-- 4번
create table publisher4 (
    pcode number(3),
    pbame varchar2(20),
    address varchar2(50),
    PRIMARY KEY (pcode)
);

CREATE TABLE book (
    isbn CHAR(20),
    title VARCHAR(50),
    pcode NUMBER(3),
    
    CONSTRAINT book_isbn_pk PRIMARY KEY (isbn),
    CONSTRAINT book_pcode_fk FOREIGN KEY (pcode) REFERENCES publisher(pcode)
    ON DELETE SET NULL
);

SELECT * FROM user_indexes;
SELECT * FROM user_constraints;
select * from tab;

INSERT INTO publisher values (100, '한빛출판사', '부산');
INSERT INTO book values ('001', '데이터베이스', 100);
SELECT * FROM book;
SELECT * FROM publisher;

ALTER TABLE book ADD price NUMBER(10) default(0);
ALTER TABLE book ADD CONSTRAINT check_price check(price >= 0);
ALTER TABLE publisher DROP COLUMN address;

DROP TABLE publisher;

DROP TABLE publisher CASCADE CONSTRAINTS; -- 강제 삭제
DROP TABLE book;

drop table publisher2 purge; -- 쓰레기 통 안남고 전부 제거
drop table publisher4 purge;

purge RECYCLEBIN; -- 휴지통 비우기

alter table book drop constraint publisher_pocde_pk2; -- 제약 조건 제거
