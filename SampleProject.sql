-- 교제 p26
SELECT * FROM emp;

-- 교제 p27
select *
from emp;

select * fr
om emp;

select *
from em
p;

select em
pno from emp;

-- 교제 p29
select empno, ename
from emp ;

-- 교제 p30
set pagesize 15
set linesize 200
select empno, ename
from emp ;

-- 교제 p32
set pagesize 50
col name for a20
select name , 'good morning~~!' "Good Morning"
from professor ;

select dname , ',it''s deptno: ', deptno "DNAME AND DEPTNO"
from dept;
select dname, q'[, it's deptno : ]' ,deptno "DNAME AND DEPTNO"
from dept;

-- 교제 p34
select profno, name, pay
from pro+essor;
select profno "Prof's NO", name as "Prof's NAME", pay Prof_Pay
from professor;

-- 교제 p35
select deptno from emp;
select distinct deptno
from emp;

select job, ename
from emp
order by 1, 2;
select distinct job, ename
from emp
order by 1, 2;
select job, distinct ename
from emp
order by 1, 2;

-- 교제 p37
select ename, job from emp;
select ename || job from emp;
select ename||'-'||job from emp;
select ename||' ''s job is '|| job "NAME AND JOB"
from emp;

-- 교제 p41
select empno, ename
from emp
where empno=7900;
select ename, sal
from emp
where sal < 900;
select empno, enam, sal
from emp
where ename=SMITH;
select empno, ename, sal
from emp
where ename='SMITH';
select empno, ename, sal
from emp
where ename='smith';
select ename, hiredate
from emp
where ename = 'SMITH';
select ename, hiredate
from emp
where ename = 'SMITH';
select empno, ename, sal
from emp
where hiredate = '80/12/17';
select empno, ename, sal
from emp
where hiredate = 80/12/17;
select ename, hiredate
from emp
where hiredate = '17-DEC-80';
select ename, hiredate
from emp
where hiredate = '17-dec-80';

-- 교제 p44
select ename, sal
from emp
where deptno = 10;
select ename, sal, sal+100
from emp
whre deptno = 10;

-- 교제 p45
select empno, ename, sal
from emp
where sal >= 4000;
select empno, ename, sal
from emp
where ename >= 'W';
select ename, hiredate
from emp;
select ename, hiredate
from emp
where hiredate >= '81/12/25';
select ename, hiredate
from emp;
select empno, ename, sal
from emp
where sal between 2000 and 3000;
select empno, ename, sal
from emp
where sal >= 2000
and sal <= 3000;
select ename from emp
order by ename;
select ename from emp
where ename between 'JAMES' and 'MARTIN'
order by ename;
select empno, ename, deptno
from emp
where deptno in (10,20);
select empno, ename, sal
from emp
where sal like '1%';
select empno, ename, sal
from emp
where ename like 'A%';
select empno, ename, hiredate
from emp
where hiredate like '80%';
select empno, ename, hiredate 
from emp 
where hiredate like 80%;
select empno, ename, hiredate
from emp
where hiredate like '___DEC%';
select empno, ename, hiredate
from emp
where hiredate like '___12%';

-- 교제 p52
select empno, ename, comm
from emp
where deptno in (20,30);

select empno, ename, comm
from emp
where comm = NULL;
select empno, ename, comm
from emp
where comm is null;
select empno, ename, comm
from emp
where comm is not null;
select ename, hiredate, sal
from emp
where hiredate > '82/01/01'
and sal >= 1300;
select ename, hiredate, sal
from emp
where hiredate > '82/01/01'
or sal >= 1300;
select empno, ename, sal, comm
from emp
where sal > 1000
and (comm < 1000 or comm is null);
select empno, ename, sal, comm
from emp
where sal > 1000
and comm < 1000 or comm is null;
select empno, ename, sal
from emp
where empno = &empno;
set verify off
select empno, ename, sal
from emp
where empno = &empno;
select empno, ename
from &table
where sal = 3000;

-- 교제 p57
select ename, sal, hiredate
from emp;
select ename, sal, hiredate
from emp
order by ename;
select deptno, sal, ename
from emp
order by deptno asc, sal desc;
select ename, sal, hiredate
from emp
where sal > 1000
order by 2, 1;

-- 교제 p60
select studno, name, deptno1, 1
from student
where deptno1 = 101
union all
select profno, name, deptno, 2
from professor
where deptno = 101;
select studno, name, deptno1, 1
from student
where deptno1 = 101
union
select profno, name, deptno, 2
from professor
where deptno = 101;
select studno, name
from student
union
select studno, name
from student
where deptno2 = 201;
select studno, name
from student
union all
select studno, name
from student
where deptno2 = 201;

-- 교제 p63
select studno, name
from student
where deptno1 = 101
intersect
select studno, name
from student
where deptno2 = 201;
select empno, ename, sal
from emp
minus
select empno, ename, sal
from emp
where sal > 2500;
select studno, name
from student
union
select profno
from professor;
select studno, name
from student
union
select name, profno
from professor;