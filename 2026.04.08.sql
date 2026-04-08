Create Table publisher (
    pcode NUMBER(3),
    pname VARCHAR(20),
    address VARCHAR(50),
    PRIMARY KEY (pcode)
);

CREATE TABLE book (
    isbn VARCHAR(20),
    title VARCHAR(50),
    pcode NUMBER(3),
    
    PRIMARY KEY (isbn),
    FOREIGN KEY (pcode) REFERENCES publisher(pcode)
    ON DELETE SET NULL
);

ALTER TABLE book ADD price NUMBER(10) default(0);
ALTER TABLE book ADD CONSTRAINT check_price check(price >= 0);
ALTER TABLE book DROP COLUMN address;

select * from tab;
-- DROP TABLE publisher;
