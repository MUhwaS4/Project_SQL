-- 실습을 시작하기 전에 모든 테이블을 삭제한다.
-- 그리고 회원(CUSTOMER), 도서(BOOK), 연락처(CONTACTS), 선물(GIFT), 영화예매(RESERVATION) 테이블, 상품(PRODUCT)을 다시 생성한다.

CREATE TABLE CUSTOMER (
	CUSTOMER_NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '회원 번호',
	NAME VARCHAR(20) NOT NULL COMMENT '이름',
	ADDRESS VARCHAR(100) COMMENT '주소'
);

INSERT INTO CUSTOMER (NAME, ADDRESS)
VALUES
('둘리', '서울'),
('또치', '인천'),
('도우너', NULL),
('고길동', '부산'),
('마이콜', '부산');

CREATE TABLE BOOK (
	BOOK_NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '도서 번호',
	TITLE VARCHAR(30) NOT NULL COMMENT '제목',
	PUBLISHER VARCHAR(100) COMMENT '출판사',
	PUB_DATE DATE COMMENT '출간일',
	PRICE INT COMMENT '가격'
);

INSERT INTO BOOK(TITLE, PUBLISHER, PUB_DATE, PRICE)
VALUES
('역사1', '상상마당', '2023-01-01', 10000),
('역사2', '상상마당', '2023-01-02', 20000),
('스프링웹프로젝트', '한빛미디어', '2023-02-01', 40000),
('자바프로그래밍', NULL, NULL, NULL);

CREATE TABLE CONTACTS (
	LAST_NAME VARCHAR(255) NOT NULL COMMENT '성',
	FIRST_NAME VARCHAR(255) NOT NULL COMMENT '이름',
	EMAIL VARCHAR(255) NOT NULL COMMENT '이메일',
	PHONE VARCHAR(20) COMMENT '연락처'
);

INSERT INTO CONTACTS
VALUES
('이', '서연', 'stone@naver.com', '010-2341-0000'),
('이', '시우', 'lavera@naver.com', NULL),
('김', '지호', 'shyla@naver.com', '010-2341-0000'),
('김', '윤서', 'jeni@naver.com', '010-2341-0000'),
('최', '수아', 'fern@naver.com', NULL);

CREATE TABLE GIFT (
	NAME VARCHAR(20) COMMENT '상품명',
	TYPE VARCHAR(20) COMMENT '품목',
	PRICE INT COMMENT '가격'
);

INSERT INTO GIFT
VALUES
('참치 세트', '식품', 10000),
('햄 세트', '식품', 20000),
('샴푸 세트', '생활용품', 30000),
('세차 용품', '생활용품', 40000),
('주방 용품', '생활용품', 50000),
('노트북', '가전제품', 60000),
('벽걸이 TV', '가전제품', 70000);


CREATE TABLE RESERVATION (
	MOVIE_NAME VARCHAR(20) NOT NULL COMMENT '영화명',
	USER_NAME VARCHAR(20) NOT NULL COMMENT '예약자명',
	SEAT_NO VARCHAR(5) COMMENT '자리 번호',
	DATE DATE COMMENT '예약일'
);

INSERT INTO RESERVATION
VALUES
('아바타', '둘리', 'A1', '2024-04-20'),
('아바타', '또치', 'A2', '2024-04-20'),
('아바타', '도우너', 'B1', '2024-04-21'),
('슬램덩크', '짱구', 'A2', '2024-04-20'),
('영웅', '고길동', 'B3', '2024-04-21');

CREATE TABLE PRODUCT (
	PRODUCT_NO INT PRIMARY KEY COMMENT '제품 번호',
	PRODUCT_NAME VARCHAR(20) COMMENT '제품명',
	PRICE INT COMMENT '가격',
	CATEGORY VARCHAR(10) COMMENT '카테고리(과자, 음료, 주류)'
);

INSERT INTO PRODUCT
VALUES
(1, '허니버터칩', 2300, '과자'),
(2, '새우깡', 1100, '과자'),
(3, '코카콜라', 1000, '음료'),
(4, '아침에주스', 4900, '음료'),
(5, '처음처럼', 3000, '주류'),
(6, '참이슬', 2500, '주류');


/* 숫자 함수 */

-- 반올림, 올림, 내림
SELECT ROUND(1.4), CEIL(1.4), FLOOR(1.4); -- 1, 2, 1
SELECT ROUND(1.49), ROUND(1.5), ROUND(1.55), ROUND(1.3);
SELECT CEIL(1.49), CEIL(1.5), CEIL(1.55), CEIL(1.9);
SELECT FLOOR(1.49), FLOOR(1.5), FLOOR(1.55), FLOOR(1.9);


-- 목록 중에서 가장 큰 값, 가장 작은 값
SELECT GREATEST(1, 2, 3), LEAST(1, 2, 3);

-- 절대값
SELECT ABS(1), ABS(-1); -- 1, 1
SELECT ABS(3.1415926535897932384626433832795); -- 1, 1

-- 소수점자리 선택
SELECT TRUNCATE(1.2345, 2); -- 1.23
SELECT TRUNCATE(3.1415926535897932384626433832795, 10); -- 1.23


/* 논리 함수 */

-- 컬럼이 NULL이면 ''으로 치환
SELECT
	NAME,
	IFNULL(ADDRESS, '없음')
	-- IFNULL: 데이터가 있다면 그대로 출력, 없으면 '없음'을 출력하겠다고 선언
FROM
	CUSTOMER;
	

/* 문자열 함수 */

-- 대문자로 변환
SELECT UPPER('abc'); -- ABC

-- 소문자로 변환
SELECT LOWER('ABC'); -- abc

-- 문자열 연결하기
SELECT CONCAT('ab', 'cd', 'e'); -- abcde

-- 문자열 자르기 (3번째 위치부터 끝까지, 3번째 위치부터 2글자)
SELECT SUBSTR ('ABCDEFG', 3), SUBSTR('ABCDEFG', 3, 2); -- CDEGF, CD

-- 문자열 자르기 (왼쪽부터 3글자, 오른쪽부터 3글자)
SELECT LEFT ('ABCDEF', 3), RIGHT ('ABCDEFG', 3); -- ABC, EEF

-- 문자열 길이 구하기 (바이트 크기, 자리수)
SELECT LENGTH('ABCDE'), CHAR_LENGTH('ABCDE'); -- 5, 5

-- 문자열 길이 구하기 (바이트 크기, 자리수)
SELECT LENGTH('안녕하세요'),CHAR_LENGTH('안녕하세요'); -- 15, 5

-- 공백 제거하기
SELECT TRIM(' HELLO '); -- HELLO

-- 특정 문자로 자리 채우기
SELECT LPAD('ABC', 5, '*'), RPAD('ABC', 5, '-'); -- **ABC, ABC--

-- 문자 교체하기
SELECT REPLACE('오늘은 월요일 입니다', '월요일 ', '수요일'); -- 오늘은 수요일입니다


-- 선물 테이블에서 품목을 그룹으로 묶기
SELECT TYPE FROM GIFT GROUP BY TYPE; -- 가전제품, 생활용품, 식품

-- 최소값, 최대값, 행의 개수, 합계, 평균
SELECT
	MIN(PRICE),
	MAX(PRICE),
	COUNT(*),
	SUM(PRICE),
	AVG(PRICE)
FROM 
	GIFT
GROUP BY TYPE; -- 품목별로 가격 계산하기

-- 품목별로 선물목록 구하기
SELECT TYPE, GROUP_CONCAT(NAME)
FROM GIFT
GROUP BY TYPE;


-- 문제 1. CUSTOMER 회원 테이블에서 같은 지역에 사는 회원의 수.
SELECT 
    ADDRESS,
    COUNT(*)
FROM CUSTOMER
GROUP BY ADDRESS;

-- 문제 2. CUSTOMER 회원 테이블에서 지역별로 회원 목록.
SELECT ADDRESS, GROUP_CONCAT(NAME)
FROM CUSTOMER
GROUP BY ADDRESS;

-- 문제 3. BOOK 도서 테이블에서 출판사를 기준으로 책의 개수와 가격의 합계.
SELECT 
	IFNULL(PUBLISHER, '--'),
	COUNT(*),
	IFNULL(SUM(PRICE), 0) 
FROM
	BOOK
GROUP BY PUBLISHER;

-- 문제 4. BOOK 도서 테이블에서 월별로 출간된 책의 개수.
SELECT MONTH(PUB_DATE) FROM BOOK;
SELECT
	CONCAT(MONTH(PUB_DATE), '월'),
	COUNT(*)
FROM
	BOOK
GROUP BY MONTH(PUB_DATE);

-- 문제 5. CONTACTS 연락처 테이블에서 성과 이름을 합쳐 풀네임으로 만들기.
SELECT
	LAST_NAME,
	FIRST_NAME,
	CONCAT(LAST_NAME, FIRST_NAME)
FROM CONTACTS
GROUP BY CONCAT(LAST_NAME, FIRST_NAME);

-- 문제 6. CONTACTS 연락처 테이블에서 같은 성을 가진 사람의 수
SELECT LAST_NAME, COUNT(*)
FROM CONTACTS
GROUP BY LAST_NAME;

-- 문제 7. RESERVATION 영화 예매 테이블에서 날짜별로 영화를 예매한 건수
SELECT DATE, MOVIE_NAME, COUNT(*)
FROM RESERVATION
GROUP BY DATE, MOVIE_NAME;

-- 문제 8. RESERVATION 영화 예매 테이블에서 A열에 앉은 사람과 B열에 앉은 사람의 수.
SELECT CONCAT(LEFT (SEAT_NO, 1), '열'), GROUP_CONCAT(USER_NAME) 
FROM RESERVATION
GROUP BY CONCAT(LEFT (SEAT_NO, 1), '열');

-- 문제 9. PRODUCT 상품 테이블에서 카테고리별로 최고가, 최고가순 정렬.
SELECT CATEGORY, MAX(PRICE)
FROM PRODUCT
GROUP BY CATEGORY
ORDER BY MAX(PRICE) DESC;

-- 문제 10. PRODUCT 상품 테이블에서 카테고리별로 상품 리스트와 합계.
SELECT CATEGORY, GROUP_CONCAT(PRODUCT_NAME), SUM(PRICE)
FROM PRODUCT
GROUP BY CATEGORY;