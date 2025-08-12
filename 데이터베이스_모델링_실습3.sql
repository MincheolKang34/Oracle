/*
    날짜 : 2025.08.12.
    이름 : 강민철
    날짜 : 데이터베이스 모델링 실습3
*/
-- 사용자 추가
alter session set "_oracle_script"=true;
create user hospital identified by 1234;
grant connect, resource, unlimited tablespace to hospital;

-- 데이터 입력
insert all
    into department values ('101','소아과','김유신','051-123-0101')
    into department values ('102','내과','김춘추','051-123-0102')
    into department values ('103','외과','장보고','051-123-0103')
    into department values ('104','피부과','선덕여왕','051-123-0104')
    into department values ('105','이비인후과','강감찬','051-123-0105')
    into department values ('106','산부인과','신사임당','051-123-0106')
    into department values ('107','흉부외과','류성룡','051-123-0107')
    into department values ('108','정형외과','송상현','051-123-0108')
    into department values ('109','신경외과','이순신','051-123-0109')
    into department values ('110','비뇨기과','정약용','051-123-0110')
    into department values ('111','안과','박지원','051-123-0111')
    into department values ('112','치과','전봉준','051-123-0112')
select 1 from dual;

insert all
    into doctor values ('D101101','김유신','1976-01-21','M','101','과장','010-1101-1976','kimys@bw.com')
    into doctor values ('D101102','계백','1975-06-11','M','101','전문의','010-1102-1975','gaeback@bw.com')
    into doctor values ('D101103','김관창','1989-05-30','M','101','전문의','010-1103-1989','kwanch@bw.com')
    into doctor values ('D102101','김춘추','1979-04-13','M','102','과장','010-2101-1979','kimcc@bw.com')
    into doctor values ('D102104','이사부','1966-09-12','M','102','전문의','010-2104-1966','leesabu@bw.com')
    into doctor values ('D103101','장보고','1979-07-28','M','103','과장','010-3101-1979','jangbg@bw.com')
    into doctor values ('D104101','선덕여왕','1984-06-15','F','104','과장','010-4101-1984','gueen@bw.com')
    into doctor values ('D105101','강감찬','1965-10-21','M','105','과장','010-5101-1965','kang@bw.com')
    into doctor values ('D106101','신사임당','1972-11-28','F','106','과장','010-6101-1972','sinsa@bw.com')
    into doctor values ('D107103','이이','1992-09-07','M','107','전문의','010-7103-1992','leelee@bw.com')
    into doctor values ('D107104','이황','1989-12-09','M','107','전문의','010-7104-1989','hwang@bw.com')
    into doctor values ('D108101','송상현','1977-03-14','M','108','과장','010-8101-1977','ssh@bw.com')
select 1 from dual;

insert all
    into nurse values ('N101101','송승헌','1976-02-21','M','101','수간호사','010-1101-7602','ssh@bw.com')
    into nurse values ('N102101','이영애','1975-07-11','F','102','수간호사','010-1102-7507','yung@bw.com')
    into nurse values ('N102102','엄정화','1989-06-30','F','102','주임','010-1103-8906','um@bw.com')
    into nurse values ('N102103','박명수','1979-05-13','M','102','주임','010-2101-7905','park@bw.com')
    into nurse values ('N103101','정준하','1966-10-12','M','103','주임','010-2104-6610','jung@bw.com')
    into nurse values ('N104101','김태희','1979-08-28','F','104','주임','010-3101-7908','taeh@bw.com')
    into nurse values ('N105101','송혜교','1984-07-15','F','105','주임','010-4101-8407','song@bw.com')
    into nurse values ('N106101','공유','1965-11-21','M','106','간호사','010-5101-6511','gong@bw.com')
    into nurse values ('N107101','이병헌','1972-12-28','M','107','간호사','010-6101-7212','byung@bw.com')
    into nurse values ('N108101','송중기','1992-10-07','M','108','간호사','010-7103-9210','jungi@bw.com')
select 1 from dual;

insert all
    into patient values ('P102101','D102101','N102101','정우성','760121-1234567','M','서울','010-1101-7601',null,'배우')
    into patient values ('P103101','D103101','N103101','이정재','750611-1234567','M','서울','010-1102-7506',null,'배우')
    into patient values ('P102102','D102104','N102103','전지현','890530-1234567','F','대전','010-1103-8905','jjh@naver.com','자영업')
    into patient values ('P104101','D104101','N104101','이나영','790413-1234567','F','대전','010-2101-7904','lee@naver.com','회사원')
    into patient values ('P105101','D105101','N105101','원빈','660912-1234567','M','대전','010-2104-6609','one@daum.net','배우')
    into patient values ('P103102','D103101','N103101','장동건','790728-1234567','M','대구','010-3101-7907','jang@naver.com','배우')
    into patient values ('P104102','D104101','N104101','고소영','840615-1234567','F','대구','010-4101-8406','goso@daum.net','회사원')
    into patient values ('P108101','D108101','N108101','김연아','651021-1234567','F','대구','010-5101-6510','yuna@daum.net','운동선수')
    into patient values ('P102103','D102104','N102102','유재석','721128-1234567','M','부산','010-6101-7211',null,'개그맨')
    into patient values ('P107101','D107104','N107101','강호동','920907-1234567','M','부산','010-7103-9209',null,'개그맨')
    into patient values ('P105102','D105101','N105101','조인성','891209-1234567','M','광주','010-7104-8912','join@gmail.com','배우')
    into patient values ('P104103','D104101','N104101','강동원','770314-1234567','M','광주','010-8101-7703','dong@naver.com','배우')
select 1 from dual;

insert all
    into treatment values (1021001,'D102101','P102101','감기, 몸살',sysdate)
    into treatment values (1031002,'D103101','P103101','교통사고 외상',sysdate)
    into treatment values (1021003,'D102104','P102102','위염, 장염',sysdate)
    into treatment values (1041004,'D104101','P104101','피부 트러블',sysdate)
    into treatment values (1051005,'D105101','P105101','코막힘 및 비염',sysdate)
    into treatment values (1031006,'D103101','P103102','목 디스크',sysdate)
    into treatment values (1041007,'D104101','P104102','여드름',sysdate)
    into treatment values (1081008,'D108101','P108101','오른쪽 발목 뼈 골절',sysdate)
    into treatment values (1021009,'D102104','P102103','소화불량',sysdate)
    into treatment values (1071010,'D107104','P107101','가슴 통증',sysdate)
    into treatment values (1051011,'D105101','P105102','귀 이명',sysdate)
    into treatment values (1041012,'D104101','P104103','팔목 화상',sysdate)
select 1 from dual;

insert all
    into chart values ('C1021001',1021001,'D102101','P102101','감기 주사 및 약 처방')
    into chart values ('C1031002',1031002,'D103101','P103101','입원치료')
    into chart values ('C1021003',1021003,'D102104','P102102','위내시경')
    into chart values ('C1041004',1041004,'D104101','P104101','피부 감염 방지 주사')
    into chart values ('C1051005',1051005,'D105101','P105101','비염 치료')
    into chart values ('C1031006',1031006,'D103101','P103102','목 견인치료')
    into chart values ('C1041007',1041007,'D104101','P104102','여드름 치료약 처방')
    into chart values ('C1081008',1081008,'D108101','P108101','발목 깁스')
    into chart values ('C1021009',1021009,'D102104','P102103','주사 처방')
    into chart values ('C1071010',1071010,'D107104','P107101','MRI 검사')
    into chart values ('C1051011',1051011,'D105101','P105102','귀 청소 및 약 처방')
    into chart values ('C1041012',1041012,'D104101','P104103','화상 크림약 처방')
select 1 from dual;

-- 5.SQL
-- 문제 1. 모든 의사의 의사ID, 이름 , 생년월일, 전공의과 번호, 전공의과 이름을 조회하시오.
select doc_id as 의사ID,
    doc_name as 이름,
    doc_birth as 생년월일,
    d.dep_no as "전공의과 번호",
    dep_name as "전공의과 이름"
from doctor d
join department dp on d.dep_no=dp.dep_no;

-- 문제 2. 모든 간호사의 간호사ID, 이름, 생년월일, 전공의과 번호, 전공의과 이름을 조회하시오.
select nur_id as 간호사ID,
    nur_name as 이름,
    nur_birth as 생년월일,
    n.dep_no as "전공의과 번호",
    dep_name as "전공의과 이름"
from nurse n
join department d on n.dep_no=d.dep_no;

-- 문제 3.모든 환자의 환자ID, 이름, 주민번호, 휴대폰, 담당의사 이름, 담당 간호사 이름을 조회하시오.
select pat_id as 환자ID,
    pat_name as 이름,
    pat_jumin as 주민번호,
    pat_phone as 휴대폰,
    doc_name as "담당의사 이름",
    nur_name as "담당 간호사 이름"
from patient p
join doctor d on p.doc_id=d.doc_id
join nurse n on p.nur_id=n.nur_id;

-- 문제 4. 모든 진료내역에서 환자 이름, 담당의사 이름, 진료내용, 처방내용, 진료날짜를 조회하시오.
select pat_name as 환자이름,
    doc_name as "담당의사 이름",
    treat_desc as 진료내용,
    chart_desc as 처방내용,
    treat_datetime as 진료날짜
from treatment t
join patient p on t.pat_id=p.pat_id
join doctor d on t.doc_id=d.doc_id
join chart c on t.treat_no=c.treat_no;

-- 문제 5. 모든 진료내역에서 '외과'에서 진료한 내역 가운데 진료번호, 환자이름, 담당의사명, 진료내용, 처방내용, 진료날짜를 조회하시오.
select t.treat_no as 진료번호,
    pat_name as 환자이름,
    doc_name as 담당의사명,
    treat_desc as 진료내용,
    chart_desc as 처방내용,
    treat_datetime as 진료날짜
from treatment t
join patient p on t.pat_id=p.pat_id
join doctor d on t.doc_id=d.doc_id
join chart c on t.treat_no=c.treat_no
join department dp on d.dep_no=dp.dep_no
where dep_name='외과';

-- 문제 6. 모든 진료내역에서 '화상'으로 진료한 내역 가운데 진료번호, 환자이름, 담당의사명, 진료내용, 처방내용, 진료날짜를 조회하시오.
select t.treat_no as 진료번호,
    pat_name as 환자이름,
    doc_name as 담당의사명,
    treat_desc as 진료내용,
    chart_desc as 처방내용,
    treat_datetime as 진료날짜
from treatment t
join patient p on t.pat_id=p.pat_id
join doctor d on t.doc_id=d.doc_id
join chart c on t.treat_no=c.treat_no
where treat_desc like '%화상%';

-- 문제 7. 현재 날짜를 기준으로 30세 이상 ~ 40세 미만 환자를 조회하시오.
select * from patient
where 
    case
        when substr(pat_jumin,8,1) in (3,4)
            then to_char(sysdate, 'YY')-substr(pat_jumin,0,2)
        else to_char(sysdate, 'YY')-substr(pat_jumin,0,2)+100
    end    
between 30 and 40;

-- 문제 8. 모든 전공부서에서 아직 의사ID가 부여되지 않은 의사의 이름과 부서명을 조회하시오.
select dep_manager, dep_name
from doctor d
right join department dp on d.dep_no=dp.dep_no
where doc_id is null;

-- 문제 9. 김태희 간호사가 맡고 있는 모든 환자의 이름을 구분자 ^으로 해서 '강동원^고소영^이나영'과 같이 조회하시오.
select listagg(pat_name, '^') within group (order by pat_name)
from patient p
join nurse n on p.nur_id=n.nur_id
where nur_name='김태희';

-- 문제 10. 가장 많은 환자 수를 담당하는 간호사ID, 간호사 이름, 담당환자수를 조회 하시오.
select n.nur_id,
    nur_name,
    count(pat_name)
from nurse n
join patient p on n.nur_id=p.nur_id
group by n.nur_id, nur_name
order by count(pat_name) desc
fetch first 1 rows only;

SELECT * FROM (
SELECT 
	a.nur_id,
	nur_name,
	COUNT(*) AS 환자수
FROM Patient a
JOIN Nurse b ON a.nur_id = b.nur_id
GROUP BY a.nur_id, nur_name
ORDER BY 환자수 DESC
) WHERE ROWNUM<=1;