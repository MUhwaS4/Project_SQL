-- UPDATE문으로 테이블에서 데이터 변경하기

-- 모든 회원의 이름을 도우너로 변경하기
UPDATE CUSTOMER SET NAME = '도우너';

-- 모든 회원의 이름을 둘리, 주소를 서울로 변경하기
UPDATE CUSTOMER SET NAME ='둘리', ADDRESS = '서울';

-- 회원 번호가 1인 회원의 주소를 제주도로 변경하기
UPDATE CUSTOMER SET ADDRESS = '제주도' WHERE CUSTOMER_NO = 1;


-- 문제 1. BOOK 테이블에서 가격이 10000 이상 30000 사이인 도서의 출판사를 민음사로 변경
UPDATE BOOK SET PUBLISHER = '민음사'
WHERE PRICE BETWEEN 10000 AND 30000; 

-- 문제 2. BOOK 테이블에서 출판일이 없는 도서는 출판사 없음, 가격은 0원으로 변경
UPDATE BOOK SET PUBLISHER = '없음', PRICE = 0
WHERE PUB_DATE IS NULL;

-- 문제 3. CONTACTS 테이블에서 이씨 성을 가지고 전화번호에 2341이 포함된 사람의 이름을 지수로 변경
UPDATE CONTACTS SET FIRST_NAME = '지수'
WHERE LAST_NAME = '이' AND PHONE LIKE '%2341%';

-- 문제 4. CONTACTS 테이블에서 최씨 성을 가지고 있는 사람의 이름은 현우, 전화번호는 010-1234-5678로 변경
UPDATE CONTACTS SET FIRST_NAME = '현우', PHONE = '010-1234-5678'
WHERE LAST_NAME = '최'; 

-- 문제 5. CLASS 테이블에서 모든 과목의 수업 시간을 12시 30분으로 변경
UPDATE CLASS SET CLASS_TIME = '12:30:00';

-- 문제 6. CLASS 테이블에서 수업 번호가 2인 과목의 이름을 문학으로 변경
UPDATE CLASS SET CLASS_NAME = '문학'
WHERE CLASS_NO = 2;

-- 문제 7. PRODUCT 테이블에서 상품 번호가 1, 2, 5인 상품의 가격을 5000원으로 변경
UPDATE PRODUCT SET PRICE = 5000
WHERE PRODUCT_NO IN(1, 2, 5);

-- 문제 8. PRODUCT 테이블에서 상품 번호가 2, 4 사이인 상품의 카테고리를 기타로 변경
UPDATE PRODUCT SET CATEGORY = '기타'
WHERE PRODUCT_NO IN(2, 4);