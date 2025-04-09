-- SQL 첫걸음 기반 실습 - 4주차 - 7장

-- UNION (합집합)
SELECT * FROM sample71_a
UNION
SELECT * FROM sample71_b;

-- 합집합 결괏값 정렬 (반드시 마지막 SELECT 명령에 붙임+열 이름 같게 해 주어야 함)
SELECT a AS c FROM sample71_a
UNION
SELECT b AS c FROM sample71_b ORDER BY c;

-- UNION ALL (중복값 제거 x 합집합)
SELECT * FROM sample71_a
UNION ALL
SELECT * FROM sample71_b;

-- 교차결합
SELECT * FROM sample72_x, sample72_y;

-- 내부결합
SELECT 상품.상품명, 재고수.재고수 
FROM 상품,재고수 
WHERE 상품.상품코드 = 재고수.상품코드 
AND 상품.상품분류='식료품';

-- INNER JOIN 사용 내부결합
SELECT 상품.상품명, 재고수.재고수
FROM 상품 INNER JOIN 재고수
ON 상품.상품코드=재고수.상품코드
WHERE 상품.상품분류='식료품';

-- 내부결합 사용 데이터 관리
SELECT S.상품명, M.메이커명
FROM 상품2 S INNER JOIN 메이커 M
ON S.메이커코드=M.메이커코드

-- 외부결합 (LEFT JOIN, RIGHT JOIN 모두 가능)
SELECT 상품3.상품명, 재고수.재고수
FROM 상품3 LEFT JOIN 재고수
ON 상품3.상품코드=재고수.상품코드
WHERE 상품3.상품분류='식료품';