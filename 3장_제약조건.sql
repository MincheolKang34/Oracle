-------------------------------------
// 2. 제약조건
-------------------------------------

-- 실습하기
CREATE TABLE USER2 (
    USER_ID VARCHAR2(20) PRIMARY KEY,
    NAME    VARCHAR2(20),
    HP      CHAR(13),
    AGE     NUMBER(2)
);

-- primary key(기본키)는 중복 허용 안 됨.
INSERT INTO USER2 VALUES ('A101', '김유신', '010-1234-1111', 23);
INSERT INTO USER2 VALUES ('A101', '김춘추', '010-1234-2222', 21);

// 실습하기 2-2
create table user3 (
    user_id varchar2(20) primary key,
    name    varchar2(20),
    hp      char(13) unique,
    age     number(3)
    );

insert into user3 values ('a101', '김유신', '010-1234-1111', 23);
insert into user3 values ('a102', '김춘추', '010-1234-2222', 21);