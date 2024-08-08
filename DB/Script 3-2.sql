-- 회원 테이블에서 모든 데이터를 가져오기
-- *는 테이블의 모든 컬럼을 의미
SELECT * FROM CUSTOMER;

SELECT
	*
FROM 
	CUSTOMER
WHERE
	CUSTOMER_NO = 1;

-- 회원 테이블에서 회원 번호와 이름만 가져오기
SELECT CUSTOMER_NO, NAME FROM CUSTOMER;

-- 비교 연산자
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO = 1;
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO != 1;
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO < 3;
SELECT * FROM CUSTOMER WHERE CUSTOMER_NO <= 3;

-- 정렬: 쿼리 드래그한 후에 CTRL + SHIFT + F

-- 논리 연산자
-- 서울에 사는 둘리 회원 데이터 가져오기
SELECT * FROM CUSTOMER
WHERE NAME = '둘리' AND ADDRESS = '서울'; -- 곱

-- 인천 또는 서울에 사는 회원 데이터 가져오기
SELECT * FROM CUSTOMER
WHERE ADDRESS = '인천' OR ADDRESS = '서울'; -- 합

-- 주소가 서울이 아닌 회원 데이터를 가져오기
SELECT * FROM CUSTOMER
WHERE NOT ADDRESS = '서울'; -- 조건을 만족하지 못하는 데이터 추출(빈값 제외)


-- 문제 1. BOOK 도서 테이블에서 다음의 조건으로 책 검색.

-- 조건: 가격 = 20000원
SELECT * FROM BOOK
WHERE PRICE = 20000;

-- 조건: 10000원 ≤ 가격 ≤ 30000원
SELECT * FROM BOOK
WHERE PRICE >= 10000 AND PRICE <= 30000;

-- 조건: 제목 = 역사1 or 역사2
SELECT * FROM BOOK
WHERE TITLE = '역사1' OR TITLE = '역사2';

-- 조건: 출판일 = 1월 30일 이전 + 가격 = 10000원
SELECT * FROM BOOK
WHERE PUB_DATE < '2023-01-30' AND PRICE = 10000;
-- 날짜는 20230130로도 표현 가능 (하이픈이 없을 경우 따옴표 X 하이픈이 있을 경우 따옴표 O)


-- 문제 2. CONTACTS 도서 테이블에서 다음의 조건으로 사람 검색.

-- 조건: 이씨 성을 가진 사람
SELECT * FROM CONTACTS
WHERE LAST_NAME = '이';

-- 조건: 김씨 성이 아닌 사람
SELECT * FROM CONTACTS
WHERE NOT LAST_NAME = '김';

-- 조건: 이름 = 윤서 or 수아
SELECT * FROM CONTACTS
WHERE FIRST_NAME = '윤서' OR FIRST_NAME = '수아';


-- 문제 3. CLASS 수업 테이블에서 다음의 조건으로 과목 검색.

-- 조건: 수업번호 = 1번
SELECT * FROM CLASS
WHERE CLASS_NO = 1;

-- 조건: 10시 이후에 수업을 하는 과목
SELECT * FROM CLASS
WHERE CLASS_TIME >= '10:00:00';

-- 조건: 9시 혹은 11시에 수업을 하는 과목
SELECT CLASS_NAME FROM CLASS
WHERE CLASS_TIME = '09:00:00' OR CLASS_TIME = '11:00:00';


-- 문제 4. RESERVATION 영화 테이블에서 다음의 조건으로 예약 검색.

-- 조건: 예약일 = 4월 21일
SELECT MOVIE_NAME, SEAT_NO FROM RESERVATION
WHERE DATE = '2024-04-21' AND MOVIE_NAME = '아바타' OR MOVIE_NAME ='영웅' AND SEAT_NO = 'B1' OR SEAT_NO = 'B3';

-- 조건: 아바타를 제외한 영화 목록
SELECT MOVIE_NAME FROM RESERVATION
WHERE NOT MOVIE_NAME = '아바타'; 

-- 조건: 4월 20일에 A2 자리를 예약한 고객의 이름
SELECT USER_NAME FROM RESERVATION
WHERE DATE = '2024-04-20' AND SEAT_NO = 'A2';


-- 문제 5. PRODUCT 상품 테이블에서 다음의 조건으로 상품 검색.

-- 조건: 금액 < 2000원
SELECT * FROM PRODUCT
WHERE PRICE <= 2000;

-- 조건: 과자 또는 음료
SELECT CATEGORY, PRODUCT_NAME FROM PRODUCT
WHERE CATEGORY = '과자' OR CATEGORY = '음료';

-- 조건: 금액 > 4000원
SELECT PRODUCT_NAME, PRICE FROM PRODUCT
WHERE PRICE >= 4000;


-- 범위 연산자

-- 회원 테이블에서 회원 번호가 2와 4 사이인 회원 조회
SELECT * FROM CUSTOMER
WHERE CUSTOMER_NO BETWEEN 2 AND 4; -- 시작값, 마지막값
--	2 <= NO <= 4와 동일
	
-- 회원 번호가 1, 4인 번호 가져오기
SELECT * FROM CUSTOMER
WHERE CUSTOMER_NO IN(1, 4);
-- CUSTOMER_NO = 1 OR CUSTOMER_NO = 4; 와 동일
	
-- 회원 번호가 1, 2, 4인 번호 가져오기
SELECT * FROM CUSTOMER
WHERE CUSTOMER_NO IN(1, 2, 4);
-- CUSTOMER_NO = 1 OR CUSTOMER_NO = 2 OR CUSTOMER_NO = 4; 와 동일
	
-- 회원 번호가 1, 2, 4이 [아닌] 번호 가져오기
SELECT * FROM CUSTOMER
WHERE CUSTOMER_NO NOT IN(1, 2, 4);

-- BETWEEN: 연속적 (시작과 마지막 값을 기재하면 범위 안의 값을 자동으로 들고 옴, 숫자만 가능)
-- IN: 불연속적 (가져오고 싶은 범위를 나열, 문자열도 가능)


-- 문제 1. BOOK 도서 테이블에서 아래 조건으로 책 검색.

-- 조건: 10000 < 가격 < 30000
SELECT * FROM BOOK 
WHERE PRICE BETWEEN 10000 AND 30000;

-- 조건: 상상마당 또는 한빛미디어에서 출간한 책
SELECT * FROM BOOK
WHERE PUBLISHER IN('상상마당', '한빛미디어');


-- 문제 2. GIFT 선물 테이블에서 아래의 조건으로 선물 검색.

-- 조건: 30000 < 가격 < 60000
SELECT * FROM GIFT 
WHERE PRICE BETWEEN 30000 AND 60000;

-- 조건: 식품이나 생활용품
SELECT * FROM GIFT
WHERE TYPE IN('식품', '생활용품');

-- 조건: 가격이 10000 또는 30000 또는 40000
SELECT * FROM GIFT
WHERE PRICE IN(10000, 30000, 40000);


-- 문제 3. RESERVATION 영화 테이블에서 아래의 조건으로 영화 검색.

-- 조건: 슬램덩크 또는 영웅의 예매 정보
SELECT DATE, MOVIE_NAME, USER_NAME FROM RESERVATION
WHERE MOVIE_NAME IN('슬램덩크', '영웅');

-- 조건: 4월 20일에 A1 또는 B1 자리를 예약한 예매 정보
SELECT * FROM RESERVATION
WHERE DATE IN('2024-04-20') AND(SEAT_NO = 'A1' OR SEAT_NO = 'B1');
-- AND 이후 좌석 조건을 같이 괄호로 묶어 우선순위를 높여주지 않으면, 날짜가 20일이 아니어도 A1과 B2의 조건에 맞으면 조건에 해당되는 걸로 나옴
-- 이렇게 괄호로 묶어줄 시 [예매 날짜가 4월 20일인 경우에만] AND [좌석 번호가 맞는지 확인한다]고 적용됨


-- 문제 4. PRODUCT 상품 테이블에서 아래의 조건으로 상품 검색.

-- 조건: 2000 < 가격 < 3000
SELECT CATEGORY, PRODUCT_NAME, PRICE FROM PRODUCT
WHERE PRICE BETWEEN 2000 AND 3000;

-- 조건: 음료나 주류 중 3000원 미만
SELECT CATEGORY, PRODUCT_NAME, PRICE FROM PRODUCT
WHERE CATEGORY IN('음료', '주류') AND PRICE < 3000;


-- 패턴 연산자

-- 이름이 '둘'로 시작하는 회원 가져오기
SELECT * FROM CUSTOMER
WHERE NAME LIKE '둘%'; -- 둘 OR 둘리

-- 이름에 '길'이 포함된 회원 가져오기
SELECT * FROM CUSTOMER
WHERE NAME LIKE '길%'; -- 고길동 OR 고길 OR 길동

-- 이름이 '치'로 끝나는 회원 가져오기
SELECT * FROM CUSTOMER
WHERE NAME LIKE '%치'; -- 또치 OR 치

-- % 기호는 생략 가능


-- 빈값 체크 연산자

-- 주소가 없는 회원 조회
SELECT * FROM CUSTOMER
WHERE ADDRESS IS NULL;

-- 주소가 있는 회원 조회
SELECT * FROM CUSTOMER
WHERE ADDRESS IS NOT NULL;


-- 문제 1. BOOK 도서 테이블에서 아래의 조건으로 책 검색.

-- 조건: 제목이 역사로 시작하면서 출판일이 1월 1일
SELECT * FROM BOOK
WHERE TITLE LIKE '역사%' AND PUB_DATE = '2023-01-01;'

-- 조건: 출판사가 있고 가격 > 20000
SELECT PUBLISHER, TITLE, PRICE FROM BOOK
WHERE PUBLISHER IS NOT NULL AND PRICE >= 20000;


-- 문제 2. CONTACTS 연락처 테이블에서 아래의 조건으로 사람 검색.

-- 조건: 전화번호가 4126으로 끝는 사람
SELECT LAST_NAME, FIRST_NAME, PHONE FROM CONTACTS
WHERE PHONE LIKE '%4126'; 

-- 조건: 전화번호에 2341이 포함되고 김씨 성을 가진 사람
SELECT LAST_NAME, FIRST_NAME, PHONE FROM CONTACTS
WHERE PHONE LIKE '%2341%' AND LAST_NAME = '김';

-- 조건: 네이버 이메일을 사용하고 전화번호가 없는 사람
SELECT * FROM CONTACTS
WHERE EMAIL LIKE '%naver%' AND PHONE IS NULL;


-- 문제 3. GIFT 선물 테이블에서 아래의 조건으로 선물 검색.

-- 조건: 이름에 용품이 포함된 상품
SELECT * FROM GIFT
WHERE NAME LIKE '%용품%';

-- 조건: 이름이 세트로 끝나면서 2만원 이하인 상품
SELECT * FROM GIFT
WHERE NAME LIKE '%세트' AND PRICE <= 20000;


-- 문제 4. RESERVATION 영화 예매 테이블에서 예매 정보 확인

-- A열에서 영화 아바타를 보는 예매 정보
SELECT * FROM RESERVATION 
WHERE MOVIE_NAME = '아바타' AND SEAT_NO LIKE 'A%';

-- B열에서 영화를 보는 예매 정보
SELECT * FROM RESERVATION
WHERE SEAT_NO LIKE 'B%';


-- 회원 정보를 기준으로 순 정렬
SELECT * FROM CUSTOMER
ORDER BY CUSTOMER_NO; --- ASC 생략

-- 회원 정보를 기준으로 역정렬
SELECT * FROM CUSTOMER
ORDER BY CUSTOMER_NO DESC;

-- 주소를 기준으로 정렬
SELECT * FROM CUSTOMER
ORDER BY ADDRESS ASC;

-- 주소와 이름으로 정렬
SELECT * FROM CUSTOMER
ORDER BY ADDRESS ASC, NAME DESC;


-- 테이블에서 특정 개수만큼만 조회하기
SELECT * FROM CUSTOMER LIMIT 3;


-- 컬럼에 별명 붙이기
SELECT CUSTOMER_NO AS CODE
FROM CUSTOMER;

-- 한글도 OK
SELECT CUSTOMER_NO AS '회원의 번호'
FROM CUSTOMER;

-- 별명은 자바 프로그램에서 클래스 이름과 매칭시키는 경우
-- 또는 엑셀로 출력하는 경우에 사용한다 (데이터 추출 시 별명으로 내보내짐)