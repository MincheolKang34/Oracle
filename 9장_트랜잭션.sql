/*
    날짜 : 2025.08.12.
    이름 : 강민철
    내용 : 9장 트랜잭션 실습
*/

-- 실습 8-1
SELECT * FROM ACCOUNT;

UPDATE ACCOUNT SET
    acc_balance = acc_balance - 10000
    WHERE acc_no = '101-11-1001';
    
UPDATE ACCOUNT SET
    acc_balance = acc_balance + 10000
    WHERE acc_no = '101-11-1003';
    
SELECT * FROM ACCOUNT;

-- 작업확정
COMMIT;

-- 실습 8-2
UPDATE ACCOUNT SET
    acc_balance = acc_balance - 10000
    WHERE acc_no = '101-11-1001';
    
UPDATE ACCOUNT SET
    acc_balance = acc_balance + 10000
    WHERE acc_no = '101-11-1003';
    
SELECT * FROM ACCOUNT;

-- 작업취소
ROLLBACK;

-- 실습 8-3
SHOW AUTOCOMMIT;

SET AUTOCOMMIT ON;

SELECT * FROM ACCOUNT;
UPDATE ACCOUNT SET
    acc_balance = acc_balance - 10000
    WHERE acc_no = '101-11-1001';
    
UPDATE ACCOUNT SET
    acc_balance = acc_balance + 10000
    WHERE acc_no = '101-11-1003';