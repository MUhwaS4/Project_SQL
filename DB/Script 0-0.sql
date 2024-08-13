CREATE TABLE CUSTOMER (
	ID INT PRIMARY KEY,
	NAME VARCHAR(20) NOT NULL,
	ADDRESS VARCHAR(100)
);

CREATE TABLE ORDERS (
	ORDER_NO INT PRIMARY KEY COMMENT '주문 번호',
	SALESMAN_ID INT COMMENT '판매자 아이디',
	ORDER_DATE DATE NOT NULL COMMENT '주문 일자'
);

CREATE TABLE CATEGORIES (
	MENU_ID INT PRIMARY KEY COMMENT '메뉴 아이디',
	MENU_NAME CHAR NOT NULL COMMENT '메뉴명',
	KILOCALORIES INT NOT NULL COMMENT '칼로리',
	PRICE INT NOT NULL COMMENT '가격'
);

CREATE TABLE LOCATION (
	LOCATION_ID INT PRIMARY KEY ,
	ADDRESS VARCHAR(255) NOT NULL,
	POSTAL_CODE VARCHAR(20),
	CITY VARCHAR(50)
);

CREATE TABLE MENUS (
	MENU_ID INT PRIMARY KEY COMMENT '메뉴 아이디',
	MENU_NAME CHAR NOT NULL COMMENT '메뉴명',
	KILOCALORIES INT NOT NULL COMMENT '칼로리',
	PRICE INT NOT NULL COMMENT '가격'
);

CREATE TABLE CURRICULUM (
	NO INT PRIMARY KEY COMMENT '과목 번호',
	NAME VARCHAR(30) COMMENT '과목명',
	POINTS INT COMMENT '학점',
	PROFID INT COMMENT '교수 번호'
);

CREATE TABLE DEPT (
	DEPT_NO INT PRIMARY KEY COMMENT '부서 번호',
	DEPT_NAME VARCHAR(20) COMMENT '부서명',
	DEPT_LOC VARCHAR(20) COMMENT '부서 위치'
);

CREATE TABLE EMP (
	EMP_NO INT PRIMARY KEY,
	DEPT_NO INT,
	EMP_NAME VARCHAR(10),
	HDATE DATE
);

CREATE TABLE CINEMA (
	THEATER_NO INT PRIMARY KEY COMMENT '상영관 번호',
	LOCATION VARCHAR(100) COMMENT '위치',
	TEL VARCHAR(50) COMMENT '전화번호'
);

CREATE TABLE RESERVATION (
	THEATER_NO INT NOT NULL,
	MOVIE_NAME VARCHAR(20) NOT NULL,
	USER_NAME VARCHAR(20) NOT NULL,
	SEAT_NO INT,
	DATE DATE,
	PRICE INT
);

ALTER TABLE CUSTOMER DROP NAME;
ALTER TABLE CUSTOMER DROP ADDRESS;

ALTER TABLE CUSTOMER ADD NAME VARCHAR(20) NOT NULL;
ALTER TABLE CUSTOMER ADD ADDRESS VARCHAR(100);
ALTER TABLE CUSTOMER ADD GENDER VARCHAR(9);

ALTER TABLE ORDERS RENAME COLUMN SALESMAN_ID TO SALESMAN_NAME;

ALTER TABLE LOCATION MODIFY LOCATION_ID INT COMMENT '위치 번호';
ALTER TABLE LOCATION MODIFY ADDRESS VARCHAR(255) COMMENT '주소';
ALTER TABLE LOCATION MODIFY POSTAL_CODE VARCHAR(20) COMMENT '우편 번호';
ALTER TABLE LOCATION MODIFY CITY VARCHAR(50) COMMENT '도시명';

ALTER TABLE CURRICULUM RENAME COLUMN NO TO CURRICULUM_NO;
ALTER TABLE CURRICULUM CHANGE COLUMN NAME CURRICULUM_NAME VARCHAR(30) NOT NULL COMMENT '과목명';
ALTER TABLE CURRICULUM CHANGE COLUMN POINTS CURRICULUM_POINTS INT NOT NULL COMMENT '학점';
ALTER TABLE CURRICULUM CHANGE COLUMN PROFID CURRICULUM_PROFID INT NOT NULL COMMENT '교수 번호';

ALTER TABLE EMP MODIFY EMP_NO INT COMMENT '직원 번호';
ALTER TABLE EMP MODIFY DEPT_NO INT COMMENT '부서 번호';
ALTER TABLE EMP MODIFY EMP_NAME VARCHAR(10) COMMENT '직원 이름';
ALTER TABLE EMP MODIFY HDATE DATE COMMENT '입사일';
ALTER TABLE EMP ADD SALARY INT NOT NULL COMMENT '월급';

DROP TABLE CATEGORIES, CINEMA, CURRICULUM, CUSTOMER, DEPT, EMP, LOCATION, MENUS, ORDERS, RESERVATION;



CREATE TABLE CUSTOMER (
	CUSTOMER_NO INT PRIMARY KEY AUTO_INCREMENT COMMENT '회원 번호',
	NAME VARCHAR(20) NOT NULL COMMENT '이름',
	ADDRESS VARCHAR(100) COMMENT '주소'
);

CREATE TABLE BOOK (
	BOOK_NO INT PRIMARY KEY AUTO_INCREMENT COMMENT '도서 번호',
	TITLE VARCHAR(30) NOT NULL COMMENT '제목',
	PUBLISHER VARCHAR(100) COMMENT '출판사',
	PUB_DATE DATE COMMENT '출간일',
	PRICE INT COMMENT '가격'
);

INSERT INTO BOOK (TITLE, PUBLISHER, PUB_DATE, PRICE)
VALUES
('역사1', '상상마당', 20230101, 10000),
('역사2', '상상마당', 20230102, 20000),
('스프링웹프로젝트', '한빛미디어', 20230201, 40000),
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
('김', '지호', 'shyla@naver.com', '010-3171-4126'),
('김', '윤서', 'jeni@naver.com', '010-8121-2341'),
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

CREATE TABLE CLASS (
	CLASS_NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '수업 번호',
	CLASS_NAME VARCHAR(30) COMMENT '과목명',
	CLASS_TIME TIME COMMENT '수업시간'
);

INSERT INTO CLASS
VALUES
(1, '수학', '09:00:00'),
(2, '국어', '10:00:00'),
(3, '영어', '11:00:00');

CREATE TABLE RESERVATION (
	MOVIE_NAME VARCHAR(20) NOT NULL COMMENT '영화명',
	USER_NAME VARCHAR(20) NOT NULL COMMENT '예약자명',
	SEAT_NO VARCHAR(5) COMMENT '자리번호',
	DATE DATE COMMENT '예약일'
);

INSERT INTO RESERVATION
VALUES
('아바타', '둘리', 'A1', 20240420),
('아바타', '또치', 'A2', 20240420),
('아바타', '도우너', 'B1', 20240421),
('슬램덩크', '짱구', 'A2', 20240420),
('영웅', '고길동', 'B3', 20240421);

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

SELECT * FROM BOOK WHERE PRICE = 20000;
SELECT * FROM BOOK WHERE PRICE >= 10000 AND PRICE <= 30000;
SELECT * FROM BOOK WHERE TITLE = '역사1' OR TITLE = '역사2'
SELECT * FROM BOOK WHERE PUB_DATE < 20230130 AND PRICE = 10000;

SELECT * FROM CONTACTS WHERE CONTACTS.LAST_NAME = '이';
SELECT * FROM CONTACTS WHERE NOT LAST_NAME = '김';
SELECT * FROM CONTACTS WHERE FIRST_NAME = '윤서' OR FIRST_NAME = '수아';

SELECT * FROM CLASS WHERE CLASS_NO = 1;
SELECT * FROM CLASS WHERE CLASS_TIME >= 100000;
SELECT CLASS_NAME FROM CLASS WHERE CLASS_TIME = 090000 OR CLASS_TIME = 110000;

SELECT MOVIE_NAME, SEAT_NO FROM RESERVATION WHERE DATE = 20240421;
SELECT MOVIE_NAME FROM RESERVATION WHERE NOT MOVIE_NAME = '아바타'; 
SELECT USER_NAME FROM RESERVATION WHERE DATE = 20240420 AND SEAT_NO = 'A2';

SELECT * FROM PRODUCT WHERE PRICE < 2000;
SELECT P.CATEGORY, P.PRODUCT_NAME FROM PRODUCT P WHERE P.CATEGORY = '과자' OR P.CATEGORY = '음료';
SELECT PRODUCT_NAME, PRICE FROM PRODUCT WHERE PRICE > 4000 AND CATEGORY = '음료';

SELECT * FROM BOOK B WHERE B.PRICE BETWEEN 10000 AND 30000;
SELECT * FROM BOOK B WHERE B.PUBLISHER IN ('상상마당', '한빛미디어');

SELECT * FROM GIFT G WHERE G.PRICE BETWEEN 30000 AND 60000;
SELECT * FROM GIFT G WHERE G.TYPE IN ('식품', '생활용품');
SELECT * FROM GIFT G WHERE G.PRICE IN (10000, 30000, 40000);

SELECT R.DATE, R.MOVIE_NAME, R.USER_NAME FROM RESERVATION R WHERE R.MOVIE_NAME IN ('슬램덩크', '영웅');
SELECT * FROM RESERVATION R WHERE R.DATE = 20240420 AND R.SEAT_NO IN ('A1', 'B1');

SELECT * FROM PRODUCT P WHERE P.PRICE BETWEEN 2000 AND 3000;
SELECT P.CATEGORY, P.PRODUCT_NAME, P.PRICE FROM PRODUCT P WHERE P.CATEGORY IN ('음료', '주류') AND PRICE < 3000;

SELECT * FROM BOOK B WHERE B.TITLE LIKE '역사%' AND B.PUB_DATE = 20230101;
SELECT * FROM BOOK B WHERE B.PUBLISHER IS NOT NULL AND B.PRICE >= 20000;

SELECT * FROM CONTACTS C WHERE C.PHONE LIKE '%4126';
SELECT C.LAST_NAME, C.FIRST_NAME, C.PHONE FROM CONTACTS C WHERE C.LAST_NAME = '김' AND C.PHONE LIKE '%2341%';
SELECT * FROM CONTACTS C WHERE C.EMAIL LIKE '%naver%' AND C.PHONE IS NULL;

SELECT * FROM RESERVATION R WHERE R.SEAT_NO LIKE 'A%' AND R.MOVIE_NAME = '아바타'; 
SELECT R.MOVIE_NAME, R.USER_NAME, R.SEAT_NO FROM RESERVATION R WHERE R.SEAT_NO LIKE 'B%'; 

UPDATE BOOK SET PUBLISHER = '민음사' WHERE PRICE BETWEEN 10000 AND 30000;
UPDATE BOOK SET PUBLISHER = '없음', PRICE = 0 WHERE PUBLISHER IS NULL;

UPDATE CONTACTS SET FIRST_NAME = '지수' WHERE LAST_NAME = '이' AND PHONE LIKE '%2341%';
UPDATE CONTACTS SET FIRST_NAME = '현우', PHONE = '010-1234-5678' WHERE LAST_NAME = '최'; 

UPDATE CLASS SET CLASS_TIME = '12:30:00';
UPDATE CLASS SET CLASS_NAME = '문학' WHERE CLASS_NO = 2;

UPDATE PRODUCT SET PRICE = 5000 WHERE PRODUCT_NO IN (1,3,5);
UPDATE PRODUCT SET CATEGORY = '기타' WHERE PRODUCT_NO BETWEEN 2 AND 4;

DELETE FROM BOOK WHERE PUB_DATE = 20230101 OR PUB_DATE = 20230201; 
DELETE FROM CONTACTS WHERE EMAIL LIKE '%naver%' AND PHONE IS NULL;

DELETE FROM GIFT WHERE NAME LIKE '%세트' AND PRICE >= 20000;

DELETE FROM CLASS WHERE CLASS_TIME > 100000;

DELETE FROM RESERVATION WHERE SEAT_NO LIKE 'A%' AND MOVIE_NAME = '아바타';

DELETE FROM PRODUCT WHERE PRODUCT_NO IN (2,4,6);

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
('김', '지호', 'shyla@naver.com', '010-3171-4126'),
('김', '윤서', 'jeni@naver.com', '010-8121-2341'),
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

SELECT C.ADDRESS, COUNT(*) FROM CUSTOMER C GROUP BY C.ADDRESS;
SELECT IFNULL(C.ADDRESS,'--') AS '지역', GROUP_CONCAT(NAME) AS '회원목록' FROM CUSTOMER C GROUP BY C.ADDRESS;

SELECT IFNULL(B.PUBLISHER,'--') AS '출판사', COUNT(*) AS '개수', IFNULL(SUM(PRICE),0) AS '합계' FROM BOOK B GROUP BY PUBLISHER;
SELECT CONCAT(MONTH(PUB_DATE),'월') AS '월', COUNT(*) AS '출판된 책의 개수' FROM BOOK GROUP BY MONTH(PUB_DATE);

SELECT LAST_NAME, FIRST_NAME, CONCAT(LAST_NAME, FIRST_NAME) AS 'FULL NAME' FROM CONTACTS C;
SELECT LAST_NAME, COUNT(*) FROM CONTACTS GROUP BY LAST_NAME;

SELECT R.`DATE`, R.MOVIE_NAME, COUNT(*) FROM RESERVATION R GROUP BY DATE, MOVIE_NAME;
SELECT CONCAT(LEFT(R.SEAT_NO, 1),'열') AS '자리', GROUP_CONCAT(USER_NAME) AS '명단' FROM RESERVATION R GROUP BY LEFT(R.SEAT_NO, 1); 

SELECT P.CATEGORY AS '카테고리', MAX(P.PRICE) AS '최고가' FROM PRODUCT P GROUP BY P.CATEGORY ORDER BY MAX(P.PRICE) DESC;
SELECT P.CATEGORY AS '카테고리', GROUP_CONCAT(P.PRODUCT_NAME) AS '제품 리스트', SUM(P.PRICE) AS '합계' FROM PRODUCT P GROUP BY CATEGORY;

CREATE TABLE CINEMA (
	THEATER_NO INT COMMENT '상영관 번호',
	LOCATION VARCHAR(100) COMMENT '위치',
	TEL VARCHAR(50) COMMENT '전화번호'
);
INSERT INTO CINEMA
VALUES
(1, '송도점', '032-111-1111'),
(2, '구월점', '032-222-2222');

CREATE TABLE MOVIE (
	THEATER_NO INT COMMENT '상영관 번호',
	MOVIE_NAME VARCHAR(20) COMMENT '영화명'
);
INSERT INTO MOVIE
VALUES
(1, '슬램덩크'),
(1, '교섭'),
(2, '슬램덩크'),
(2, '아바타2'),
(2, '영웅');

SELECT C.THEATER_NO, C.LOCATION, M.MOVIE_NAME 
FROM CINEMA C
JOIN MOVIE M ON C.THEATER_NO = M.THEATER_NO;
SELECT M.THEATER_NO, M.MOVIE_NAME, R.USER_NAME 
FROM MOVIE M 
JOIN RESERVATION R ON M.MOVIE_NAME = R.MOVIE_NAME;

CREATE TABLE PURCHASE (
	PURCHASE_DATE DATE NOT NULL COMMENT '구매 일자',
	PRODUCT_NO INT NOT NULL COMMENT '상품 번호'
);
INSERT INTO PURCHASE
VALUES
('2024-01-05', 1),
('2024-01-05', 2),
('2024-01-11', 3),
('2024-01-20', 5),
('2024-01-25', 5),
('2024-02-02', 2),
('2024-02-07', 3),
('2024-02-11', 5),
('2024-02-12', 6);

SELECT P1.CATEGORY AS '카테고리', COUNT(*) AS '판매 건수'
FROM PRODUCT P1 
JOIN PURCHASE P2 ON P1.PRODUCT_NO = P2.PRODUCT_NO
GROUP BY CATEGORY; 

SELECT CONCAT(CATEGORY, ': ', COUNT(*)) AS '제일 많이 팔린 품목'
FROM PRODUCT P1 
JOIN PURCHASE P2 ON P1.PRODUCT_NO = P2.PRODUCT_NO
GROUP BY CATEGORY
ORDER BY COUNT(*) DESC
LIMIT 1; 

SELECT P1.PRODUCT_NO AS '상품 번호', P1.PRODUCT_NAME AS '상품명', GROUP_CONCAT(P2.PURCHASE_DATE) AS '판매 날짜' 
FROM PRODUCT P1
JOIN PURCHASE P2 ON P1.PRODUCT_NO = P2.PRODUCT_NO
GROUP BY P1.PRODUCT_NAME
ORDER BY P1.PRODUCT_NO;

CREATE TABLE DEPT (
	DEPT_NO INT COMMENT '부서 번호',
	DEPT_NAME VARCHAR(20) COMMENT '부서명',
	LOCATION VARCHAR(5) COMMENT '위치'
);

INSERT INTO DEPT
VALUES
(1, '인사부', '3층'),
(2, '홍보부', '1층'),
(3, '개발부', '2층'),
(NULL, '임시 부서', '2층');

CREATE TABLE EMP (
	EMP_NO INT COMMENT '직원 번호',
	EMP_NAME VARCHAR(20) COMMENT '직원명',
	EMP_RANK VARCHAR(10) COMMENT '직급',
	DEPT_NO INT COMMENT '부서 번호'
);

INSERT INTO EMP
VALUES
(1001, '둘리', '사원', 1),
(1002, '또치', '대리', 2),
(1003, '도우너', '대리', 3),
(1004, '고길동', '과장', 3),
(1005, '마이콜', '부장', NULL);

CREATE TABLE ATTENDANCE (
	EMP_NO INT NOT NULL COMMENT '사원 번호',
	ATT_DATE DATE NOT NULL COMMENT '출석 체크한 날',
	ATT_TIME TIME NOT NULL COMMENT '출석 체크한 시간'
);
INSERT INTO ATTENDANCE
VALUES
(1001, '2024-04-25', '08:50:00'),
(1002, '2024-04-25', '08:55:00'),
(1003, '2024-04-25', '09:01:00'),
(1004, '2024-04-25', '09:05:00'),
(1005, '2024-04-25', '11:20:00'),
(1001, '2024-04-26', '08:58:00'),
(1002, '2024-04-26', '08:59:00'),
(1003, '2024-04-26', '09:30:00'),
(1004, '2024-04-26', '09:03:00'),
(1005, '2024-04-26', '10:50:00');

SELECT A.ATT_DATE AS '날짜', GROUP_CONCAT(E.EMP_NAME) AS '지각자 명단' 
FROM EMP E 
JOIN ATTENDANCE A ON E.EMP_NO = A.EMP_NO
WHERE A.ATT_TIME > 091000
GROUP  BY A.ATT_DATE;

SELECT D.DEPT_NO AS '부서 번호', D.DEPT_NAME AS '부서명', COUNT(*) AS '지각 건수' 
FROM EMP E
JOIN ATTENDANCE A ON E.EMP_NO = A.EMP_NO
JOIN DEPT D ON D.DEPT_NO = E.DEPT_NO
WHERE (D.DEPT_NAME = '개발부') AND A.ATT_DATE BETWEEN 20240401 AND 20240430 AND A.ATT_TIME > 091000
GROUP BY D.DEPT_NO

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

SELECT B.BOOK_NO AS '제품번호', B.TITLE AS '제품명', IFNULL(B.PRICE,0) AS '가격'
FROM BOOK B
UNION
SELECT P.PRODUCT_NO, P.PRODUCT_NAME, P.PRICE 
FROM PRODUCT P;

TRUNCATE DEPT; 
TRUNCATE EMP;

CREATE TABLE DEPT (
	DEPT_NO INT PRIMARY KEY COMMENT '부서 번호',
	DEPT_NAME VARCHAR(20) COMMENT '부서명'
);
INSERT INTO DEPT VALUES
(1, '인사부'),
(2, '연구부'),
(3, '홍보부');

CREATE TABLE EMP (
	EMP_NO INT PRIMARY KEY COMMENT '직원 번호', -- 외래키
	EMP_NAME VARCHAR(20) COMMENT '직원명',
	DEPT_NO INT COMMENT '소속 부서',
	FOREIGN KEY (DEPT_NO) REFERENCES DEPT(DEPT_NO)
);
INSERT INTO EMP VALUES
(1001, '정소화', 1),
(1002, '김용욱', 2),
(1003, '고명석', 3);

CREATE TABLE USERS (
	ID VARCHAR(20) PRIMARY KEY COMMENT '아이디',
	PASSWORD VARCHAR(200) COMMENT '패스워드',
	NAME VARCHAR(20) COMMENT '이름'
);
INSERT INTO USERS (ID, PASSWORD, NAME)
VALUES
('USER1', '1234', '둘리'),
('USER2', '1234', '도우너');

CREATE TABLE BOARD (
	NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '글 번호',
	TITLE VARCHAR(50) COMMENT '제목',
	CONTENT VARCHAR(255) COMMENT '내용',
	WRITER VARCHAR(20) COMMENT '작성자',
	REG_DATE DATETIME COMMENT '등록일',
	UPDATE_DATE DATETIME COMMENT '수정일',
	FOREIGN KEY (WRITER) REFERENCES USERS(ID)
);

INSERT INTO BOARD (TITLE, CONTENT, WRITER, REG_DATE, UPDATE_DATE)
VALUES
('안녕하세요~', '안녕하세요~', 'USER1', NOW(), NOW()),
('안녕하세요~', '안녕하세요~', 'USER2', NOW(), NOW()),
('출석체크합니다~', '출석체크합니다~', 'USER1', NOW(), NOW()),
('출석체크합니다~', '출석체크합니다~', 'USER2', NOW(), NOW()),
('등업해주세요~', '등업해주세요~', 'USER2', NOW(), NOW());
