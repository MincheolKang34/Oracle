-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 11:28:58 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE bank_account (
    a_no        CHAR(11 BYTE) NOT NULL,
    a_item_dist CHAR(2 BYTE) NOT NULL,
    a_item_name VARCHAR2(20 BYTE) NOT NULL,
    a_c_no      VARCHAR2(14 BYTE),
    a_balance   NUMBER DEFAULT 0 NOT NULL,
    a_open_date DATE NOT NULL
);

ALTER TABLE bank_account ADD CONSTRAINT bank_account_pk PRIMARY KEY ( a_no );

CREATE TABLE bank_customer (
    c_no    VARCHAR2(14 BYTE) NOT NULL,
    c_name  VARCHAR2(20) NOT NULL,
    c_dist  NUMBER DEFAULT 0 NOT NULL,
    c_phone CHAR(13 BYTE) NOT NULL,
    c_addr  VARCHAR2(50 BYTE)
);

ALTER TABLE bank_customer ADD CONSTRAINT bankerd_pk PRIMARY KEY ( c_no );

CREATE TABLE bank_transaction (
    t_no       NUMBER NOT NULL,
    t_a_no     CHAR(11 BYTE) NOT NULL,
    t_dist     NUMBER NOT NULL,
    t_amount   NUMBER DEFAULT 0 NOT NULL,
    t_datetime DATE NOT NULL
);

ALTER TABLE bank_transaction ADD CONSTRAINT bank_transaction_pk PRIMARY KEY ( t_no );

ALTER TABLE bank_account
    ADD CONSTRAINT bank_account_bank_customer_fk FOREIGN KEY ( a_c_no )
        REFERENCES bank_customer ( c_no );

ALTER TABLE bank_transaction
    ADD CONSTRAINT bank_transaction_bank_account_fk FOREIGN KEY ( t_a_no )
        REFERENCES bank_account ( a_no );

CREATE SEQUENCE bank_transaction_t_no_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER bank_transaction_t_no_trg BEFORE
    INSERT ON bank_transaction
    FOR EACH ROW
    WHEN ( new.t_no IS NULL )
BEGIN
    :new.t_no := bank_transaction_t_no_seq.nextval;
END;
/



-- 실습 6-5
INSERT ALL
    INTO bank_customer VALUES ('730423-1000001','김유신',1,'010-1234-1001','경남 김해시')
    INTO bank_customer VALUES ('730423-1000002','김춘추',1,'010-1234-1002','경남 경주시')
    INTO bank_customer VALUES ('730423-1000003','장보고',1,'010-1234-1003','전남 완도군')
    INTO bank_customer VALUES ('102-12-51094','(주)정보산업',2,'051-500-1004','부산시 부산진구')
    INTO bank_customer VALUES ('930423-1000005','이순신',1,'010-1234-1005','서울 종로구')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO bank_account VALUES ('101-11-1001','S1','자유저축예금','730423-1000001',1550000,'2011-04-11')
    INTO bank_account VALUES ('101-11-1002','S1','자유저축예금','930423-1000005',260000,'2011-05-12')
    INTO bank_account VALUES ('101-11-1003','S1','자유저축예금','730423-1000003',75000,'2011-06-13')
    INTO bank_account VALUES ('101-12-1001','S2','기업전용예금','102-12-51094',15000000,'2011-07-14')
    INTO bank_account VALUES ('101-13-1001','S3','정기저축예금','730423-1000002',1200000,'2011-08-15')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO bank_transaction VALUES (1,'101-11-1001',1,50000,'2023-01-01 13:15:10')
    INTO bank_transaction VALUES (2,'101-12-1001',2,1000000,'2023-01-02 13:15:12')
    INTO bank_transaction VALUES (3,'101-11-1002',3,260000,'2023-01-03 13:15:14')
    INTO bank_transaction VALUES (4,'101-11-1002',2,100000,'2023-01-04 13:15:16')
    INTO bank_transaction VALUES (5,'101-11-1003',3,75000,'2023-01-05 13:15:18')
    INTO bank_transaction VALUES (6,'101-11-1001',1,150000,'2023-01-05 13:15:28')
SELECT 1 FROM DUAL;

-- 실습 6-6
SELECT c_no AS 고객번호, 
    c_name AS 이름, 
    c_phone AS 연락처, 
    a_no AS 계좌번호, 
    a_item_name AS 계좌상품명, 
    a_balance AS 현재잔액
FROM bank_customer c
JOIN bank_account a ON c.c_no = a.a_c_no;

SELECT t_dist AS 거래구분,
    t_amount AS 거래금액,
    t_datetime AS 거래날짜
FROM bank_transaction t
JOIN bank_account a ON t.t_a_no = a.a_no
JOIN bank_customer c ON a.a_c_no = c.c_no
WHERE c_name='이순신';

SELECT c_no AS 주민번호,
    c_name AS 고객명,
    a_no AS 계좌번호,
    a_balance AS 현재잔액,
    a_open_date AS 계좌개설일
FROM bank_customer c
JOIN bank_account a ON c.c_no = a.a_c_no
WHERE c_dist=1
ORDER BY a_balance DESC
FETCH FIRST 1 ROWS ONLY;