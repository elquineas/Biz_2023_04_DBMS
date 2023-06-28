-- 

SELECT acnum, acdiv, acbuid, acbalance 
FROM   tbl_acc 
ORDER BY acnum ;

SELECT acnum, acdiv, acbuid, acbalance 
FROM   tbl_acc 
WHERE  acnum = '';

INSERT INTO tbl_acc(acnum, acdiv, acbuid, acbalance)
VALUES ('2023052401','1','0001',100000);

INSERT INTO tbl_acc(acnum, acdiv, acbuid, acbalance)
VALUES ('2023052402','2','0003',100000);

commit;


SELECT acnum, acdiv, acbuid, acbalance 
FROM   tbl_acc 
WHERE  acbuid IN('0001', '0003');


SELECT acnum, acdiv, acbuid, acbalance 
FROM   tbl_acc 
WHERE NOT acbuid IN ('0001', '0003');

SELECT acnum, acdiv, acbuid, acbalance 
FROM   tbl_acc 
WHERE  acbuid != '0001'
AND    acbuid <> '0003';

SELECT * 
FROM   tbl_buyer; 

DESCRIBE tbl_acc;
--TABLE의 구조변경
--Table의 구조를 변경하는 거승ㄴ 상당히 많은 비용이 소요된다
--초기에 설계가 잘못된 경우 구조변경을 실시하는데 상당한 주의를 기울여야 한다
--구조변경 과정에서 문제가 발생하면 데이터가 손상되는 문제가 있다
--구조변경 할때 칼럼의 크기는 절대 줄여서 변경하면 안된다

--tbl_acc의 acNum칼럼의 길이가 VARCHAR2(10)인데
--이 칼럼의 길이를 VARCHAR2(20)으로 변경
ALTER TABLE tbl_acc MODIFY (acNum VARCHAR2(20));


INSERT INTO tbl_acc(acnum, acdiv, acbuid, acbalance)
VALUES ('','','',0);

--DELETE
--FROM tbl_acc
--WHERE acnum = '20230524-03';

SELECT * 
FROM   tbl_buyer; 

SELECT acnum, acdiv, acbuid, acbalance 
FROM   tbl_acc 
ORDER BY acnum ;

commit;

SELECT substr(MAX(acnum),9)
FROM   tbl_acc 
WHERE  substr(acnum,0,8) = '20230524';

--------------------------------------------
SELECT acnum, acdiv, acbuid, acbalance 
FROM   tbl_acc 
ORDER BY acnum ;

UPDATE tbl_acc
SET    acnum = '202305240003'
WHERE  acnum = '2023052403';

--UPDATE tbl_acc a
--SET    acnum = CONCAT( (SELECT substr(b.acnum,0,8)
--                        FROM   tbl_acc b
--                        WHERE  a.acnum = b.acnum), '00',(SELECT substr(b.acnum,9)
--                                                         FROM   tbl_acc b
--                                                         WHERE  a.acnum = b.acnum) );


