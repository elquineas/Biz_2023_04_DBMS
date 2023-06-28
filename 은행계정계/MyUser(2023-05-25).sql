
CREATE TABLE tbl_accList (
    aioSeq	    NUMBER		    PRIMARY KEY,
    acNum	    VARCHAR2(20)	NOT NULL,
    aioDate	    VARCHAR2(10)	NOT NULL,	
    aioTime	    VARCHAR2(10)	NOT NULL,	
    aioDiv	    VARCHAR2(1)	    NOT NULL,
    aioInput	NUMBER	        DEFAULT 0,
    aioOutput	NUMBER	        DEFAULT 0,
    aioRem	    nVARCHAR2(30)		
);

DESC tbl_accList;

/*
DBMS 엔진에 따라 insert를 할때 자동으로 일련번호를 생성하는 기능이 있는데
오라클에는 없다, 오라클도 12이상에서는 자동생성하는 기능이 있는데
다른 DBMS에 비하여 상당히 불편하다

오라클에서는 일련번호를 자동생성해 주는 기능을 만들어야한다
*/

DROP SEQUENCE seq_accList;
CREATE SEQUENCE seq_accList
START WITH 1 INCREMENT BY 1;

SELECT seq_accList.NEXTVAL 
FROM dual;

INSERT INTO tbl_accList(aioSeq, acNum, aiodate, aiotime, aiodiv, aioinput, aiooutput)
VALUES(seq_accList.NEXTVAL, '2023052401', '2023-05-24', '11:10:00', '1', 10000, 0);

SELECT *
FROM   tbl_accList;



SELECT *
FROM   tbl_acc;

SELECT  (SELECT acbalance
         FROM   tbl_acc
         WHERE  acnum = '202305240001') + 150000
FROM   tbl_acc
WHERE  acnum = '202305240001';

--UPDATE 
--SET    
--WHERE   



































