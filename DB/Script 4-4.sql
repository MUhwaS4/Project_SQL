-- 기본키 추가하기
CREATE TABLE PERSON ( 
	LAST_NAME VARCHAR(5),
	FIRST_NAME VARCHAR(5),
	NICKNAME VARCHAR(10),
	PRIMARY KEY (LAST_NAME)
);

-- 기본키 삭제하기
ALTER TABLE PERSON DROP PRIMARY KEY;

-- 다시 기본키 추가하기
ALTER TABLE PERSON ADD PRIMARY KEY (LAST_NAME);

-- 기본키의 제약사항
-- 1. NULL을 입력할 수 없음
-- 2. 중복된 값을 입력할 수 없음

INSERT INTO PERSON
VALUES
('신', '짱구', '아들'),
('신', '짱아', '딸');

-- 복합키 추가하기
CREATE TABLE PERSON (
	LAST_NAME VARCHAR(5),
	FIRST_NAME VARCHAR(5),
	NICKNAME VARCHAR(10),
	PRIMARY KEY (LAST_NAME,FIRST_NAME)
);

-- 같은 성을 가지더라도, 조합이 다르기 때문에 중복이 안 됨
INSERT INTO PERSON
VALUES
('신', '짱구', '아들'),
('신', '짱아', '딸');

DROP TABLE DEPT;
DORP TABLE EMP;

-- 테이블 생성 순서: 부모 > 자식

CREATE TABLE DEPT (
	DEPT_NO INT PRIMARY KEY COMMENT '부서 번호',
	DEPT_NAME VARCHAR(20) COMMENT '부서명'
);

CREATE TABLE EMP (
	EMP_NO INT PRIMARY KEY COMMENT '직원 번호', -- 외래키
	EMP_NAME VARCHAR(20) COMMENT '직원명',
	DEPT_NO INT COMMENT '소속 부서',
	FOREIGN KEY (DEPT_NO) REFERENCES DEPT(DEPT_NO)
);

-- 외래키 삭제하기
ALTER TABLE EMP DROP FOREIGN KEY emp_ibfk_1;

-- 외래키 다시 추가
ALTER TABLE EMP
ADD FOREIGN KEY (DEPT_NO) REFERENCES DEPT(DEPO_NO);


-- 부서 테이블 데이터 추가
INSERT INTO DEPT VALUES
(1, '인사부'),
(1, '연구사부'),
(1, '홍보부');

-- 사원 테이블 데이터 추가
INSERT INTO EMP BALUES
(1001, '정소화', 1),
(1002, '김용욱', 2),
(1003, '고명석', 3),

-- 부모 테이블에 없는 4번은 사용할 수 없음
INSERT INTO EMP VALUES (1004, '김연아', 4;)

-- 부서 번호가 1번인 사원을 먼저 삭제해야 함
DELETE FROM EMP
WHERE DEPT_NO = 1;

DELETE FROM DEPT
WHERE DEPT_NO = 1;

-- 테이블 삭제: 자식 > 부모 순서

-- 문제 1. 아래와 같이 USERS 사용자 테이블을 만들고 데이터를 추가하기.
CREATE TABLE USERS (
	ID VARCHAR(20) PRIMARY KEY COMMENT '아이디',
	PASSWORD VARCHAR(200) COMMENT '패스워드',
	NAME VARCHAR(20) COMMENT '이름'
);
INSERT INTO USERS (ID, PASSWORD, NAME)
VALUES
(CONCAT('USER', 1), '1234', '둘리');
INSERT INTO USERS
VALUES
(CONCAT('USER', 2), '1234', '도우너');

-- 문제 2. 아래와 같이 BOARD 게시물 테이블을 만들고 데이터를 추가하기.
CREATE TABLE BOARD (
	NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '글 번호',
	TITLE VARCHAR(50) COMMENT '제목',
	CONTENT VARCHAR(255) COMMENT '내용',
	WRITER VARCHAR(20) COMMENT '작성자',
	REG_DATE DATETIME COMMENT '등록일',
	UPDATE_DATE DATETIME COMMENT '수정일',
	FOREIGN KEY (WRITER) REFERENCES USERS(ID)
);

DESC BOARD;

-- 서버 시간을 가져오는 명령어
SELECT SYSDATE(), NOW();

INSERT INTO BOARD (TITLE, CONTENT, WRITER, REG_DATE, UPDATE_DATE)
VALUES
('안녕하세요~', '안녕하세요~', 'USER1', NOW(), NOW()),
('안녕하세요~', '안녕하세요~', 'USER2', NOW(), NOW()),
('출석체크합니다~', '출석체크합니다~', 'USER1', NOW(), NOW()),
('출석체크합니다~', '출석체크합니다~', 'USER2', NOW(), NOW()),
('등업해주세요~', '등업해주세요~', 'USER2', NOW(), NOW());

-- 문제 3. USERS와 BOARD을 이용하여 회원별로 작성한 게시물 목록 출력하기.
SELECT U.ID AS '아이디', U.NAME AS '이름', B.TITLE AS '제목'
FROM USERS U
JOIN BOARD B
ON U.ID = B.WRITER;

-- 문제 4. 회원별로 작성한 게시물 목록을 구하기.
SELECT U.ID AS '아이디', U.NAME AS '이름', COUNT(*) AS '게시물 건수' 
FROM USERS U
JOIN BOARD B
ON U.ID = B.WRITER
GROUP BY WRITER;

-- 문제 5. 아래와 같이 CLASS 테이블을 만들고 데이터를 추가하기.
CREATE TABLE CLASS (
	CLASS_NO INT PRIMARY KEY COMMENT '수업 번호',
	CLASS_NAME VARCHAR(20) COMMENT '수업명'
);
INSERT INTO CLASS
VALUES
(1, '수학'),
(2, '국어'),
(3, '영어');

-- 문제 6. 아래와 같이 STUDENT 테이블을 만들고 데이터를 추가하기.
CREATE TABLE STUDENT (
	STUDENT_NO INT PRIMARY KEY COMMENT '학생 번호',
	STUDENT_NAME VARCHAR(20) COMMENT '학생명'
);
INSERT INTO STUDENT
VALUES
(1001, '둘리'),
(1002, '또치'),
(1003, '도우너');

-- 문제 7. 아래와 같이 STUDENT_CLASS 테이블을 만들고 데이터를 추가하기.
CREATE TABLE STUDENT_CLASS (
	ST_NO INT COMMENT '학생 번호',
	CL_NO INT COMMENT '수강하는 수업의 번호',
	FOREIGN KEY (ST_NO) REFERENCES STUDENT(STUDENT_NO),
	FOREIGN KEY (CL_NO) REFERENCES CLASS(CLASS_NO)
);
INSERT INTO STUDENT_CLASS
VALUES
(1001, 1),
(1001, 2),
(1002, 2),
(1002, 3),
(1003, 1),
(1003, 2),
(1003, 3);

-- 문제 8. 과목별 수강생 목록 구하기.
SELECT SC.CL_NO, C.CLASS_NAME, GROUP_CONCAT(S.STUDENT_NAME) 
FROM STUDENT_CLASS SC
JOIN CLASS C ON SC.CL_NO = C.CLASS_NO 
JOIN STUDENT S ON SC.ST_NO = S.STUDENT_NO
GROUP BY SC.CL_NO, C.CLASS_NAME;

-- 문제 9. 제일 수강생이 많은 수업 찾기.
SELECT SC.CL_NO, C.CLASS_NAME, COUNT(*) 
FROM STUDENT_CLASS SC
JOIN CLASS C ON SC.CL_NO = C.CLASS_NO 
JOIN STUDENT S ON SC.ST_NO = S.STUDENT_NO
GROUP BY SC.CL_NO, C.CLASS_NAME
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 외래키의 관계차수
-- 1:1 or 1:n

-- STUDENT_CLASS의 외래키가 1:n 설정
-- 학생은 여러 개의 과목을 수강할 수 있음



-- 문제 1, 2, 5, 6 다시 풀기

-- 외래키를 사용하는 이유: 데이터의 정합성을 지키기 위해
-- 논리적으로 잘못된 데이터가 테이블에 들어오는 것을 막기 위해서
-- 정합성 整合性 | 공리적인 논리 체계에서 우선 필요로 하는 요건으로, 공리계에 논리적 모순이 없는 것.

DROP TABLE USERS;
DROP TABLE BOARD;

-- 문제 1. 아래와 같이 USERS(사용자)와 BOARD(게시물) 테이블 생성.

CREATE TABLE USERS (
	ID VARCHAR(20) PRIMARY KEY COMMENT '아이디',
	PASSWORD VARCHAR(200) COMMENT '패스워드',
	NAME VARCHAR(20) COMMENT '이름'
);

CREATE TABLE BOARD (
	NO INT AUTO_INCREMENT PRIMARY KEY COMMENT '글 번호',
	TITLE VARCHAR(50) COMMENT '제목',
	CONTENT VARCHAR(255) COMMENT '내용',
	WRITER VARCHAR(20) COMMENT '작성자',
	REG_DATE DATETIME COMMENT '등록일',
	UPDATE_DATE DATETIME COMMENT '수정일',
	FOREIGN KEY (WRITER) REFERENCES USERS(ID) 
);

-- 문제 2. 두 테이블에 데이터 입력.

INSERT INTO USERS 
VALUES
('USER1', '1234', '둘리');
INSERT INTO USERS 
VALUES
('USER2', '1234', '또치');
INSERT INTO USERS 
VALUES
('ADMIN', '1234', '도우너');

INSERT INTO BOARD (TITLE, CONTENT, WRITER, REG_DATE, UPDATE_DATE)
VALUES
('제목1!', '내용입니다1.', 'USER1', NOW(), NOW()),
('제목2!', '내용입니다2.', 'USER2', NOW(), NOW()),
('제목3!', '내용입니다3.', 'USER1', NOW(), NOW()),
('제목4!', '내용입니다4.', 'USER2', NOW(), NOW()),
('제목5!', '내용입니다5.', 'USER2', NOW(), NOW());

INSERT INTO BOARD (TITLE, CONTENT, WRITER, REG_DATE, UPDATE_DATE)
VALUES
('제목6!', '내용입니다6.', 'ADMIN', NOW(), NOW());

-- 이해를 돕기 위한 예시 EX)
-- Q. 네이버 카페에 글 쓰기
-- 1) 회원가입 (USERS 데이터 INSERT)
-- 2) 로그인
-- 3) 게시글 작성 (BOARD 데이터 INSERT)
-- USERS의 ID를 확인해서 작성자 컬럼 확인, 회원인 사람만 게시글 작성 가능

-- 외래키로 설정된 WRITER에 부모에게 없는 사용자를 작성자로 입력하면 오류!
-- 카페의 회원이 아닌 사람은 게시물을 작성할 수 없으니까!


-- 문제 5. 아래와 같이 CLASS(수업), STUDENT(학생), STUDENT_CLASS(수강) 테이블 생성.

DROP TABLE CLASS;
DROP TABLE STUDENT;
DROP TABLE STUDENT_CLASS;

CREATE TABLE CLASS (
	CLASS_NO INT PRIMARY KEY COMMENT '수업 번호',
	CLASS_NAME VARCHAR(20) COMMENT '수업명'
);

CREATE TABLE STUDENT (
	STUDENT_NO INT PRIMARY KEY COMMENT '학생 번호',
	STUDENT_NAME VARCHAR(20) COMMENT '학생명'
);

CREATE TABLE STUDENT_CLASS (
	ST_NO INT COMMENT '학생 번호',
	CL_NO INT COMMENT '수강하는 수업의 번호',
	FOREIGN KEY (ST_NO) REFERENCES STUDENT(STUDENT_NO),
	FOREIGN KEY (CL_NO) REFERENCES CLASS(CLASS_NO)
);

-- 문제 6. 세 테이블에 데이터 입력.

INSERT INTO CLASS
VALUES
(1, '국어'),
(2, '영어'),
(3, '수학');

INSERT INTO STUDENT
VALUES 
(1001, '짱구'),
(1002, '짱아'),
(1003, '흰둥이');

INSERT INTO STUDENT_CLASS 
VALUES 
(1001, 1),
(1001, 2),
(1002, 2),
(1002, 3),
(1003, 1),
(1003, 2),
(1003, 3);

-- 이해를 돕기 위한 예시 EX)
-- Q. 학교에서 수업 듣기
-- 1) 학교에서 열린 수업 (CLASS 데이터 INSERT)
-- 3) 학교에 입학한 학생 (STUDENT 데이터 INSERT)
-- CLASS 테이블의 CLASS_NO를 확인해서 학생인 사람만 수업 수강 가능

-- 외래키로 설정된 ST_NO에 부모에게 없는 학생을 입력하면 오류!
-- 학교의 학생이 아닌 사람이 수업을 수강할 순 없으니까!