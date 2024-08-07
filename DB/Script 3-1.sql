CREATE TABLE CUSTOMER (
	CUSTOMER_NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '회원 번호',
	NAME VARCHAR(20) NOT NULL COMMENT '이름',
	ADDRESS VARCHAR(100) COMMENT '주소'
);

-- 회원 테이블에 회원 정보 추가

-- 1. 입력한 컬럼을 표기 
INSERT INTO CUSTOMER(NAME, ADDRESS)
VALUES ('둘리', '서울');

-- 2. 컬럼 색략
INSERT INTO CUSTOMER
VALUES (2, '또치', '인천');

-- 회원 테이블에 불완전한 회원 정보 추가
INSERT INTO CUSTOMER(NAME, ADDRESS)
VALUES ('도우너', NULL); -- 주소에 빈값 입력

-- 여러 회원 정보 한 번에 추가
INSERT INTO CUSTOMER (NAME, ADDRESS)
VALUES
('고길동', '부산'),
('마이콜', '부산');

-- 번호 컬럼은 중복이 불가하기 때문에(pk 중복 에러) 데이터를 넣을 수 없음 
INSERT INTO CUSTOMER 
VALUES (4, '고길동', '부산');

-- 이름 컬럼은 NOT NULL이기 때문에 빈값이 들어갈 수 없음
INSERT INTO CUSTOMER 
VALUES (6, NULL, NULL)

-- 컬럼의 데이터 크기보다 큰 데이터는 넣을 수 없음
INSERT INTO CUSTOMER 
VALUES (6, '가나다라가나다라가나다라가나다라가나다라가나다라가나다라가나다라가나다라가나다라가나다라가나다라', NULL)

-- 오탈자 수정
ALTER TABLE CUSTOMER RENAME COLUMN ADDSESS TO ADDRESS;


-- 문제 1. 도서 정보를 저장할 BOOK 테이블 생성

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

-- 문제 2. 연락처 정보를 저장할 CONTACTS 테이블 생성

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

-- 문제 3. 선물 정보를 저장할 GIFT 테이블 생성

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

-- 문제 4. 수업 정보를 저장할 CLASS 테이블 생성

CREATE TABLE CLASS (
    CLASS_NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '수업 번호',
    CLASS_NAME VARCHAR(30) COMMENT '과목명',
    CLASS_TIME TIME COMMENT '수업 시간'
);

INSERT INTO CLASS (CLASS_NAME, CLASS_TIME)
VALUES
('수학', '09:00:00'),
('국어', '10:00:00'),
('영어', '11:00:00');

-- 문제 5. 영화 예약 정보를 저장할 RESERVATION 테이블 생성

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

-- 문제 6. 편의점 상품 정보를 저장할 PRODUCT 테이블 생성

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