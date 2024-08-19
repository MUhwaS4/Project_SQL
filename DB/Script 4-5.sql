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
('자바프로그래밍', NULL, NULL, NULL),
('데이터베이스 개론', '한빛미디어', '2023-01-15', 30000),
('파이썬 프로그래밍', '길벗', '2023-01-25', 35000),
('자바의 정석', '상상마당', '2023-02-10', 45000),
('웹 개발자 길라잡이', '한빛미디어', '2023-02-20', 28000),
('알고리즘 문제 해결 전략', '길벗', '2023-03-05', 50000),
('머신러닝 입문', '상상마당', '2023-03-15', 55000);

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
('김', '지호', 'shyla@gmail.com', '010-3171-4126'),
('김', '윤서', 'jeni@gmail.com', '010-8121-2341'),
('최', '수아', 'fern@gmail.com', NULL),
('이', '하린', 'harin@daum.net', '010-2234-5678'),
('김', '도윤', 'doyoon@gmail.com', '010-3345-6789'),
('최', '지우', 'jiwoo@daum.net', '010-3456-7890'),
('이', '서준', 'seojun@naver.com', '010-4567-8901'),
('최', '민서', 'minseo@daum.net', '010-5678-9012');

CREATE TABLE GIFT (
	NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '선물 번호',
	NAME VARCHAR(20) COMMENT '상품명',
	TYPE VARCHAR(20) COMMENT '품목',
	PRICE INT COMMENT '가격'
);

INSERT INTO GIFT
VALUES
(1, '참치 세트', '식품', 10000),
(2, '햄 세트', '식품', 20000),
(3, '샴푸 세트', '생활용품', 30000),
(4, '세차 용품', '생활용품', 40000),
(5, '주방 용품', '생활용품', 50000),
(6, '노트북', '가전제품', 60000),
(7, '벽걸이 TV', '가전제품', 70000),
(8, '커피머신', '가전제품', 80000),
(9, '홍삼세트', '식품', 15000),
(10, '청소기', '가전제품', 90000);


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


-- HAVING: '그룹화 후 집계된 데이터를 필터링'
-- 선물번호가 3보다 큰 선물을 대상으로, 품목별로 선물의 개수를 센다.
-- 그리고 선물의 개수가 3보다 큰 항목의 데이터를 조회한다.

SELECT * FROM GIFT
WHERE NO > 3
GROUP BY TAPE,
HAVING COUNT(*) > 3; 

-- 2024년 1월 2일 이후에 출산된 책을 대상으로 출판사 별로 책 합계를 계산한다.
-- 합계가 5만원에서 9만원 사이인 출판사 데이터를 조회한다.

SELECT PUBLISHER, SUM(PRICE) FROM BOOK
WHERE PUB_DATE > '2023-01-20'
GROUP BY PUBLISHER
HAVING SUM(PRICE) BETWEEN 50000 AND 90000;

-- 문제 11. 출판사 별로 책 가격의 평균 구하기
-- 평균 가격이 35000원 이하면서 최소 가격이 20000원 이상인 출판사 찾기

SELECT B.PUBLISHER, AVG(PRICE), MIN(PRICE) FROM BOOK B
GROUP BY PUBLISHER
HAVING AVG(PRICE) <= 35000 AND MIN(PRICE) >= 20000;

-- 문제 12. 출판사 별로 책의 수량과 책 가격의 합을 계산하기
-- 책의 수량이 3권 이상이고 책 가격의 합이 70000원 이상인 출판사의 데이터 찾기

SELECT PUBLISHER, COUNT(PUBLISHER) AS BOOK_COUNTM, SUM(PRICE) FROM BOOK B 
GROUP BY PUBLISHER
HAVING COUNT(PUBLISHER) >= 3 AND SUM(PRICE) >= 70000;

-- 문제 13. 출판 날짜가 2023년 2월 1일 이후거나 출판 날짜가 없는 데이터를 대상으로 출판사별로 가장 비싼 책 구하기
-- 그 중 최고 가격이 50000원 이상인 출판사의 데이터 찾기

SELECT PUBLISHER, MAX(PRICE) FROM BOOK B
WHERE PUB_DATE > '2023-02-01' OR PUB_DATE IS NULL
GROUP BY PUBLISHER
HAVING MAX(PRICE) >= 50000;

-- 문제 14. 지메일을 사용하고 연락처가 있는 사람을 대상으로 사람의 수를 세기
-- 그 중에서 사람이 2명 이상인 그룹의 데이터 찾기

SELECT C.LAST_NAME, COUNT(*) FROM CONTACTS C
WHERE C.EMAIL LIKE '%gmail%' AND C.PHONE IS NOT NULL
GROUP BY C.LAST_NAME
HAVING COUNT(*) >= 2;