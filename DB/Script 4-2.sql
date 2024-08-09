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

-- 사원의 모든 정보를 가져오기
SELECT *
FROM EMP -- (1)
JOIN DEPT -- (2)
ON EMP.DEPT_NO = DEPT.DEPT_NO;
-- 부서 번호를 기준으로 두 테이블 연결

-- JOIN: 양 테이블이 공통으로 가진 정보를 기준으로 연결함
-- 공란으로 비어있는 임시부서를 제외하고 1, 2, 3을 매칭

-- 보고 싶은 컬럼만 선택하여 가져오기
SELECT EMP.EMP_NO, EMP.EMP_NAME, EMP.DEPT_NO, DEPT.DEPT_NAME 
-- SELECT EMP_NO, DEPT_NO
-- ㄴ 에러 사유: JOIN한 두 테이블에 모두 DEPT_NO이 있기 때문에 어떤 테이블의 정보인지 명확하게 기재해야 함
FROM EMP
JOIN DEPT
ON EMP.DEPT_NO = DEPT.DEPT_NO;

-- 컬럼명이 너무 길 경우 별칭 사용
-- 별칭은 함수 내부에서만 사용 가능
-- 별칭을 선언하면 모든 컬럼명을 별칭으로 변명 (아닐 시 오류)
SELECT T1.EMP_NO, T2.DEPT_NO
FROM EMP T1
JOIN DEPT T2
ON T1.DEPT_NO = T1.DEPT_NO;

-- 사원과 부서 테이블을 공통 컬럼 없이 그냥 조인하기
SELECT *
FROM EMP, DEPT;
-- 테이블1의 ROW * 테이블2의 ROW만큼 가져온다
-- (테이블1=4)*(테이블2=5) = 20행

-- 부서가 없는 사원을 포함하여 사원 정보 가져오기
-- 왼쪽 테이블은 조건없이 모두 내려보내고, 오른쪽 테이블에 일치하는 행이 없으면 NULL 반환
SELECT * FROM EMP
LEFT JOIN DEPT
ON EMP.DEPT_NO = DEPT.DEPT_NO;

-- 부서 번호가 없는 부서를 포함하여 부서 정보 가져오기
-- 오른쪽 테이블은 조건없이 모두 내려보내고, 왼쪽 테이블에 일치하는 행이 없으면 NULL 반환
SELECT * FROM EMP
RIGHT JOIN DEPT
ON EMP.DEPT_NO = DEPT.DEPT_NO;

-- 테이블 정규화
-- 특정 데이터만 보관하도록 테이블을 쪼개는 것
-- 장점: 중복된 데이터는 허용하지 않음으로써 DB의 용량을 줄일 수 있음
-- 단점: 데이터를 한 번에 조회할 때, JOIN이 필요함

-- 테이블 반정규화
-- 내용이 중복되더라도 테이블을 하나로 만드는 것
-- 장점: 조회가 편함
-- 단점: DB의 용량이 늘어남

CREATE TABLE TEMP (
	THEATER_NO INT COMMENT '상영관 번호',
	LOCATION VARCHAR(100) COMMENT '위치',
	TEL VARCHAR(50) COMMENT '전화번호',
	MOVIE_NAME VARCHAR(20) COMMENT '영화명'
);

INSERT INTO TEMP
VALUES
(1, '송도점', '032-111-1111', '슬램덩크'), -- 상영관의 정보가 중복됨
(1, '송도점', '032-111-1111', '교섭'),
(2, '구월점', '032-222-2222', '슬램덩크'),
(2, '구월점', '032-222-2222', '아바타2'),
(2, '구월점', '032-222-2222', '영웅');

-- 문제 1. 상영관 정보를 저장할 CINEMA 테이블 생성, 데이터 추가.
CREATE TABLE CINEMA (
	THEATER_NO INT COMMENT '상영관 번호',
	LOCATION VARCHAR(100) COMMENT '위치',
	TEL VARCHAR(50) COMMENT '전화번호'
);
INSERT INTO CINEMA
VALUES
(1, '송도점', '032-111-1111'),
(2, '구월점', '032-222-2222');

-- 문제 2. 영화 정보를 저장할 MOIVE 테이블 생성, 데이터 추가.
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

-- 문제 3. CINEMA와 MOVIE를 이용하여 지점별로 상영하는 영화 제목을 가져오기.
SELECT CINEMA.THEATER_NO, CINEMA.LOCATION, MOVIE.MOVIE_NAME
FROM CINEMA
JOIN MOVIE
ON CINEMA.THEATER_NO = MOVIE.THEATER_NO;

-- 문제 4. MOVIE와 RESERVATION 테이블을 이용하여 지점별로 영화 예매 정보를 가져오기.
SELECT MOVIE.THEATER_NO, MOVIE.MOVIE_NAME, RESERVATION.USER_NAME 
FROM MOVIE
JOIN RESERVATION
ON MOVIE.MOVIE_NAME = RESERVATION.MOVIE_NAME;


-- 문제 5. 상품 구매 정보를 저장할 PURCHASE 테이블 생성, 데이터 추가.
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

-- 문제 6. PRODUCT와 PURCHASE를 이용하여 카테고리별 판매 개수를 구하고, 제일 많이 팔린 품목 찾기.
SELECT CATEGORY, COUNT(*) 
FROM PRODUCT
JOIN PURCHASE
ON PRODUCT.PRODUCT_NO = PURCHASE.PRODUCT_NO
GROUP BY CATEGORY;

SELECT CONCAT(CATEGORY, ': ', COUNT(*)) AS '제일 많이 팔린 품목' 
FROM PRODUCT
JOIN PURCHASE
ON PRODUCT.PRODUCT_NO = PURCHASE.PRODUCT_NO
GROUP BY CATEGORY
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 문제 7. 상품이 판매된 날짜를 나열하기.
SELECT PRODUCT.PRODUCT_NO, PRODUCT.PRODUCT_NAME, GROUP_CONCAT(PURCHASE.PURCHASE_DATE)
FROM PRODUCT
JOIN PURCHASE
ON PRODUCT.PRODUCT_NO = PURCHASE.PRODUCT_NO
GROUP BY PRODUCT.PRODUCT_NAME
ORDER BY PRODUCT_NO;


-- 문제 8. 사원들의 출석 정보를 저장할 ATTENDANCE 테이블 생성, 데이터 추가.
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

-- 문제 9. EMP와 ATTENDANCE를 이용하여 날짜별 지각자 명단을 구하기. 9시 10분 이후는 지각.
SELECT A.ATT_DATE AS '날짜', GROUP_CONCAT(E.EMP_NAME) AS '지각자 명단'
FROM EMP E
JOIN ATTENDANCE A
ON E.EMP_NO = A.EMP_NO
WHERE A.ATT_TIME > '09:10:00'
GROUP BY A.ATT_DATE;

-- 문제 10. 여러 테이블을 이용하여 개발 부서의 4월 지각 건수를 구하기.
SELECT D.DEPT_NO AS '부서 번호', D.DEPT_NAME AS '부서명', COUNT(*) AS '지각 건수' 
FROM EMP E
JOIN DEPT D ON E.DEPT_NO = D.DEPT_NO
JOIN ATTENDANCE A ON E.EMP_NO = A.EMP_NO
WHERE A.ATT_TIME > '09:10:00' AND D.DEPT_NAME = '개발부' AND MONTH(A.ATT_DATE) = 4
GROUP BY A.ATT_DATE;

-- SELECT > FROM > JOIN + ON > WHERE > GROUP BY > ORDER BY
-- ON: JOIN 종속, TABLE을 연결하는 고리
-- WHERE: 필터링 조건