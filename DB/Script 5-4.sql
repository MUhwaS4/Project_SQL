-- 테스트 테이블 생성
CREATE TABLE TEST_TBL (
	NO INT PRIMARY KEY COMMENT '번호',
	CONTENT VARCHAR(100) NOT NULL COMMENT '내용'
);

-- 오토쿼리 설정 확인
SELECT @@autocommit;

-- 1: TRUE | 0: FALSE
-- MariaDB는 기본적으로 autocommit이 설정되어 있음

-- 오토커밋 off
SET autocommit = 1;

INSERT TEST_TBL VALUES (1, '1번');
COMMIT; -- 작업 결과를 실제로 반영

-- 트랜잭션 수동으로 시작

START TRANSACTION;
INSERT TEST_TBL VALUES (2, '2번');
SELECT * FROM TEST_TBL; -- 실제 테이블에는 반영 안 됨
COMMIT; -- 실제 테이블에 반영
-- COMMIT 또는 ROLLBACK 하는 순간 트랙잭션 종료

-- 트랜잭션 다시 시작

START TRANSACTION;
INSERT TEST_TBL VALUES (3, '3번');
UPDATE TEST_TBL SET CONTENT = '수정' WHERE NO = '2';
SELECT * FROM TEST_TBL;
ROLLBACK; -- 트랜잭션 취소 (반영X)