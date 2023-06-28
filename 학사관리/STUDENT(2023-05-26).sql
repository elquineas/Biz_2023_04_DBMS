-- DBA 권한
-- 테이블 생성, 수정, 삭제, 데이터의 CRUD, COMMIT, ROLL BACK등

/*
RDBMS(Relation DataBase Management Ststem)에서 데이터 취급하기
1. 물리적인 저장소를 생성하기       = Oracle 에서는 TABLESPACE
2. Table 저장소 생성 : 논리적 개념  = CREATE TABLE
3. CRUD 구현
*/
--DROP TABLE tbl_student;
CREATE TABLE tbl_student(
    st_num	    VARCHAR2(10)	PRIMARY KEY,
    st_name	    nVARCHAR2(20)	NOT NULL,
    st_dept	    nVARCHAR2(20)	,	
    st_grade	NUMBER		    ,
    st_tel	    VARCHAR2(20)	NOT NULL
);

-- 이미 데이터가 추가되었는데 Table 구조의 문제를 발견했을때
-- TABLE 변경
ALTER TABLE tbl_student 
MODIFY (st_tel VARCHAR2(20));

-- CRUD 실습
INSERT INTO tbl_student(st_num,st_name,st_dept,st_grade,st_tel)
VALUES('230001','홍길동','정보통신',3,'010-1111-1111');

INSERT INTO tbl_student(st_num,st_name,st_dept,st_grade,st_tel)
VALUES('230002','성춘향','법학과',1,'010-2222-2222');

INSERT INTO tbl_student(st_num,st_name,st_dept,st_grade,st_tel)
VALUES('230003','이몽룡','행정학과',3,'010-3333-3333');

SELECT * 
FROM   tbl_student;

SELECT st_num,st_name,st_dept,st_grade,st_tel
FROM   tbl_student;

SELECT st_num, st_name
FROM   tbl_student;

SELECT st_num, st_name
FROM   tbl_student
WHERE  st_name = '홍길동';

SELECT st_num,st_name,st_dept,st_grade,st_tel
FROM   tbl_student
ORDER BY  st_name, st_tel;

UPDATE tbl_student
SET    st_tel = '0101-1111-1111'
WHERE  st_name = '홍길동';

UPDATE tbl_student
SET    st_tel = '0101-1111-1111'
WHERE  st_num = '230001';

DELETE FROM tbl_student
WHERE st_name = '임꺽정';

commit;









