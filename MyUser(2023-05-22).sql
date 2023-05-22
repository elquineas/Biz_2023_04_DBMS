
CREATE TABLE tbl_buyer(
    buId	VARCHAR2(5)	NOT NULL	PRIMARY KEY,
    buName	nVARCHAR2(20)	NOT NULL,
    buTel	VARCHAR2(20),
    buAddr	nVARCHAR2(125),		
    buBirth	VARCHAR2(10),		
    buJob	nVARCHAR2(20)		
);

INSERT INTO tbl_buyer(buid, buname, butel, buaddr, bubirth, bujob)
VALUES('0001', '이몽룡', '010-1111-1111', '서울특별시', '1999-01-01', '직장인');

SELECT * FROM tbl_buyer;

INSERT INTO tbl_buyer(buid, buname)
VALUES('0002','성춘향');

UPDATE tbl_buyer
SET butel = '010-2222-2222'
WHERE buid = '0002';

SELECT * FROM tbl_buyer;

UPDATE tbl_buyer
SET buaddr = '전라북도 남원시'
WHERE buname = '성춘향';





