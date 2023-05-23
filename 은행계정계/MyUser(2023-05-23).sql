-- 여기는 MYUser SHEME 화면
-- 여기는 MyUser로 접속한 화면

SHOW TABLES;

DESCRIBE tbl_buyer;
/*
SELECT 명령
SQL의 DML중에 가장 많이 사용하는 명령
DB>TABLE에 보관(저장)중인 데이터를 조회하는 명령
*/
SELECT * FROM tbl_buyer;

SELECT buid 아이디 FROM tbl_buyer;

SELECT * FROM tbl_buyer
WHERE buname = '홍길동';

INSERT INTO tbl_buyer(buid, buname)
VALUES ('0003','성춘향');

SELECT * FROM tbl_buyer;

SELECT * FROM tbl_buyer
WHERE buname = '성춘향';


-- ORA-01400: NULL을 ("C##MYUSER"."TBL_BUYER"."BUID") 안에 삽입할 수 없습니다
INSERT INTO tbl_buyer(buname)
VALUES ('임꺽정');


/*
TABLE : Entity를 물리적으로 구현한 상태
데이터를 보관, 관리하는 기본적인 frame(틀)이다
DBMS 소프트웨어 마다 데이터를 저장하는 방법은 각각 고유한 기술적 부분이다
이러한 부분을 DB개발자, 사용자가 알 필요는 없다.
DBMS에서는 개발자, 사용자가 바라보는 모든 데이터는 TABLE(표) 형식이다.

TABLE을 작성하기 앞서, 개념적, 논리적 모델링을 수행하는데 이 단계에서는 TABLE을 Entity라고 한다

프로그래밍(Java 등)에서는 TABLE을 객체, 개체 등으로 취급한다.
java의 데이터 클래스가 여기에 해당한다.
*/

