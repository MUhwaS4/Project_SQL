-- 현재 시간을 보는 함수
SELECT NOW();

-- 주석처리 단축키: ctrl + /
-- 커서가 있는 라인 실행: ctrl + enter
-- 여러 문장 한 번에 실행: 블록 잡고 -> Alt + x

-- 데이터 베이스의 경우 자동완성이 없음
-- eXERD처럼 데이터 베이스 구조도를 먼저 만들어서 데이터베이스를 구축할 수도 있는데 일단 당장은 없음

CREATE TABLE CUSTOMER (
	ID INT PRIMARY KEY, -- 숫자 형태로 저장되는 아이디
	NAME VARCHAR(20) NOT NULL, -- 문자 형태로 저장되는 아이디
	ADDRESS VARCHAR(100) -- 문자 형태로 저장되는 주소
);

-- CREATE TABLE 테이블이름(컬럼1,컬럼2,컬럼3);
-- 컬럼이름 자료형 [NOT NULL|NULL][PRIMARY KEY][COMMENT '설명']
-- └ [ ] 부분은 옵션, 이름과 자료형은 필수 작성 정보

-- 주문 정보를 저장하는 테이블
CREATE TABLE ORDERS (
	ORDER_NO INT PRIMARY KEY COMMENT '주문번호', -- 컬럼의 설정
	SALESMAN_ID INT COMMENT '판매자 아이디',
	ORDER_DATE DATE NOT NULL COMMENT '주문일자'
);

-- 문제 1. 아래와 같이 카테고리 정보를 저장할 CATEGORIES 테이블 생성
CREATE TABLE CATEGORIES (
	MENU_ID INT PRIMARY KEY COMMENT '메뉴 아이디',
	MENU_NAME CHAR NOT NULL COMMENT '메뉴명',
	KILOCALORIES INT NOT NULL COMMENT '칼로리',
	PRICE INT NOT NULL COMMENT '가격'
);

-- 문제 2. 아래와 같이 위치 정보를 저장할 LOCATION 테이블 생성
CREATE TABLE LOCATION (
	LOCATION_ID INT PRIMARY KEY,
	ADDRESS VARCHAR(255) NOT NULL,
	POSTAL_CODE VARCHAR(20),
	CITY VARCHAR(50)
);

-- 문제 3. 아래와 같이 식단 정보를 저장할 MENUS 테이블 생성
CREATE TABLE MENUS (
	MENU_ID INT PRIMARY KEY COMMENT '메뉴 아이디',
	MENU_NAME CHAR NOT NULL COMMENT '메뉴명',
	KILOCALORIES INT NOT NULL COMMENT '칼로리',
	PRICE INT NOT NULL COMMENT '가격'
);

-- 문제 4. 아래와 같이 수업 정보를 저장할 CURRICULUM 테이블 생성 
CREATE TABLE CURRICULUM (
    NO INT PRIMARY KEY COMMENT '과목 번호',
    NAME VARCHAR(30) COMMENT '과목명',
    POINTS INT COMMENT '학점',
    PROFID INT COMMENT '교수 번호'
);

-- 문제 5. 아래와 같이 부서 정보를 저장할 DEPT 테이블 생성
CREATE TABLE DEPT (
	DEPT_NO INT PRIMARY KEY COMMENT '부서 번호',
	DEPT_NAME VARCHAR(20) COMMENT '부서명',
	DEPT_LOC VARCHAR(20) COMMENT '부서 위치'
);

-- 문제 6. 아래와 같이 직원 정보를 저장할 EMP 테이블 생성
CREATE TABLE EMP (
	EMP_NO INT PRIMARY KEY,
	DEPT_NO INT,
	EMP_NAME VARCHAR(10),
	HDATE DATE
);

-- 문제 7. 아래와 같이 극장 정보를 저장할 CINEMA 테이블 생성
CREATE TABLE CINEMA (
	THEATER_NO INT PRIMARY KEY COMMENT '상영관 번호',
	LOCATION VARCHAR(100) COMMENT '위치',
	TEL VARCHAR(50) COMMENT '전화번호'
);

-- 문제 8. 아래와 같이 예약 정보를 저장할 RESERVATION 테이블 생성
CREATE TABLE RESERVATION (
	THEATER_NO INT NOT NULL,
	MOVIE_NAME VARCHAR(20) NOT NULL,
	USER_NAME VARCHAR(20) NOT NULL,
	SEAT_NO INT,
	DATE DATE,
	PRICE INT
);