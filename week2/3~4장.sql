-- SQL 첫걸음 기반 실습 - 2주차

-- age 열로 정렬하기 
SELECT * FROM sample31 ORDER BY age;
--address 열로 정렬하기
SELECT * FROM sample31 ORDER BY address;

-- 기본은 오름차순 정렬, 내림차순으로 정렬하려면 뒤에 DESC
SELECT * FROM sample31 ORDER BY age DESC; --내림차순
SELECT * FROM sample31 ORDER BY age ASC; --오름차순

-- 복수 열 지정: 둘이 결과값이 다름.
SELECT * FROM sample32 ORDER BY a,b;
SELECT * FROM sample32 ORDER BY b,a; 

-- 정렬방법 지정 가능
SELECT * FROM sample32 ORDER BY a ASC, b DESC;

-- 결과 행 제한하기
SELECT * FROM sample33 LIMIT 3; -- 3개 행만 반환
SELECT * FROM sample33 ORDER BY no DESC LIMIT 3; -- no 기준으로 정렬하고 3개 행만 반환

-- 오프셋 지정
SELECT * FROM sample33 LIMIT 3 OFFSET 0; -- 1~3행 표시
SELECT * FROM sample33 LIMIT 3 OFFSET 3; -- 4~6행 표시

-- SELECT 구로 금액 계산
SELECT *, price * quantity FROM sample34; -- 기본 sample34에 price*quantity 결과 열까지 포함
SELECT *, price * quantity AS amount FROM sample34; -- price*quantity 결과 열 별명을 amount로 변경
SELECT *, price * quantity AS amount FROM sample34 WHERE price * quantity >= 2000; -- WHERE 구에서 금액 계산하고 2000 이상인 행 검색. 이 때 WHERE 구에 SELECT 구에서 지정한 별명 사용 불가!! WHERE구 먼저 시행되기에 별명을 모름.
SELECT *, price * quantity AS amount FROM sample34 ORDER BY price * quantity DESC; -- ORDER BY 구에서 금액 계산 후 내림차순 정렬
SELECT *, price * quantity AS amount FROM sample34 ORDER BY amount DESC; --이 때는 별명 사용 가능, SELECT구 이후에 ORDER BY 구 처리됨

-- 반올림 함수
SELECT amount, ROUND(amount) FROM sample341; -- 소수점 이하를 반올림
SELECT amount, ROUND(amount, 1) FROM sample341; -- 소수점 둘때 자리를 반올림
SELECT amount, ROUND(amount, -2) FROM sample341; -- 10단위 반올림도 가능

-- 문자열 연산
SELECT CONCAT(quantity, unit) FROM sample35; -- quantity는 정수형이지만, 문자열로 결합 가능. 문자열형이 됨

-- 날짜 연산
SELECT CURRENT_TIMESTAMP; -- 시스템 날짜 확인
SELECT CURRENT_DATE + INTERVAL 1 DAT; -- 시스템 날짜의 1일 후 검색

-- CASE 문으로 데이터 변환
SELECT a, CASE WHEN a IS NULL THEN 0 ELSE a END "a(null=0)" FROM sample37;
-- CASE로 NULL값을 0으로 변환, IS NULL 사용함.

SELECT a AS "코드",
CASE
    WHEN a=1 THEN '남자'
    WHEN a=2 THEN '여자'
    ELSE '미지정'
END AS "성별" FROM sample37;
-- 검색 CASE로 성별 코드를 남자, 여자, 미지정으로 변환

SELECT a AS "코드",
CASE a
    WHEN 1 THEN '남자'
    WHEN 2 THEN '여자'
    ELSE '미지정'
END AS "성별" FROM sample37;
-- 이렇게도 가능. 단순 CASE문 

CASE
    WHEN a=1 THEN '남자'
    WHEN a=2 THEN '여자'
    WHEN a IS NULL THEN '데이터 없음'
    ELSE '미지정'
END 
-- NULL 판정도 가능, 하지만 단순 CASE문이면 안됨.

-- 행 추가하기: 추가 전에 DESC 명령으로 각 열의 데이터 유형 확인하면 좋음
INSERT INTO sample41 VALUES(1, 'ABC', '2014-01-25');
INSERT INTO sample41(a,no) VALUES('XYW',2); -- no열과 a열에만 행 추가, b열에는 NULL값이 추가됨
-- 만약 DEFAULT값이 NULL이 아니고 다른 무언가라면, 명시하지 않았을 때에는 DEFAULT값이 추가됨

-- 삭제하기
DELETE FROM sample41 WHERE no=3; -- no열이 3인 행 삭제

-- 데이터 갱신
UPDATE sample41 SET b = '2014-09-07' WHERE no=2; --행의 셀값 갱신
UPDATE sample41 SET no=no+1; -- 이런 형태도 가능
UPDATE sample41 SET a='xxx', B='2014-01-01' WHERE no=2; -- 한꺼번에 UPDATE해도 됨
UPDATE sample41 SET a=NULL; -- NULL 초기화