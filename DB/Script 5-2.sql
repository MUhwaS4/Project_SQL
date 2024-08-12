-- 직원 테이블에서 부서가 "인사부"인 직원 조회
CREATE VIEW emp_view1 AS
SELECT EMP_NO, EMP_NAME, DEPT_NO
FROM EMP
WHERE DEPT_NO = 1;

-- SELECT EMP_NO, EMP_NAME, DEPT_NO
-- FROM EMP
-- WHERE DEPT_NO = 1;

-- 진짜 테이블에 데이터를 추가하면, 뷰도 변경됨
INSERT INTO EMP VALUES
(1011, '둘리', 1, '인천 연수구 송도동', 330, 20240801);

-- 가상 테이블은 데이터가 반영되기 때문에, SELECT 조회를 다시할 필요가 없다.

-- 뷰 조회
SELECT * FROM EMP_VIEW1 EV ;

-- 데이터 수정하기
-- 일반 테이블처럼 데이터 수정, 삭제 가능. 원본 데이터에도 영향 있음

UPDATE EMP_VIEW1
SET DEPT_NO = 3
WHERE EMP_NO = 1011;

-- 뷰 수정하기 (부서를 '홍보부'로 변경)
ALTER VIEW EMP_VIEW1 AS
SELECT EMP_NO, EMP_NAME, DEPT_NO
FROM EMP
WHERE DEPT_NO = 3;

-- 뷰 삭제
DROP VIEW EMP_VIEW1 ;


-- 문제 1. 부서와 직원테이블을 이용하여 인사부 소속의 직원을 조회하는 뷰를 생성.
CREATE VIEW EMP_VIEW2 AS
SELECT E.EMP_NO, E.EMP_NAME, D.DEPT_NAME
FROM EMP E
JOIN DEPT D ON D.DEPT_NO = E.DEPT_NO
WHERE D.DEPT_NAME = '인사부';

-- 문제 2. 부서와 직원테이블을 이용하여 부서별 직원을 조회하는 뷰를 생성.
-- 컬럼 이름은 다음과 같이 변경.
CREATE VIEW EMP_VIEW3 AS
SELECT D.DEPT_NO AS '부서번호', D.DEPT_NAME AS'부서명', GROUP_CONCAT(E.EMP_NAME) AS '사원리스트', COUNT(*) AS '인원'
FROM EMP E
JOIN DEPT D ON D.DEPT_NO = E.DEPT_NO 
GROUP BY D.DEPT_NO;

-- 문제 3. 부서별로 부서명, 최소급여, 최대급여, 평균급여를 조회하는 뷰를 생성.
-- 평균급여의 소수점 아래자리에서 반올림.
CREATE VIEW EMP_VIEW4 AS
SELECT D.DEPT_NAME AS '부서명', MIN(E.SALARY) AS '최소급여', MAX(E.SALARY) AS '최대급여', ROUND(AVG(E.SALARY)) AS '평균급여'
FROM DEPT D
JOIN EMP E ON E.DEPT_NO = D.DEPT_NO
GROUP BY D.DEPT_NO;

-- 문제 4. 김씨 성을 가진 사람 중 급여가 많은 사람부터 1위~3위까지 출력.
CREATE VIEW EMP_VIEW5 AS
SELECT E.EMP_NO, E.EMP_NAME, E.SALARY 
FROM EMP E
WHERE E.EMP_NAME LIKE '김%'
ORDER BY E.SALARY DESC
LIMIT 3;

-- 문제 5. 김씨 성을 가진 월급이 400인 사원을 EMP 테이블에 추가,
-- 뷰를 조회하여 데이터 변경 여부 확인.
INSERT INTO EMP
VALUES
(1012, '김철수', 1, '서울 연수구 떡잎마을', 400, 20240810);

INSERT INTO EMP
VALUES
(1013, '오맹구', 1, '서울 연수구 떡잎마을', 500, 20240811);