/*
    날짜 : 2025.07.15.
    이름 : 강민철
    내용 : 4장 SQL 고급
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

-- 실습하기 3-1. 다양한 SQL 숫자 함수 실습
select sum(price) as 합계 from sale;
select avg(price) as 평균 from sale;
select max(price) as "최대값" from sale;
select min(price) as "최소값" from sale;
select count(*) as 직원수 from emp;
select count(empno) as 직원수 from emp;
select count(*) as "정직원 수" from emp;
select count(depno) as 부서수 from emp;

select ceil(1.2) from dual; // 올림
select ceil(1.8) from dual;
select floor(1.2) from dual; // 내림
select floor(1.8) from dual;
select round(1.2) from dual; // 반올림
select round(1.8) from dual;

select DBMS_RANDOM.value from dual;
select ceil(dbms_random.value * 10) from dual;

-- 실습하기 3-2. 다양한 SQL 문자 함수 실습
// LENGTH : 문자길이
select 'Hello ORACLE!', length('Hello Oracle') from dual;
// SUBSTR : 문자 자르기
select
    'HELLO ORACLE!',
    substr('HELLO ORACLE!', 1, 3),
    substr('HELLO ORACLE!', 3, 2),
    substr('HELLO ORACLE!', 5) // 5번째부터 마지막까지
from
    dual;
    
// INSTR : 문자 위치
select
    instr('HELLO ORACLE!', 'L') as instr_1,
    instr('HELLO ORACLE!', 'L', -1) as instr_2
from dual;

// REPLACE : 문자 교체
select '010-1234-5678', replace('010-1234-5678', '-', '') from dual;
// LPAD, RPAD : 문자 채우기
select lpad('Oracle', 10, '#') as lpad, rpad('Oracle', 10, '*') as rpad from dual;

// CONCAT : 문자 연결
select concat(empno, name) from emp where name = '이순신';
select empno || name from emp where name = '정약용';
// TRIM : 문자 공백 제거
select 
    '[ _Oracle_ ]' as before,
    '[' || trim(' _Oracle_ ') || ']' as trim
from
    dual;
    
-- 실습하기 3-3. SQL 날짜 함수 실습
// SYSDATE : 현재 날짜와 시간 조회
select
    sysdate,
    sysdate - 1,
    sysdate + 1
from
    dual;
    
// ADD_MONTHS(d, n) : 몇 개월 이후 날짜 조회
select
    add_months(sysdate, 1),
    add_months(sysdate, -1)
from dual;

// MONTHS_BETWEEN(d1, d2) : 두 날짜 간 개월 수 계산
select
    months_between(date '2025-07-13', date '2024-07-13') as 개월차
from dual;

// NEXT_DAY(d, '요일') : d 이후의 특정 요일 날짜
select
    next_day(sysdate, '월요일') as 다음_월요일
from dual;

--  실습하기 3-4

select
    to_char(sysdate, 'YYYY') as YYYY,
    to_char(sysdate, 'MM') as MM,
    to_char(sysdate, 'DD') as DD,
    to_char(sysdate, 'HH24') as HH24,
    to_char(sysdate, 'MI') as MI,
    to_char(sysdate, 'SS') as SS,
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') as 날짜시간
from dual;

insert into emp values (1011, '안중근', 'M', '부장', 30, to_char(sysdate, 'YYYY/MM/DD'));

select
    to_date('20250714', 'YYYY/MM/DD')as 날짜1,
    to_date('250714', 'YY-MM-DD')as 날짜2,
    to_date(sysdate, 'YYYY/MM/DD HH24:MI:SS')as 날짜3
from dual;

insert into emp values (1014, '유관순', 'F', '차장', 20, sysdate);
// sysdate를 to_date 함수로 형식에 맞게 변환 후 넣어주는 게 더 좋음.
insert into emp values (1013, '윤봉길', 'M', '과장', 30,
                    to_date(sysdate, 'YYYY-MM-DD HH24:MI:SS'));
                    
// NVL, NVL2 : NULL 체크 함수
select
    no,
    empno,
    year,
    month,
    nvl(price, 0)
from sale;
select
    empno,
    name,
    gender,
    job,
    nvl2(depno, '정규직', '비정규직')
from emp; // nvl1([속성명], [속성이 null이 아닐 경우 값], [속성이 null일 경우 값])

-- 실습 4-1
select empno from sale group by empno;
select year from sale group by year;
select empno, year from sale group by empno, year;

select empno, count(*) as 판매건수 from sale group by empno;
select empno, sum(price) as 합계 from sale group by empno;
select empno, avg(price) as 평균 from sale group by empno;

select empno, year, sum(price) as 합계
    from sale
    group by empno, year;
    
select empno, year, sum(price) as 합계
    from sale
    group by empno, year
    order by year asc, 합계 desc;
    
select empno, year, sum(price) as 합계
    from sale
    where price >= 50000
    group by empno, year
    order by 합계 desc;
// 오라클 23c 버전(23.3.X.X.X)부터 별칭(아래에서는 '합계')을 having절에 사용 가능
select empno, year, sum(price) as 합계
    from sale
    where price >= 50000
    group by empno, year
    having sum(price) >= 200000
    order by 합계 desc;
    
-- 실습하기 5-1
// union은 중복 제거, union all은 중복을 제거하지 않음
select empno, month, price from sale where year=2023
union
select empno, month, price from sale where year=2024;

select empno, month, price from sale where year=2023
union all
select empno, month, price from sale where year=2024;

select empno, year, sum(price) as 합계
from sale
where year = 2023
group by empno, year
union
select empno, year, sum(price) as 합계
from sale
where year = 2024
group by empno, year
order by year asc, 합계 desc;

-- 실습하기 5-2 : 교집합
select empno from sale where year = 2023
intersect
select empno from sale where year = 2024;

-- 실습하기 5-3 : 차집합
select empno from sale where year = 2023
minus
select empno from sale where year = 2024;

-- 실습 6-1
select
    *
from emp E
join dept D
on E.depno = D.deptno;

select
    *
    from emp E
    join dept D
    using (deptno); -- 조인하려는 두 테이블에 동일한 컬럼명
    
select * from emp E, dept D where E.depno = D.deptno; -- where절로도 join 가능

select
    s.no,
    s.empno,
    e.name,
    e.job,
    e.regdate,
    e.depno,
    d.dname
from sale s
join emp e on s.empno = e.empno
join dept d on e.depno = d.deptno
where price > 100000 and year = 2024
order by s.price desc;

-- 실습 6-2
select
    *
from sale s
left join emp e on s.empno = e.empno;

select
    *
from sale s
right join emp e on s.empno = e.empno;