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

SELECT * FROM tbl_buyer;

-- UPDATE tbl_buyer
-- SET    butel  = '010-3333-3333'
-- WHERE  buname = '성춘향';

UPDATE tbl_buyer
SET    butel  = '010-3333-3333'
WHERE  buname = '성춘향'
AND    buid   = '0003';


SELECT *
FROM   tbl_buyer
WHERE  buname = '이몽룡';

UPDATE tbl_buyer
SET    buaddr = '전라북도 익산시'
WHERE  buname = '이몽룡'
AND    buid   = '0001';

SELECT * FROM tbl_buyer;

INSERT INTO tbl_buyer(buid, buname,butel)
VALUES ('0004','임꺽정','010-4444-4444');

SELECT * FROM tbl_buyer;

--0004번 데이터 삭제하기
DELETE 
FROM   tbl_buyer
WHERE  buid   = '0004';

SELECT * FROM tbl_buyer;


/* CRUD
데이터 추가
칼럼 목록 개수, 순서 = 데이터 목록 개수, 순서 일치해야한다
INSERT INTO [Table] (칼럼목록)
VALUES (데이터목록)

데이터 조회
SELECT  칼럼목록
FROM    [테이블]
WHERE   칼럼 = 값;

데이터 수정
UPDATE [테이블]
SET    칼럼 = 값
WHERE  칼럼 = 값;

데이터 삭제 
DELETE
FROM   [테이블]
WHERE  칼럼 = 값;
*/



-- 계좌정보
CREATE TABLE tbl_acc(
acNum	VARCHAR2(10)	PRIMARY KEY,
acDiv	VARCHAR2(1)	    NOT NULL,	
acBuId	VARCHAR2(10)	NOT NULL,	
acBalance	NUMBER	    DEFAULT 0	
);


SELECT * FROM tbl_acc;

INSERT INTO tbl_acc (acnum, acdiv, acbuid, acbalance)
VALUES ('2023052301', '1', '0003', 10000);

INSERT INTO tbl_acc (acnum, acdiv, acbuid, acbalance)
VALUES ('2023052302', '1', '0001', 50000);

INSERT INTO tbl_acc (acnum, acdiv, acbuid, acbalance)
VALUES ('2023052303', '1', '0002', 10000);

SELECT * FROM tbl_acc;

-- Table Join 2개 이상의 Table을 서로 연계하여 하나의 리스트로 보기
SELECT *
FROM   tbl_acc, tbl_buyer
WHERE  acbuid = buid;

-- 보고싶은 칼럼만 화면에 나타나도록 Join
SELECT A.acnum, A.acbuid, b.buname, a.acbalance, A.acdiv
FROM   tbl_acc   A, 
       tbl_buyer B
WHERE  A.acbuid = B.buid;


-- 정렬
SELECT   buid, buname, butel, buaddr, bubirth, bujob
FROM     tbl_buyer
ORDER BY buid;



INSERT INTO tbl_buyer(buid, buname,butel)
VALUES ('0004','임꺽정','010-4444-4444');
/*
SQL Developer와 Java 코드에서 DB를 서로 연동하여 처리하는 경우 발생하는 문제
SQL에서 데이터를 INSERT, UPDATE, DELETE를 수행하는 경우
  추가 수정 삭제된 정보는 아직 storage에 반영되지 않고, 메모리에 임시 
  보관(저장)된 상태이다
이 상태일때 Java에서 SELECT를 수행하면 INSERT, UPDATE, DELETE된 데이터가
아닌 이전 상태의 데이터가 조회된다.
간혹 잇 상황에서 DBMS가 Connection에서 무한정 응답하지 않는 경우도 있다.
Java는 DBMS가 응답하기를 기다리면서 무한정 기다리고 마치 프로젝트가 멈춘(Down)
상태가 되어버린다.

SQL에서 INSERT, UPDATE, DELETE를 수행한 다음에는 강제로 storage에 
commit을 해주어야 한다
그래야 프로젝트에서 데이터를 조회할수 있다.
*/
COMMIT;

INSERT INTO tbl_buyer(buid, buname)
VALUES ('0005','장보고');

ROLLBACK;

SELECT   buid, buname, butel, buaddr, bubirth, bujob
FROM     tbl_buyer
ORDER BY buid;

--PK칼럼을 기준으로 조회를 하면 데이터가 없거나 1개만 조회된다.
SELECT   buid, buname, butel, buaddr, bubirth, bujob
FROM     tbl_buyer
WHERE    buid = '0001'
ORDER BY buid;







