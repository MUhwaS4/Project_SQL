CREATE TABLE BOARD (
	BOARD_NO INT AUTO_INCREMENT PRIMARY KEY,
	TITLE VARCHAR(200) NOT NULL,
	CONMENT VARCHAR(200)
);

SELECT COUNT(*) FROM BOARD B;

-- PK는 기본적으로 인덱스가 설정되어 있음
-- 일반 컬럼의 경우 기본적으로 인덱스 설정 X (직접 생성해줘야 함)

-- 인덱스는 데이터 수량이 많을 때 의미 있음

-- PK인 게시물 번호로 검색
SELECT *
FROM BOARD B
WHERE BOARD_NO = 1;

-- 제목으로 검색
SELECT * FROM BOARD WHERE TITLE = 'Bus stop';

-- 제목으로 인덱스 생성
CREATE INDEX INDEX_TITLE ON BOARD(TITLE); -- 이름 / 컬럼

-- 테이블에 걸려있는 인덱스 확인
SHOW INDEX FROM BOARD;

-- 쿼리가 어떤 인덱스를 쓰는지 확인
EXPLAIN
SELECT * FROM BOARD B WHERE TITLE = 'Bus stop';

-- 인덱스의 장점: 조회 속도 상향, 
-- 인덱스의 단점: 추가, 수정 속도 하향

-- 조회가 자주 일어나는 테이블에 사용할 것
-- 반대로, 추가가 자주 일어나는 테이블에는 사용하지 말 것

-- 인덱스 삭제
DROP INDEX INDEX_TITLE ON BOARD;
