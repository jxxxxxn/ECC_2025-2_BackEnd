-- SQL 첫걸음 기반 실습 - 3주차

-- 행 개수 구하기
SELECT COUNT(*) FROM sample51;
SELECT COUNT(*) FROM sample51 WHERE name='A';

SELECT COUNT(no), COUNT(name) FROM sample51;

-- 모든 행 개수 구하기
SELECT ALL name FROM sample51;
-- 중복값 제외한 행 개수 구하기
SELECT DISTINCT name FROM sample51;

-- 중복 제거 X 개수 + 중복 제거한 개수 구하기  
SELECT COUNT(ALL name), COUNT(DISTINCT name) FROM sample51;

-- SUM 함수 사용
SELECT SUM(quantity) FROM sample51;

-- AVG 함수 사용
SELECT AVG(quantity), SUM(quantity)/COUNT(quantity) FROM sample51;
-- NULL값을 0으로 변환하고 AVG 함수 사용
SELECT AVG(CASE WHEN quantity IS NULL THEN 0 ELSE quantity END) AS avgnull0 FROM sample51;

-- MIN, MAX 함수 사용
SELECT MIN(quantity), MAX(quantity), MIN(name), MAX(name) FROM sample51;

-- name 열로 그룹화
SELECT name FROM sample51 GROUP BY name;
SELECT name, COUNT(name), SUM(quantity) FROM sample51 GROUP BY name;

-- HAVING 구로 조건 지정
SELECT name, COUNT(name) FROM sample51 GROUP BY name HAVING COUNT(name)=1;

-- 복수 열의 그룹화
SELECT MIN(no), name, SUM(quantity) FROM sample51 GROUP BY name;

-- 결과값 정렬
SELECT name, COUNT(name), SUM(quantity) FROM sample51 GROUP BY name ORDER BY SUM(quantity) DESC;

-- 최솟값을 가지는 행 삭제 (인라인 뷰로 임시 테이블 만들어 에러 피하기)
DELETE FROM sample54 WHERE a=(SELECT a FROM (SELECT MIN(a) AS a FROM sample54) AS x);

-- SELECT 구에서 서브쿼리 사용하기
SELECT
    (SELECT COUNT(*) FROM sample51) AS sq1,
    (SELECT COUNT(*) FROM sample54) AS sq2;

-- SET 구에서 서브쿼리 사용하기
UPDATE sample54 SET a=(SELECT MAX(a) FROM sample54);

-- FROM 구에서 서브쿼리 사용하기
SELECT * FROM (SELECT * FROM sample54) AS sq;
SELECT * FROM (SELECT * FROM (SELECT * FROM sample54) sq1) sq2;

-- VALUES 구에서 서브쿼리 사용하기기
INSERT INTO sample541 VALUES (
    (SELECT COUNT(*) FROM sample51),
    (SELECT COUNT(*) FROM sample54)
);

-- SELECT 결과를 INSERT하기
INSERT INTO sample541 SELECT 1,2;

-- 테이블 행 복사
INSERT INTO sample542 SELECT * FROM sample543;

-- EXISTS 이용해 '있음' 갱신
UPDATE sample551 SET a='있음' WHERE EXISTS (SELECT * FROM sample552 WHERE no2=no);

-- NOT EXISTS 이용해 '없음' 갱신
UPDATE sample551 SET a='없음' WHERE NOT EXISTS (SELECT * FROM sample552 WHERE no2=no);

-- 열에 테이블명 붙이기
UPDATE sample551 SET a='있음' WHERE EXISTS (SELECT * FROM sample552 WHERE sample552.no2= sample551.no);

-- IN 사용하여 조건식 기술
SELECT * FROM sample551 WHERE no IN (3, 5);

-- IN의 오른쪽을 서브쿼리로 지정
SELECT * FROM sample551 WHERE no IN (SELECT no2 FROM sample552);