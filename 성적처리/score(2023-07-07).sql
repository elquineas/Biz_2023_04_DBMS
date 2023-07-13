-- score(2023-07-07)

USE scoreDB;

-- 일반 (엑셀) 성적표를 저장하기 위한 Table 생성
CREATE TABLE tbl_scoreV1 (
	sc_stNum	VARCHAR(5)		PRIMARY KEY,
	sc_kor		INT	,
	sc_eng		INT	,
	sc_math		INT	,
	sc_music	INT	,
	sc_art		INT	,
	sc_software	INT	,
	sc_database	INT		
);

SHOW TABLES;
DESC tbl_scoreV1;
SELECT *
  FROM tbl_scorev1;
SELECT COUNT(*)
  FROM tbl_scorev1;
    

SELECT *, 
       sc_kor + sc_eng + sc_math + sc_music + sc_art + sc_software + sc_database AS 총점,
       (sc_kor + sc_eng + sc_math + sc_music + sc_art + sc_software + sc_database) / 7 AS 평균
  FROM tbl_scorev1
 ORDER
    BY sc_stNUM;
    
-- DROP VIEW view_scoreV1;
CREATE VIEW view_scoreV1 AS (
    SELECT *, 
		   sc_kor + sc_eng + sc_math + sc_music + sc_art + sc_software + sc_database AS 총점,
		   (sc_kor + sc_eng + sc_math + sc_music + sc_art + sc_software + sc_database) / 7 AS 평균
	  FROM tbl_scorev1
);

SELECT * 
  FROM view_scoreV1;
  
-- 국어성적이 50점 이상인 학생들 리스트
SELECT *
  FROM view_scoreV1
 WHERE sc_kor >= 50;
-- 평균점수가 60점 미만인 학생들 리스트
SELECT *
  FROM view_scoreV1
 WHERE 평균 < 70;
  
SELECT SUM(sc_kor), AVG(sc_kor), MAX(sc_kor), MIN(sc_kor), COUNT(sc_kor)
  FROM view_scoreV1;

SELECT SUM(sc_kor), 
       SUM(sc_eng), 
       SUM(sc_math), 
       SUM(sc_music), 
       SUM(sc_art)
  FROM view_scoreV1;

SELECT AVG(sc_kor), 
       AVG(sc_eng), 
       AVG(sc_math), 
       AVG(sc_music), 
       AVG(sc_art)
  FROM view_scoreV1;

-- 랭킹
SELECT *, 
       RANK() OVER(ORDER BY 평균 DESC) 랭킹
  FROM view_scoreV1
 ORDER 
    BY 평균 DESC;

-- DENSE_RANK() : 동점자 처리를 하되 석차를 건너뛰기 X
SELECT *, 
       DENSE_RANK() OVER(ORDER BY 평균 DESC) 랭킹
  FROM view_scoreV1
 ORDER 
    BY 평균 DESC;


SELECT *
  FROM (
		SELECT *, RANK() OVER(ORDER BY 평균 DESC) 랭킹
		  FROM view_scoreV1
		) SUB
WHERE SUB.랭킹 < 10;

SELECT sc_stNum, 'B001', '국어', sc_kor FROM tbl_scoreV1
UNION ALL
SELECT sc_stNum, 'B002', '영어', sc_eng FROM tbl_scoreV1
UNION ALL
SELECT sc_stNum, 'B003', '수학', sc_math FROM tbl_scoreV1
UNION ALL
SELECT sc_stNum, 'B004', '음악', sc_music FROM tbl_scoreV1
UNION ALL
SELECT sc_stNum, 'B005', '미술', sc_art FROM tbl_scoreV1
UNION ALL
SELECT sc_stNum, 'B006', '소프트웨어', sc_software FROM tbl_scoreV1
UNION ALL
SELECT sc_stNum, 'B007', '데이터베이스', sc_database FROM tbl_scoreV1;


SELECT 과목코드, 과목명 
  FROM
		(
		SELECT sc_stNum, 'B001' AS 과목코드, '국어' AS 과목명, sc_kor FROM tbl_scoreV1
		UNION ALL
		SELECT sc_stNum, 'B002', '영어', sc_eng FROM tbl_scoreV1
		UNION ALL
		SELECT sc_stNum, 'B003', '수학', sc_math FROM tbl_scoreV1
		UNION ALL
		SELECT sc_stNum, 'B004', '음악', sc_music FROM tbl_scoreV1
		UNION ALL
		SELECT sc_stNum, 'B005', '미술', sc_art FROM tbl_scoreV1
		UNION ALL
		SELECT sc_stNum, 'B006', '소프트웨어', sc_software FROM tbl_scoreV1
		UNION ALL
		SELECT sc_stNum, 'B007', '데이터베이스', sc_database FROM tbl_scoreV1
		) SUB
GROUP BY 과목코드, 과목명;

-- 학생정보 제3정규화 데이터 테이블
-- 학번과 과목코드를 복합키로 생성
CREATE TABLE tbl_score(
	sc_stnum	VARCHAR(5)	NOT NULL,
	sc_bcode	VARCHAR(4)	NOT NULL,
	sc_score	INT			NOT NULL,
	PRIMARY KEY(sc_stnum,sc_bcode)
);
-- 과목정보 테이블
DROP TABLE tbl_subject;
CREATE TABLE tbl_subject(
	b_code	VARCHAR(4)		PRIMARY KEY,
	b_name	VARCHAR(20)		
);

INSERT INTO tbl_subject(b_code, b_name)
 VALUE ('B001', '국어');
INSERT INTO tbl_subject(b_code, b_name)
 VALUE ('B002', '영어');
INSERT INTO tbl_subject(b_code, b_name)
 VALUE ('B003', '수학');
INSERT INTO tbl_subject(b_code, b_name)
 VALUE ('B004', '음악');
INSERT INTO tbl_subject(b_code, b_name)
 VALUE ('B005', '미술');
INSERT INTO tbl_subject(b_code, b_name)
 VALUE ('B006', '소프트웨어');
INSERT INTO tbl_subject(b_code, b_name)
 VALUE ('B007', '데이터베이스');

SELECT * FROM tbl_subject;
SELECT COUNT(*) FROM tbl_subject;

SELECT * FROM tbl_score;
SELECT COUNT(*) FROM tbl_score;

-- 성적표과 과목정보를 JOIN하여
-- 학번 과목코드 과목명 점수를 Projection 하여 출력

SELECT sc_stnum, sc_bcode, b_name, sc_score
  FROM tbl_score a,
       tbl_subject b
 WHERE sc_bcode = b_code;

SELECT sc_stnum, sc_bcode, b_name, sc_score
  FROM tbl_score
  LEFT JOIN tbl_subject
    ON sc_bcode = b_code;

-- FK 설정
-- ALTER TABLE 설정할_테이블
-- ADD CONSTRAINT 포링키_닉네임
-- FOREIGN KEY (설정할_테이블_컬럼)
-- REFERENCES 참조할_테이블(참조할_테이블_컬럼);
ALTER TABLE tbl_score
ADD CONSTRAINT f_bcode
FOREIGN KEY (sc_bcode)
REFERENCES tbl_subject(b_code);

-- ALTER TABLE tbl_score
-- DROP FOREIGN KEY f_bcode;

-- ON DELETE : Master(tbl_subject) table의 키가 삭제될때 같이삭제
-- ON UPDATE : Master(tbl_subject) table의 키가 변경될때 같이변경
/*
CASCADE     : Master 삭제 -> Sub 도 삭제
SET NULL    : Master 삭제 -> Sub 는 NULL, SUB 컬럼이 NOT NULL 이면 오류발생
NO ACTION   : Master 삭제 -> Sub 에는 변화 X
SET DEFAULT : Master 삭제 -> Sub Table 생성할대 Default 옵션으로 지정한 값으로 세팅
RESTRICT    : 아무동작도 하지 않음
*/
ALTER TABLE tbl_score
ADD CONSTRAINT f_bcode
FOREIGN KEY (sc_bcode)
REFERENCES tbl_subject(b_code)
ON DELETE CASCADE;

SELECT sc_stnum, sc_bcode, b_name, sc_score
  FROM tbl_score, tbl_subject
 WHERE sc_bcode = b_code AND sc_stnum = 'S0001';

SELECT sc_stnum, sc_bcode, b_name, sc_score
  FROM tbl_score, tbl_subject
 WHERE sc_bcode = b_code AND b_name = '국어';

SELECT sc_stnum, SUM(sc_score)
  FROM tbl_score
 GROUP BY sc_stnum;

-- 과목별 총점
SELECT sc_bcode, SUM(sc_score)
  FROM tbl_score
 GROUP BY sc_bcode;

-- 제3정규화된 데이터를 PIVOT 으로 펼쳐서 보고서 형식으로 출력
SELECT SUM(IF(sc_bcode = 'B001',sc_score,0)) AS 국어,
	   SUM(IF(sc_bcode = 'B002',sc_score,0)) AS 영어,
       SUM(IF(sc_bcode = 'B003',sc_score,0)) AS 수학,
       SUM(IF(sc_bcode = 'B004',sc_score,0)) AS 음악,
       SUM(IF(sc_bcode = 'B005',sc_score,0)) AS 미술,
       SUM(IF(sc_bcode = 'B006',sc_score,0)) AS 소프트웨어,
       SUM(IF(sc_bcode = 'B007',sc_score,0)) AS 데이터베이스,
       SUM(sc_score) AS 총점
  FROM tbl_score
 GROUP BY sc_stnum;

-- 학번이 S0010보다 작은 학생들의 총점 계산
SELECT sc_stnum AS 학번, SUM(sc_score) AS 총점
  FROM tbl_score
 WHERE sc_stnum < 'S0010'
 GROUP BY sc_stnum;

-- 총점이 S0010 학생보다 낮을 학생들의 총점 계산
SELECT sc_stnum AS 학번, SUM(sc_score) AS 총점
  FROM tbl_score
 GROUP BY sc_stnum
 HAVING 총점 < (SELECT SUM(sc_score) FROM tbl_score WHERE sc_stnum = 'S0010');
 /*
 오라클 
	Table Space 만들기
	User생성하기
 Mysql
	권한 부여하기
 공통
	주요 SELECT 문장
		EX) SUM(), AVG, GROUP BY
    CREATE TABLE
		EX) 테이블 명세를 보고 빈칸 채우기 후 테이블 만들기
    INSERT 명령
    UPDATE 명령
		EX) 주소록에서 홍길동인 사람의 전화번호가 000-0000-0000 이다
            이 전화번호를 010-2222-2222 으로 바꾸어라
 */