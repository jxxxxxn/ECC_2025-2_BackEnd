-- SQL 첫걸음 기반 실습 - 3주차 - 6장

-- 테이블 만들기
CREATE TABLE sample62 (
    no INTEGER NOT NULL,
    a VARCHAR(30),
    b DATE);

-- 테이블 삭제
DROP TABLE 테이블명

-- 테이블의 모든 행 삭제
TRUNCATE TABLE 테이블명 

-- 테이블 열 추가
ALTER TABLE sample62 ADD newcol INTEGER;

-- 테이블 열 속성 변경
ALTER TABLE sample62 MODIFY newcol VARCHAR(20);

-- 테이블 열명 변경 (속성도 함께 변경 가능능)
ALTER TABLE sample62 CHANGE newcol c VARCHAR(20);

-- 테이블 열 삭제
ALTER TABLE sample62 DROP c;

-- 테이블 열에 제약 정의하기
CREATE TABLE sample631 (
    a INTEGER NOT NULL,
    b INTEGER NOT NULL UNIQUE,
    c VARCHAR(30)
);

-- 테이블에 테이블 제약 정의하기+테이블 제약에 이름 붙이기
CREATE TABLE sample632 (
    no INTEGER NOT NULL,
    sub_no INTEGER NOT NULL,
    name VARCHAR(30),
    CONSTRAINT pkey_sample PRIMARY KEY (no, sub_no)
);

-- 열 제약 추가
ALTER TABLE sample631 MODIFY c VARCHAR(30) NOT NULL;

-- 테이블 제약 추가
ALTER TABLE sample631 ADD CONSTRAINT pkey_sample631 PRIMARY KEY(a);

-- 제약 삭제
ALTER TABLE sample631 MODIFY c VARCHAR(30);

-- 테이블 제약 삭제
ALTER TABLE 테이블명 DROP PRIMARY KEY;

-- 기본키 제약 설정 (기본키는 NOT NULL 제약 필수)
CREATE TABLE sample634 (
    p INTEGER NOT NULL,
    a VARCHAR(30),
    CONSTRAINT pkey_sample634 PRIMARY KEY(p)
);

-- 인덱스 작성
CREATE INDEX isample65 ON sample62(no);

-- 인덱스 삭제
DROP INDEX 인덱스명 (스키마 객체의 경우)
DROP INDEX 인덱스명 ON 테이블명 (테이블 내 객체의 경우)
DROP INDEX isample65 ON sample62;

-- EXPLAIN 명령
EXPLAIN SELECT * FROM sample62 WHERE a='a';
EXPLAIN SELECT * FROM sample62 WHERE no>10;

-- 뷰의 작성
CREATE VIEW sample_view_67 AS SELECT * FROM sample54;
CREATE VIEW sample_view_672(n,v,v2) AS SELECT no,a,a*2 FROM sample54;

-- 뷰의 삭제
DROP VIEW 뷰명 