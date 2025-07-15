/*
    날짜 : 2025.07.15.
    이름 : 강민철
    내용 : 3장 SQL 고급
*/

-- 실습하기 3-1. 테이블 생성 및 데이터 입력
create table EMP (
    EMPNO number(4) not null primary key,
    NAME varchar2(10) not null,
    GENDER char(1) not null,
    JOB nvarchar2(10) not null,
    DEPNO number(2),
    REGDATE date not null
);
    
create table DEPT (
    DEPTNO number(2) not null primary key,
    DNAME varchar2(20) not null,
    DTEL varchar2(12) not null
);
    
create table SALE (
    NO number generated as identity primary key,
    EMPNO number(4) not null,
    YEAR number(4) not null,
    MONTH number(2) not null,
    PRICE number(10) 
);

INSERT INTO EMP VALUES (1001, '김유신', 'M', '사원', 10, SYSDATE);
INSERT INTO EMP VALUES (1002, '김춘추', 'M', '대리', 20, SYSDATE);
INSERT INTO EMP VALUES (1003, '장보고', 'M', '과장', 10, SYSDATE);
INSERT INTO EMP VALUES (1004, '강감찬', 'M', '부장', 30, SYSDATE);
INSERT INTO EMP VALUES (1005, '신사임당', 'F', '대리', 20, SYSDATE);
INSERT INTO EMP VALUES (1006, '이황', 'M', '사원', 40, SYSDATE);
INSERT INTO EMP VALUES (1007, '이이', 'M', '과장', 20, SYSDATE);
INSERT INTO EMP VALUES (1008, '이순신', 'M', '사원', NULL, SYSDATE);
INSERT INTO EMP VALUES (1009, '허난설헌', 'F', '사원', NULL, SYSDATE);
INSERT INTO EMP VALUES (1010, '정약용', 'M', '대리', 50, SYSDATE);

INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (10, '영업1부', '051-511-1000');
INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (20, '영업2부', '051-511-2000');
INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (30, '영업3부', '051-511-3000');
INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (40, '영업4부', '051-511-4000');
INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (50, '영업지원부', '051-511-5000');

INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1001, 2023, 1, 98100);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2023, 1, 136000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2023, 1, 80000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1004, 2023, 1, 78000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1005, 2023, 1, NULL);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1001, 2023, 2, 23500);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2023, 2, 126000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2023, 2, 18500);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1005, 2023, 2, 19000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1010, 2023, 2, 53000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1001, 2024, 1, 24000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2024, 1, 109000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2024, 1, 80000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1004, 2024, 1, NULL);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1007, 2024, 1, 24000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2024, 2, 160000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2024, 2, 101000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1004, 2024, 2, 43000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1005, 2024, 2, 24000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1006, 2024, 2, 109000);

-- 실습하기 2-1
select * from emp where name = '김유신';
select * from emp where job = '차장' and depno = 101;
select * from emp where job = '차장' or depno = 101;
select * from emp where name != '김춘추';
select * from emp where name <> '김춘추';
select * from emp where job = '사원' and depno = 10;
select * from emp where job = '사원' or job = '대리';
select * from emp where job in ('사원', '대리');
select * from emp where depno in (101, 102, 103);
select * from emp where name like '김%';
select * from emp where name like '%신';
select * from emp where name like '김__';
select * from emp where name like '이_';
select * from emp where name like '이__';
select * from emp where name like '_순%';
//select * from emp where hp like '010-1111%';
select * from emp where depno is null;
select * from emp where depno is not null;
select * from emp where empno >= 1005;
select * from dept where deptno = 10;
select * from dept where dname = '영업지원부';
select * from dept where dtel like '%30%';
select * from dept where deptno in (10, 30);
select * from dept where dname like '영업__';
select * from sale where price > 50000;
select * from sale where price >= 50000 and price < 100000 and month = 1;
select * from sale where price between 50000 and 100000;
select * from sale where year = 2024;
select * from sale where year = 2024 and month = 2;
select * from sale where month in (1, 2);

-- 실습하기 2-2
select * from sale order by price;
select * from sale order by price asc;
select * from sale order by price desc;
select * from emp order by name desc;
select * from emp order by regdate asc;

select * from sale where price > 50000 order by price desc;
select * from sale
    where price > 50000
    order by year desc, month, price desc;
    
select * from sale fetch first 3 row only;
select * from sale offset 0 rows fetch next 3 rows only;
select * from sale offset 1 rows fetch next 2 rows only;
select * from sale offset 5 rows fetch next 3 rows only;
select * from sale order by price desc offset 3 rows fetch next 5 rows only;
select * from sale
    where price < 50000
    order by price desc
    fetch first 3 rows only;

select * from sale
    where price > 50000
    order by year desc, month, price desc
    fetch first 5 rows only;
    
-- 실습하기 2-3
select distinct depno from emp;
select distinct job, depno from emp;

select empno as 사번, name as 이름, gender as 성별 from emp;
select empno E, name N, gender G from emp;