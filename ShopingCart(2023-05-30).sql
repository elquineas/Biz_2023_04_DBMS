CREATE TABLE tbl_product(
    pCode	VARCHAR2(13)	PRIMARY KEY,
    pName	nVARCHAR2(50)	NOT NULL,
    pItem	VARCHAR2(10)	NOT NULL,	
    pIPrice	NUMBER,
    pOPrice	NUMBER
);

CREATE TABLE tbl_buyer(
    buId	VARCHAR2(10)	PRIMARY KEY,
    buName	nVARCHAR2(20)	NOT NULL,
    buTel	VARCHAR2(10),
    buAddr	nVARCHAR2(125)
);

CREATE TABLE tbl_iolist(
    ioSEQ	NUMBER		PRIMARY KEY,
    ioDate	VARCHAR2(10),
    ioTime	VARCHAR2(10),
    ioBuid	VARCHAR2(10)	NOT NULL,
    ioPCode	VARCHAR2(13)	NOT NULL,	
    ioQuan	NUMBER,
    ioPrice	NUMBER
);



SELECT *
FROM  tbl_product;

INSERT INTO tbl_product (pcode, pname, pitem, piprice, poprice)
VALUES('CANDY00000001','과자','과자류','10000','12200');

commit;

--UPDATE tbl_product
--SET    pname   = #{},
--       pitem   = #{},
--       piprice = #{},
--       poprice = #{}
--WHERE  pcode = #{}

ALTER TABLE tbl_buyer 
MODIFY (buTel VARCHAR2(13));

INSERT INTO tbl_buyer (buid, buName, buTel, buAddr)
VALUES('0000000001','홍길동','010-1111-1111','광주광역시');
INSERT INTO tbl_buyer (buid, buName, buTel, buAddr)
VALUES('0000000002','이몽룡','010-2222-2222','서울특별시');
INSERT INTO tbl_buyer (buid, buName, buTel, buAddr)
VALUES('0000000003','성춘향','010-3333-3333','전라남도 나주시');


SELECT MAX(buid) 
FROM tbl_buyer;


DROP SEQUENCE seq_iolist;
CREATE SEQUENCE seq_iolist
START WITH 1 INCREMENT BY 1;


SELECT *
FROM   tbl_iolist;

INSERT INTO tbl_iolist (ioseq,  iobuid, iopcode, iodate, iotime, ioquan, ioprice)
VALUES(seq_iolist.nextval,'0000000001', 'CANDY00000001', '2021-05-30', '13:27:30', 3, 36600);



SELECT * FROM tbl_iolist
WHERE iobuid = '0000000002'
AND   ioDate between '2023-05-29' AND '2023-05-30';

