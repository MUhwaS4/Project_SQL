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


-- 문제 1. BOOK 도서 테이블에서 다음의 조건으로 책 검색.

-- 조건: 가격 = 20000원
SELECT * FROM BOOK
WHERE PRICE = 20000;

-- 조건: 10000원 ≤ 가격 ≤ 30000원
SELECT * FROM BOOK
WHERE PRICE >= 10000 AND PRICE <= 30000;

-- 조건: 제목 = 역사1 or 역사2
SELECT * FROM BOOK
WHERE TITLE = '역사1' OR TITLE = '역사2';

-- 조건: 출판일 = 1월 30일 이전 + 가격 = 10000원
SELECT * FROM BOOK
WHERE PUB_DATE < '2023-01-30' AND PRICE = 10000;
-- 날짜는 20230130로도 표현 가능 (하이픈이 없을 경우 따옴표 X 하이픈이 있을 경우 따옴표 O)


-- 문제 2. CONTACTS 도서 테이블에서 다음의 조건으로 사람 검색.

-- 조건: 이씨 성을 가진 사람
SELECT * FROM CONTACTS
WHERE LAST_NAME = '이';

-- 조건: 김씨 성이 아닌 사람
SELECT * FROM CONTACTS
WHERE NOT LAST_NAME = '김';

-- 조건: 이름 = 윤서 or 수아
SELECT * FROM CONTACTS
WHERE FIRST_NAME = '윤서' OR FIRST_NAME = '수아';


-- 문제 3. CLASS 수업 테이블에서 다음의 조건으로 과목 검색.

-- 조건: 수업번호 = 1번
SELECT * FROM CLASS
WHERE CLASS_NO = 1;

-- 조건: 10시 이후에 수업을 하는 과목
SELECT * FROM CLASS
WHERE CLASS_TIME >= '10:00:00';

-- 조건: 9시 혹은 11시에 수업을 하는 과목
SELECT CLASS_NAME FROM CLASS
WHERE CLASS_TIME = '09:00:00' OR CLASS_TIME = '11:00:00';


-- 문제 4. RESERVATION 영화 테이블에서 다음의 조건으로 예약 검색.

-- 조건: 예약일 = 4월 21일
SELECT MOVIE_NAME, SEAT_NO FROM RESERVATION
WHERE DATE = '2024-04-21' AND MOVIE_NAME = '아바타' OR MOVIE_NAME ='영웅' AND SEAT_NO = 'B1' OR SEAT_NO = 'B3';

-- 조건: 아바타를 제외한 영화 목록
SELECT MOVIE_NAME FROM RESERVATION
WHERE NOT MOVIE_NAME = '아바타'; 

-- 조건: 4월 20일에 A2 자리를 예약한 고객의 이름
SELECT USER_NAME FROM RESERVATION
WHERE DATE = '2024-04-20' AND SEAT_NO = 'A2';


-- 문제 5. PRODUCT 상품 테이블에서 다음의 조건으로 상품 검색.

-- 조건: 금액 < 2000원
SELECT * FROM PRODUCT
WHERE PRICE <= 2000;

-- 조건: 과자 또는 음료
SELECT CATEGORY, PRODUCT_NAME FROM PRODUCT
WHERE CATEGORY = '과자' OR CATEGORY = '음료';

-- 조건: 금액 > 4000원
SELECT PRODUCT_NAME, PRICE FROM PRODUCT
WHERE PRICE >= 4000;