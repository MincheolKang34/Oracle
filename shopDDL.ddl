-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 10:26:52 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customer (
    custid VARCHAR2(10 BYTE) NOT NULL,
    name   VARCHAR2(10 BYTE) NOT NULL,
    hp     CHAR(13 BYTE),
    addr   VARCHAR2(100 BYTE),
    rdate  DATE NOT NULL
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( custid );

ALTER TABLE customer ADD CONSTRAINT customer__un UNIQUE ( hp );

CREATE TABLE "Order" (
    orderno      NUMBER NOT NULL,
    orderid      VARCHAR2(10 BYTE),
    orderproduct NUMBER,
    ordercount   NUMBER NOT NULL,
    orderdate    DATE NOT NULL
);

ALTER TABLE "Order" ADD CONSTRAINT order_pk PRIMARY KEY ( orderno );

CREATE TABLE product (
    prodno   NUMBER NOT NULL,
    prodname VARCHAR2(10) NOT NULL,
    stock    NUMBER DEFAULT 0 NOT NULL,
    price    NUMBER,
    company  VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prodno );

ALTER TABLE "Order"
    ADD CONSTRAINT order_customer_fk FOREIGN KEY ( orderid )
        REFERENCES customer ( custid );

ALTER TABLE "Order"
    ADD CONSTRAINT order_product_fk FOREIGN KEY ( orderproduct )
        REFERENCES product ( prodno );



INSERT ALL
    INTO CUSTOMER VALUES ('c101','김유신','010-1234-1001','경남 김해시','2023-01-01')
    INTO CUSTOMER VALUES ('c102','김춘추','010-1234-1002','경남 경주시','2023-01-02')
    INTO CUSTOMER VALUES ('c103','장보고','010-1234-1003','전남 완도군','2023-01-03')
    INTO CUSTOMER VALUES ('c104','강감찬','010-1234-1004','서울시 관악구','2023-01-04')
    INTO CUSTOMER VALUES ('c105','이순신','010-1234-1005','부산시 금정구','2023-01-05')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO PRODUCT VALUES (1,'새우깡',5000,1500,'농심')
    INTO PRODUCT VALUES (2,'CHOCOPIE',2500,2500,'오리온')
    INTO PRODUCT VALUES (3,'포카칩',3600,1700,'오리온')
    INTO PRODUCT VALUES (4,'양파링',1250,1800,'농심')
    INTO PRODUCT VALUES (5,'죠리퐁',2200,NULL,'크라운')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO "Order" VALUES (1,'c102',3,2,'2023-01-01 13:15:10')
    INTO "Order" VALUES (2,'c101',4,1,'2023-01-01 13:15:12')
    INTO "Order" VALUES (3,'c102',1,1,'2023-01-01 13:15:14')
    INTO "Order" VALUES (4,'c103',5,5,'2023-01-01 13:15:16')
    INTO "Order" VALUES (5,'c105',2,1,'2023-01-01 13:15:18')
SELECT 1 FROM DUAL;

-- 실습 6-3
SELECT orderno, name, prodname, ordercount, orderdate
FROM PRODUCT p
JOIN "Order" o ON p.prodno = o.orderproduct
JOIN CUSTOMER c ON o.orderid = c.custid;

SELECT orderno, prodno, prodname, price, ordercount, orderdate
FROM PRODUCT p
JOIN "Order" o ON p.prodno = o.orderproduct
JOIN CUSTOMER c ON o.orderid = c.custid
WHERE c.name='김유신';

SELECT SUM(price * ordercount) AS total_order_amount
FROM "Order" o
JOIN PRODUCT p ON o.orderproduct = p.prodno;