-- 회원 테이블에서 모든 데이터를 가져오기
-- *는 테이블의 모든 컬럼을 의미
SELECT * FROM CUSTOMER;

SELECT
	*
FROM 
	CUSTOMER
WHERE
	CUSTOMER_NO = 1;

-- 회원 테이블에서 회원 번호와 이름만 가져오기
SELECT CUSTOMER_NO, NAME FROM CUSTOMER;

-- 비교 연산자
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO = 1;
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO != 1;
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO < 3;
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO <= 3;

-- 정렬: 쿼리 드래그한 후에 CTRL + SHIFT + F

-- 논리 연산자
-- 서울에 사는 둘리 회원 데이터 가져오기
SELECT * FROM CUSTOMER
WHERE NAME = '둘리' AND ADDRESS = '서울'; -- 곱

-- 인천 또는 서울에 사는 회원 데이터 가져오기
SELECT * FROM CUSTOMER
WHERE ADDRESS = '인천' OR ADDRESS = '서울'; -- 합

-- 주소가 서울이 아닌 회원 데이터를 가져오기
SELECT * FROM CUSTOMER
WHERE NOT ADDRESS = '서울'; -- 조건을 만족하지 못하는 데이터 추출(빈값 제외)