CREATE TABLE STOER1 (
	PRODUCT VARCHAR(20),
	PRICE INT
);

INSERT INTO STOER1
VALUES
('소주', 4000),
('맥주', 5000),
('와인', 20000);

CREATE TABLE STOER2 (
	PRODUCT VARCHAR(20),
	PRICE INT
);

INSERT INTO STOER2
VALUES
('소주', 4000),
('맥주', 5000),
('위스키', 50000);

-- JOIN: 가로로 나열된 (왼쪽, 오른쪽) 테이블을 병합
-- UNION: 세로로 나열된 (위, 아래) 테이블을 병합

-- 두 슈퍼의 제품을 모두 가져오기
SELECT *
FROM STOER1
UNION ALL
SELECT *
FROM STOER2;

-- 중복을 제거하고 두 슈퍼의 제품을 모두 가져오기
SELECT *
FROM STOER1
UNION
SELECT *
FROM STOER2;

-- 형태와 상관없이 컬럼의 개수와 자료형이 일치해야 함
SELECT 'A', 123
UNION
SELECT 'B', 456;

-- 테이블 구조 보기
-- DESC BOOK;
DESC PRODUCT;

-- ~~ 문: 명령
-- 내용을 작성할 때 가장 앞에서 무엇을 할 건지 [명령]함
-- ~~ 절: 옵션
-- 내용을 작성할 때 중간중간에 어떻게 할 것인지 [보조]함


-- 문제 1. BOOK과 PRODUCT을 이용하여 책과 과자 리스트를 구하기.
SELECT BOOK_NO AS '제품번호', CONCAT('(책)', TITLE) AS '제품명', IFNULL(PRICE, 0) AS '가격'
FROM BOOK
UNION
SELECT PRODUCT_NO AS '제품번호', CONCAT('(과자)', PRODUCT_NAME) AS '제품명', IFNULL(PRICE, 0) AS '가격' 
FROM PRODUCT
WHERE CATEGORY = '과자';