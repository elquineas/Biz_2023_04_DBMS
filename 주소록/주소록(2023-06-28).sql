-- 주소록 addr 사용자화면

-- 1. 데이터를 저장할 TABLE 생성
CREATE TABLE tbl_address(
    a_id	VARCHAR2(5)		PRIMARY KEY,
    a_name	nVARCHAR2(20)	NOT NULL,
    a_tel	VARCHAR2(13)	NOT NULL,
    a_addr	nVARCHAR2(125)	NOT NULL	
);

SELECT *
FROM   tbl_address;

SELECT COUNT(*) FROM tbl_address;
SELECT COUNT(a_id) FROM tbl_address;

-- 최대값, 최소값
SELECT MAX(a_id)
FROM   tbl_address;

/*
SQL : 구조화된 DBMS 핸들링 문법
ANSI SQL : 모든 DBMS SW에 거의 공통으로 구현된 명령 문법
           표준화된 문법으로 DBMS SW가 달라도 사용할수 있는 문법
특정 SQL : 
*/

-- 컬럼의 일부만 표현하도록 하는것 : Projection이라고 한다.
SELECT a_id, a_name
FROM   tbl_address;

--
SELECT a_id, a_name
FROM   tbl_address
WHERE  a_id < 'A0010';

SELECT COUNT(*)
FROM   tbl_address
WHERE  a_id < 'A0010';

/*
PROJECTION : 특정 컬럼만 나열하여 데이터를 SELECT 하는 것
SELECTION : 특정 조검에 맞는 데이터를 SELECT 하는 것
*/

-- LIKE 포함된 문자 검색
-- SUBSTR 문자열 자르기 함수
SELECT SUBSTR(a_tel,0,5)
FROM   tbl_address;
--WHERE  a_id < 'A0010'
--ORDER BY a_tel;

SELECT SUBSTR(a_tel,5,4)
FROM   tbl_address;



SELECT a_id, a_name, a_tel, a_addr
FROM   tbl_address
WHERE  a_id < 'A0010'
ORDER BY a_tel;

SELECT a_id, a_name, a_tel, a_addr
FROM   tbl_address
WHERE  SUBSTR(a_tel,0,6) = '090-33';

SELECT a_id, a_name, a_tel, a_addr
FROM   tbl_address
WHERE  a_tel LIKE '090-33%';


-- 범위를 먼저 제한하여 갯수를 줄인후 LIKE문을 타게한다.
SELECT *
FROM   tbl_address
WHERE  a_id >= 'A0100' AND a_id <= 'A0200' AND a_tel LIKE '090-33%';

























