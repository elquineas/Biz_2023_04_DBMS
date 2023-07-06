-- addr 사용자 화면

CREATE TABLE tbl_temp_hb(
    hb_aid	    VARCHAR2(5),
    hb_name1	nVARCHAR2(30),
    hb_name2	nVARCHAR2(30),
    hb_name3	nVARCHAR2(30)
);

SELECT *
FROM   tbl_temp_hb;

SELECT COUNT(*)
FROM   tbl_temp_hb;



SELECT hb_aid, hb_name1
FROM   tbl_temp_hb
UNION ALL
SELECT hb_aid, hb_name2
FROM   tbl_temp_hb
WHERE  hb_name2 IS NOT NULL
UNION ALL
SELECT hb_aid, hb_name3
FROM   tbl_temp_hb
WHERE  hb_name3 IS NOT NULL
ORDER BY hb_aid;


DROP TABLE tbl_hobby;
CREATE TABLE tbl_hobby(
    hb_seq	    NUMBER		    PRIMARY KEY,
    hb_aid	    VARCHAR2(5)	    NOT NULL,
    hb_name	    nVARCHAR2(30)	NOT NULL	
);

SELECT * 
FROM   tbl_hobby;

SELECT COUNT(*)
FROM   tbl_hobby;



-- 취미정보 제3정규화
ALTER TABLE tbl_hobby
RENAME TO tbl_addr_hobby;


SELECT *
FROM   tbl_addr_hobby;

-- 주소 취미 Relation Table 에 제3정규화

SELECT hb_name
FROM   tbl_addr_hobby
GROUP BY hb_name
ORDER BY hb_name;


-- 제3정규화 데이터 import


DROP TABLE tbl_addr_hobby;
CREATE TABLE tbl_addr_hobby(
    ah_seq	    NUMBER		PRIMARY KEY,
    ah_aid	    VARCHAR2(5)	NOT NULL,
    ah_hbcode	VARCHAR2(5)	NOT NULL	
);

SELECT *
FROM   tbl_addr_hobby;

SELECT COUNT(*)
FROM   tbl_addr_hobby;


SELECT ah_hbcode
FROM   tbl_addr_hobby
GROUP BY ah_hbcode
ORDER BY ah_hbcode;

-- 취미 Entity import

CREATE TABLE tbl_hobby(
    hb_code	    VARCHAR2(5)		PRIMARY KEY,
    hb_name	    nVARCHAR2(30)	NOT NULL,
    hb_descrip	nVARCHAR2(400)		
);


SELECT *
FROM   tbl_hobby;
SELECT *
FROM   tbl_addr_hobby a,tbl_address b
WHERE  a.ah_aid = b.a_id;


SELECT COUNT(*)
FROM   tbl_addr_hobby a,tbl_address b
WHERE  a.ah_aid = b.a_id;


SELECT COUNT(*)
FROM   tbl_addr_hobby;

SELECT *
FROM   tbl_addr_hobby a
LEFT JOIN tbl_address b
ON  a.ah_aid = b.a_id
ORDER BY a.ah_aid;

TRUNCATE TABLE tbl_address;
SELECT * FROM tbl_address;


SELECT *
FROM   tbl_addr_hobby a
LEFT JOIN tbl_address b
ON  a.ah_aid = b.a_id
LEFT JOIN tbl_hobby c
ON a.ah_hbcode = c.hb_code
ORDER BY a.ah_aid;


CREATE VIEW view_addr_hobby
AS(
SELECT a.ah_aid, a.ah_hbcode, b.a_name, b.a_tel, b.a_addr, c.hb_name, c.hb_descrip
FROM   tbl_addr_hobby a
LEFT JOIN tbl_address b
ON  a.ah_aid = b.a_id
LEFT JOIN tbl_hobby c
ON a.ah_hbcode = c.hb_code
);


SELECT a.ah_aid, a.ah_hbcode, b.a_name, b.a_tel, b.a_addr, c.hb_name, c.hb_descrip
FROM   tbl_addr_hobby a
LEFT JOIN tbl_address b
ON  a.ah_aid = b.a_id
LEFT JOIN tbl_hobby c
ON a.ah_hbcode = c.hb_code
ORDER BY a.ah_aid;


SELECT * FROM view_addr_hobby;

-- FOREIGN KEY 설정하기 : 참조무결성 설정하기
-- 1. FK는 Relation Table에 설정한다
-- 2. FK는 1:N 관계 table 에서 N의 Table 에 설정한다

-- addr_hobby와 address 간의 FK 설정
ALTER TABLE tbl_addr_hobby
ADD CONSTRAINT f_addr
FOREIGN KEY (ah_aid)
REFERENCES tbl_address(a_id);

-- addr_hobby와 hobby 간의 FK 설정
ALTER TABLE tbl_addr_hobby
ADD CONSTRAINT f_hobby
FOREIGN KEY (ah_hbcode)
REFERENCES tbl_hobby(hb_code);