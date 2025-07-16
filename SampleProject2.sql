-- 2장 단일행 함수
-- 교제 p71
select ename, initcap(ename) "INITCAP"
from emp
where deptno = 10;

select name, initcap(name) "INITCAP"
from professor
where deptno = 101;

-- 교제 p72
select ename, lower(ename) "LOWER", upper(ename) "UPPER"
from emp
where deptno = 10;

-- 교제 p73
select ename, length(ename) "LENGTH", lengthb(ename) "LENGTH"
from emp
where deptno = 20;

select '서진수' "NAME", length('서진수') "LENGTH",
                        lengthb('서진수') "LENGTHB"
from dual;

set verify off
select ename, length(ename)
from emp
where length(ename) > length('&ename');

-- 교제 p74
select concat(ename, job)
from emp
where deptno=10;

-- 교제 p75
col "3,2" for a6
col "-3,2" for a6
col "-3,4" for a6

select substr('abcde',3,2) "3,2",
        substr('abcde',-3,2) "-3,2",
        substr('abcde',3,4) "3,4"
from dual;

-- 교제 p76
select '서진수' "NAME", substr('서진수',1,2) "SUBSTR",
                        substrb('서진수',1,3) "SUBSTRB"
from dual;

-- 교제 p77
select 'A-B-C-D', instr('A-B-C-D','-',1,3) "INSTR"
from dual;

select 'A-B-C-D', instr('A-B-C-D','-',3,1) "INSTR"
from dual;

select 'A-B-C-D', instr('A-B-C-D','-',-1,3) "INSTR"
from dual;

select 'A-B-C-D', instr('A-B-C-D','-',-6,2) "INSTR"
from dual;

-- 교제 p82
select ename from emp
where deptno = 10;

select ltrim(ename,'C')
from emp
where deptno = 10;

-- 교제 p83
select ename, rtrim(ename,'R') "RTRIM"
from emp
where deptno = 10;

-- 교제 p84
select ename, replace(ename,substr(ename,1,2),'**') "REPLACE"
from emp
where deptno = 10;

-- 교제 p86
select round(987.654,2) "ROUND1",
        round(987.654,0) "ROUND2",
        round(987.654,-1) "ROUND3"
from dual;

-- 교제 p87
select trunc(987.654,2) "TRUNC1",
        trunc(987.654,0) "TRUNC2",
        trunc(987.654,-1) "TRUNC3"
from dual;

select mod(121,10) "MOD",
        ceil(123.45) "CEIL",
        floor(123.45) "FLOOR"
from dual;

select rownum "ROWNO", ceil(rownum/3) "TEAMNO", ename
from emp;

-- 교제 p88
select power(2,3) from dual;

-- 교제 p90
select sysdate from dual;

alter session set NLS_DATE_FORMAT='RRRR-MON-DD';
alter session set NLS_DATE_LANGUAGE='ENGLISH';
select sysdate from dual;

-- 교제 p91
select months_between('14/09/30','14/08/31')
from dual;

select months_between('14/08/31','14/09/30')
from dual;

select months_between('12/02/29','12/02/01')
from dual;

select months_between('12/04/30','12/04/01')
from dual;

select months_between('12/05/31','12/05/01')
from dual;

select months_between('12/02/29','12/02/01')
from dual;

select months_between('12/04/30','12/04/01')
from dual;

select months_between('12/03/01','12/02/28')
from dual;

select months_between('14/03/01','14/02/28')
from dual;

select sysdate, months_between('15/05/31','15/04/30')
from dual;

select ename, hiredate,
        round(months_between(to_date('04/05/31'),hiredate),1) "DATE1",
        round(((to_date('04/05/31') - hiredate)/31),1) "DATE2"
from emp
where deptno = 10;

-- 교제 p96
select sysdate, next_day(sysdate,'MON') from dual;