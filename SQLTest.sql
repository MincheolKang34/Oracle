-- 작업 1.ERD 작업 및 데이블 생성
CREATE TABLE account (
    acc_id            CHAR(14) NOT NULL,
    cust_jumin        CHAR(14),
    acc_type          VARCHAR2(20) NOT NULL,
    acc_balance       NUMBER NOT NULL,
    acc_card          CHAR(1) NOT NULL,
    acc_register_date DATE
);

ALTER TABLE account ADD CONSTRAINT account_pk PRIMARY KEY ( acc_id );

CREATE TABLE card (
    card_no            CHAR(14) NOT NULL,
    cust_jumin         CHAR(14),
    acc_id             CHAR(14),
    card_register_date DATE,
    card_limit         NUMBER,
    card_approve_date  DATE,
    card_type          VARCHAR2(10) NOT NULL
);

ALTER TABLE card ADD CONSTRAINT card_pk PRIMARY KEY ( card_no );

CREATE TABLE customer (
    cust_jumin CHAR(14) NOT NULL,
    name       VARCHAR2(20) NOT NULL,
    address    VARCHAR2(100) NOT NULL,
    birth      CHAR(10) NOT NULL,
    email      VARCHAR2(100),
    hp         VARCHAR2(20) NOT NULL,
    job        VARCHAR2(20)
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_jumin );

ALTER TABLE customer ADD CONSTRAINT customer__un UNIQUE ( email,
                                                          hp );

CREATE TABLE transaction (
    trans_id      NUMBER NOT NULL,
    acc_id        CHAR(14) NOT NULL,
    trans_type    VARCHAR2(20),
    trans_message VARCHAR2(20),
    trans_money   NUMBER,
    trans_date    DATE NOT NULL
);

ALTER TABLE transaction ADD CONSTRAINT transaction_pk PRIMARY KEY ( trans_id );

ALTER TABLE account
    ADD CONSTRAINT account_customer_fk FOREIGN KEY ( cust_jumin )
        REFERENCES customer ( cust_jumin );

ALTER TABLE card
    ADD CONSTRAINT card_account_fk FOREIGN KEY ( acc_id )
        REFERENCES account ( acc_id );

ALTER TABLE card
    ADD CONSTRAINT card_customer_fk FOREIGN KEY ( cust_jumin )
        REFERENCES customer ( cust_jumin );

ALTER TABLE transaction
    ADD CONSTRAINT transaction_account_fk FOREIGN KEY ( acc_id )
        REFERENCES account ( acc_id );

CREATE SEQUENCE transaction_trans_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER transaction_trans_id_trg BEFORE
    INSERT ON transaction
    FOR EACH ROW
    WHEN ( new.trans_id IS NULL )
BEGIN
    :new.trans_id := transaction_trans_id_seq.nextval;
END;
/

-- 작업 2. 데이터 입력
INSERT ALL
    INTO CUSTOMER VALUES ('760121-1234567','정우성','서울','1976-01-21',NULL,'010-1101-7601','배우')
    INTO CUSTOMER VALUES ('750611-1234567','이정재','서울','1975-06-11',NULL,'010-1102-7506','배우')
    INTO CUSTOMER VALUES ('890530-1234567','전지현','대전','1989-05-30','jjh@naver.com','010-1103-8905','자영업')
    INTO CUSTOMER VALUES ('790413-1234567','이나영','대전','1979-04-13','lee@naver.com','010-2101-7904','회사원')
    INTO CUSTOMER VALUES ('660912-1234567','원빈','대전','1966-09-12','one@daum.net','010-2104-6609','배우')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO ACCOUNT VALUES ('1011-1001-1001','760121-1234567','자유입출금',4160000,'Y','2020-01-21 13:00:02')
    INTO ACCOUNT VALUES ('1011-1001-1002','890530-1234567','자유입출금',376000,'Y','2020-06-11 13:00:02')
    INTO ACCOUNT VALUES ('1011-1001-1003','790413-1234567','자유입출금',1200000,'Y','2020-05-30 13:00:02')
    INTO ACCOUNT VALUES ('1011-2001-1004','660912-1234567','정기적금',1000000,'N','2020-04-13 13:00:02')
    INTO ACCOUNT VALUES ('1011-1002-1005','750611-1234567','자유입출금',820000,'Y','2020-09-12 13:00:02')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO CARD VALUES ('2111-1001-1001','760121-1234567','1011-1001-1001','2020-01-21',1000000,'2020-02-10','check')
    INTO CARD VALUES ('2041-1001-1002','890530-1234567','1011-1001-1002','2020-06-11',3000000,'2020-06-15','check')
    INTO CARD VALUES ('2011-1001-1003','790413-1234567','1011-1001-1003','2020-05-30',5000000,'2020-06-25','check')
    INTO CARD VALUES ('2611-1001-1005','750611-1234567','1011-1002-1005','2020-09-12',1500000,'2020-10-10','check')
SELECT 1 FROM DUAL;

INSERT INTO TRANSACTION (trans_acc_id,trans_type,trans_message,trans_money,trans_date) VALUES ('1011-1001-1001','입금','2월 정기급여',3500000,'2020-02-10 12:36:12');
INSERT INTO TRANSACTION (trans_acc_id,trans_type,trans_message,trans_money,trans_date) VALUES ('1011-1001-1003','출금','ATM 출금',300000,'2020-02-10 12:37:21');
INSERT INTO TRANSACTION (trans_acc_id,trans_type,trans_message,trans_money,trans_date) VALUES ('1011-1001-1002','입금','2월 급여',2800000,'2020-02-10 12:38:21');
INSERT INTO TRANSACTION (trans_acc_id,trans_type,trans_message,trans_money,trans_date) VALUES ('1011-1001-1001','출금','2월 공과금',116200,'2020-02-10 12:39:21');
INSERT INTO TRANSACTION (trans_acc_id,trans_type,trans_message,trans_money,trans_date) VALUES ('1011-1002-1005','출금','ATM 출금',50000,'2020-02-10 12:40:21');

-- 작업3. SQL 실행
-- 1) 모든 고객 정보를 조회하시오.
SELECT * FROM CUSTOMER;

-- 2) 모든 카드 정보를 조회하시오.
SELECT * FROM CARD;

-- 3) 모든 예금계좌 정보를 조회하시오.
SELECT * FROM ACCOUNT;

-- 4) 가장 최근 거래 내역 3건을 조회하시오.
SELECT * FROM TRANSACTION
ORDER BY trans_date DESC
FETCH FIRST 3 ROWS ONLY;

-- 5) 카드한도금액이 200만원 이상인 고객의 이름과 카드종류 조회하시오.
SELECT name AS 고객명, 
    card_type AS 카드종류
FROM CARD c
JOIN CUSTOMER cust ON c.cust_jumin = cust.cust_jumin
WHERE CARD_LIMIT >= 2000000;

-- 6) 예금계좌별 거래 건수 조회하시오.
SELECT a.acc_id AS 예금계좌, 
    count(trans_id) AS "거래 건수"
FROM TRANSACTION t
RIGHT JOIN ACCOUNT a ON t.acc_id = a.acc_id
GROUP BY a.acc_id;

-- 7) 거래금액이 100만원 이상인 거래 내역 조회하시오. (최근 거래순)
SELECT * FROM TRANSACTION
WHERE trans_money >= 1000000
ORDER BY trans_date DESC;

-- 8) 계좌와 연결된 카드 정보 조회(계좌ID, 카드ID, 카드종류) 하시오.
SELECT a.acc_id AS 계좌ID,
    NVL(card_no,'-') AS 카드ID,
    NVL(card_type,'-') AS 카드종류
FROM ACCOUNT a
LEFT JOIN CARD c ON a.acc_id = c.acc_id;

-- 9) 예금구분이 '입금'인 거래의 총합 조회하시오.
SELECT SUM(trans_money) AS "입금 거래 총합"
FROM TRANSACTION
WHERE trans_type = '입금';

-- 10) 예금잔고가 4,000,000원 이상 고객에 대한 고객명, 주민번호, 전화번호, 주소를 조회하시오.
SELECT name AS 고객명,
    a.cust_jumin AS 주민번호,
    hp AS 전화번호,
    address AS 주소
FROM CUSTOMER c
JOIN ACCOUNT a ON c.cust_jumin = a.cust_jumin
WHERE a.acc_balance >= 4000000;