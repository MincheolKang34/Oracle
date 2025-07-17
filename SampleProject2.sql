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
select sysdate, next_day(sysdate,'월') from dual;

select sysdate, next_day('14/05/01', '월') from dual;

-- 교제 p97
select sysdate, last_day(sysdate), last_day('14/05/01')
from dual;

-- 교제 p98
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select sysdate, round(sysdate), trunc(sysdate)
from dual;

-- 교제 p100
select 2 + '2' from dual;

select 2 + 'A' from dual;

-- 교제 p103
select sysdate, to_char(sysdate, 'YYYY') "YYYY",
                to_char(sysdate, 'RRRR') "RRRR",
                to_char(sysdate, 'YY') "YY",
                to_char(sysdate, 'YEAR') "YEAR"
from dual;

select sysdate, to_char(sysdate, 'DD') "DD",
                to_char(sysdate, 'DAY') "DAY",
                to_char(sysdate, 'DDTH') "DDTH"
from dual;

select sysdate, to_char(sysdate, 'RRRR-MM-DD:HH24:MI:SS')
from dual;

-- 교제 p108
select to_number('5') from dual;
select to_number('A') from dual;
select ascii('A') from dual;

-- 교제 p110
select to_date('14/05/31') from dual;
select to_date('2014/05/31') from dual;

-- 교제 p111
select ename, comm, nvl(comm,0), nvl(comm,100)
from emp
where deptno = 30;

-- 교제 p112
select empno, ename, sal, comm,
        nvl2(comm, sal+comm, sal*0) "nvl2"
from emp
where deptno = 30;

-- 교제 p114
select deptno, name, decode(deptno, 101, 'Computer Engineering') "DNAME"
from professor;

select deptno, name, decode(deptno, 101, 'Computer Engineering', 'ETC') "DNAME"
from professor;

select deptno, name, decode(deptno, 101, 'Computer Engineering',
                                    102, 'Multimedia Engineering',
                                    103, 'Software Engineering',
                                         'ETC') "DNAME"
from professor;

select deptno, name, decode(deptno, 101, decode(name,'Audie Murphy','BEST!')) "DNAME"
from professor;

select deptno, name, decode(deptno, 101, decode(name,'Audie Murphy','BEST!','GOOD')) "DNAME"
from professor;

select deptno, name, decode(deptno, 101, decode(name,'Audie Murphy','BEST!','GOOD'),'N/A') "DNAME"
from professor;

-- 교제 p121
select name, tel,
        case(substr(tel,1,instr(tel,')')-1)) when '02' then 'SEOUL'
                                             when '031' then 'GYEONGGI'
                                             when '051' then 'BUSAN'
                                             when '052' then 'ULSAN'
                                             when '055' then 'GYEONGNAM'
                                                        else 'ETC'
        end "LOC"
from student
where deptno1 = 201;

select name, substr(jumin,3,2) "MONTH",
       case when substr(jumin,3,2) between '01' and '03' then '1/4'
            when substr(jumin,3,2) between '04' and '06' then '2/4'
            when substr(jumin,3,2) between '07' and '09' then '3/4'
            when substr(jumin,3,2) between '10' and '12' then '4/4'
       end "Quarter"
from student;