----------------------
-- 绊按 包府, 林巩 包府, 碱俏 包府 --
----------------------


CREATE TABLE client(
    c_id               NUMBER(20),
    c_name          varchar2(100)     NOT NULL,
    c_phonenum   varchar2(100),
    c_address       varchar2(100),
 --   c_zcode          NUMBER(5),
  --  c_desc            VARCHAR2(200)
    PRIMARY key(c_id)
);

DROP TABLE client;

SELECT*FROM CLIENT;

CREATE TABLE shop(
    s_id               NUMBER(20),
    s_c_id            NUMBER(20)    NOT NULL,
    s_p_id            NUMBER(20)    NOT NULL,
    s_c_name      varchar2(100),
    s_p_name      varchar2(100),
    s_p_price       NUMBER(20)    NOT NULL,
    s_quantity      NUMBER(20)    NOT NULL,
    s_totalPrice    NUMBER(20)    NOT NULL,
--    s_desc           VARCHAR2(200)
    PRIMARY key(s_id),
    CONSTRAINT c_shop_fk1 FOREIGN KEY(s_c_id)
    REFERENCES client(c_id),
    CONSTRAINT c_shop_fk2 FOREIGN KEY(s_p_id)
    REFERENCES product(p_id)
    
);

DROP SEQUENCE seq_s_id;
CREATE SEQUENCE seq_s_id
INCREMENT BY 1;

DROP TABLE shop;

SELECT*FROM shop;

CREATE TABLE product(
    p_id                NUMBER(20),
    p_name           varchar2(100) NOT NULL,
    p_price            varchar2(100) NOT NULL,
    p_stock           varchar2(100) NOT NULL,
    PRIMARY key(p_id)
--    p_desc            VARCHAR2(200)
);

DROP TABLE product;

SELECT*FROM product;

SET SERVEROUTPUT ON;