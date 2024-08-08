-- 제주도에 사는 회원 정보 삭제
DELETE FROM CUSTOMER 
WHERE ADDRESS = '제주도';

-- 모든 회원 정보 삭제
DELETE FROM CUSTOMER;

-- 회원 테이블에 다시 새로운 회원 추가
INSERT INTO CUSTOMER (NAME, ADDRESS) 
VALUES ('둘리', '서울');

-- 기존 회원 정보는 모두 삭제했지만, PRIMARY KEY 속성을 사용해서
-- 테이블을 삭제하기 전까진 CUSTOMER_NO이 마지막으로 사용된 숫자가 기억됨

-- 회원 테이블의 모든 테이터 삭제하고 회원번호 리셋하기(초기화)
TRUNCATE CUSTOMER; 

-- 이후 다시 회원을 추가하면 CUSTOMER_NO가 1부터 시작됨


-- 문제 1. BOOK 도서 테이블에서 출판일이 1월 1일 또는 2월 1일인 책을 삭제.
DELETE FROM BOOK
WHERE PUB_DATE IN('2023-01-01', '2023-02-01');

-- 문제 2. CONTACTS 연락처 테이블에서 네이버 이메일 사용하면서 연락처 없는 사람 삭제.
DELETE FROM CONTACTS
WHERE EMAIL LIKE '%naver%' AND PHONE IS NULL;

-- 문제 3. GIFT 선물 테이블에서 이름이 세트로 끝나면서 20000원 이하인 선물 삭제.
DELETE FROM GIFT
WHERE NAME LIKE '%세트' AND PRICE <= 20000;

-- 문제 4. CLASS 수업 테이블에서 10시 이후에 수업을 하는 과목 삭제.
DELETE FROM CLASS
WHERE CLASS_TIME > '10:00:00';

-- 문제 5. RESERVATION 영화 예매 테이블에서 A열에서 아바타를 봤던 예매정보를 삭제하세요.
DELETE FROM RESERVATION
WHERE MOVIE_NAME = '아바타' AND SEAT_NO LIKE 'A%';

-- 문제 6. PRODUCT 상품 테이블에서 상품 번호가 2, 4, 6인 상품 삭제.
DELETE FROM PRODUCT 
WHERE PRODUCT_NO IN(2, 4, 6);