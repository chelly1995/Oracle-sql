create table book(
book_id number(5),
title varchar2(50),
author varchar2(10),
pub_date date
);

CREATE TABLE book(
    book_id     NUMBER(5),
    title           varchar2(50),
    author       varchar2(10),
    pub_date   date

);

SELECT *
FROM book;

ALTER TABLE book ADD (pubs VARCHAR2(50));
COMMIT;
ALTER TABLE book MODIFY (title VARCHAR2(100));
COMMIT;

ALTER TABLE book DROP (author);

RENAME book TO article;

SELECT*
FROM book;

SELECT*
FROM ARTICLE;

DROP TABLE article;

DROP TABLE author;

CREATE TABLE author(
    author_id               NUMBER(10),
    author_name          varchar2(100) NOT null,
    author_desc           varchar2(500),
    PRIMARY key(author_id)
);


SELECT*FROM AUTHOR a;

DROP TABLE book;
CREATE TABLE book(
    book_id     NUMBER(10),
    title           varchar2(100) NOT NULL,
    pubs         varchar2(100),
    pub_date   DATE,
    author_id number(10),
    PRIMARY key(book_id),
    CONSTRAINT c_book_fk FOREIGN KEY(author_id)
    REFERENCES author(author_id)

);

SELECT*FROM BOOK b;


INSERT INTO author
VALUES (1,'박경리','토지 작가');

SELECT * FROM author;

INSERT INTO author(author_id, author_name)
VALUES (2,'이문열');

UPDATE AUTHOR
SET AUTHOR_NAME = '기안84',
        AUTHOR_DESC = '웹툰작가'
WHERE author_id=1;

UPDATE AUTHOR
SET AUTHOR_NAME = '강풀',
        AUTHOR_DESC = '인기작가';

SELECT *
FROM AUTHOR a
WHERE a.AUTHOR_ID =1;

DELETE
FROM AUTHOR a
WHERE a.AUTHOR_ID =1;

DELETE FROM AUTHOR a;

DROP SEQUENCE seq_author_id;

CREATE SEQUENCE seq_author_id
INCREMENT BY 1
START WITH 1;

SELECT seq_author_id.nextval FROM dual;
SELECT seq_author_id.currval FROM dual;

INSERT INTO AUTHOR
values(seq_author_id.nextval,'박경리','토지 작가');

INSERT INTO AUTHOR
values(seq_author_id.nextval,'이문열','삼국지 작가');


INSERT INTO AUTHOR
values(seq_author_id.nextval,'이문열','경북 영양');

INSERT INTO AUTHOR
values(seq_author_id.nextval,'박경리','경상남도 통영');

INSERT INTO AUTHOR
values(seq_author_id.nextval,'유시민','17대 국회의원');

INSERT INTO AUTHOR
values(seq_author_id.nextval,'기안84','기안동에서 산 84년생');

INSERT INTO AUTHOR
values(seq_author_id.nextval,'강풀','온라인 만화가 1세대');

INSERT INTO AUTHOR
values(seq_author_id.nextval,'김영하','알쓸신잡');

UPDATE AUTHOR
SET AUTHOR_DESC = '서울특별시'
WHERE AUTHOR_ID=5;

SELECT *FROM AUTHOR a
WHERE a.AUTHOR_ID=4;

SELECT * FROM book;

DELETE FROM book;

DROP SEQUENCE seq_book_id;

CREATE SEQUENCE seq_book_id
INCREMENT BY 1
START WITH 1;

INSERT INTO book
VALUES (seq_book_id.nextval,'우리들의 일그러진 영웅','다림','1998-02-22',1);

INSERT INTO book
VALUES (seq_book_id.nextval,'삼국지','민음사','2002-03-01',1);

INSERT INTO book
VALUES (seq_book_id.nextval,'토지','마로니에북스','2012-08-15',2);

INSERT INTO book
VALUES (seq_book_id.nextval,'유시민의 글쓰기 특강','생각의길','2015-04-01',3);

INSERT INTO book
VALUES (seq_book_id.nextval,'패션왕','중앙북스(books)','2012-02-22',4);

INSERT INTO book
VALUES (seq_book_id.nextval,'순정만화','재미주의','2011-08-03',5);

INSERT INTO book
VALUES (seq_book_id.nextval,'오직두사람','문학동네','2017-05-04',6);

INSERT INTO book
VALUES (seq_book_id.nextval,'26년','재미주의','2012-02-04',5);

SELECT b.book_id, b.title, b.pubs, b.pub_date, b.author_id, author_name, author_desc
FROM author a, book b
WHERE a.author_id = b.author_id;


SELECT *
FROM SEOUL;


----------------------
-- 고객 관리, 주문 관리, 쇼핑 관리 --
----------------------


CREATE TABLE customer(
    c_id               NUMBER(20),
    c_name          varchar2(100)     NOT NULL,
    c_phonenum   varchar2(100),
    c_address       varchar2(100),
 --   c_zcode          NUMBER(5),
  --  c_desc            VARCHAR2(200)
    PRIMARY key(c_id)
);

DROP TABLE customer;

SELECT*FROM CUSTOMER;

CREATE TABLE shop(
    s_id               NUMBER(20),
--    s_c_id            varchar2(100),
--    s_p_id            NUMBER(20),
    s_c_name      varchar2(100),
    s_p_name      varchar2(100),
    s_p_price       varchar2(100),
    s_quantity      varchar2(100),
    s_totalPrice    varchar2(100),
--    s_desc           VARCHAR2(200)
    PRIMARY key(s_id)
);

DROP SEQUENCE seq_s_id;
CREATE SEQUENCE seq_s_id
INCREMENT BY 1;

DROP TABLE shop;

SELECT*FROM shop;

CREATE TABLE product(
    p_id                NUMBER(20),
    p_name           varchar2(100),
    p_price            varchar2(100),
    p_stock           varchar2(100),
    PRIMARY key(p_id)
--    p_desc            VARCHAR2(200)
);

DROP TABLE product;

SELECT*FROM product;

SET SERVEROUTPUT ON;

/*DECLARE
VNO varchar2(20);
BEGIN
    SELECT to_char(sysdate, 'YYYY/MM/DD')
    INTO VNO
    FROM DUAL;
    DBMS_OUTPUT.PUT_LINE(VNO);
END;
*/


DECLARE
v_empno employees.employee_id%TYPE;
v_name   employees.first_name%TYPE;
v_sal       employees.salary%TYPE;
BEGIN
SELECT employee_id, first_name, salary
INTO v_empno, v_name, v_sal
FROM employees
WHERE employee_id='&empno';
DBMS_OUTPUT.PUT_LINE(v_empno||'     '||v_name||'     '||v_sal);
END;