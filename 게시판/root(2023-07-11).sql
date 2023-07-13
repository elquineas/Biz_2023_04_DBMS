CREATE DATABASE bbsDB;
FLUSH PRIVILEGES;

USE bbsDB;
-- DROP TABLE tbl_bbs;
CREATE TABLE tbl_bbs (
	b_seq		bigint		PRIMARY KEY auto_increment,
	b_pseq		bigint		,
	b_date		varchar(10)	,
	b_time		varchar(10)	,
	b_username	varchar(125),
	b_nickname	varchar(125),
	b_subject	varchar(125),
	b_content	text		,
	b_count		int			,
	b_update	datetime
);

DROP TABLE tbl_user;
CREATE TABLE tbl_user (
	u_username		varchar(125) PRIMARY KEY,
	u_nickname		varchar(125),
	u_tel			varchar(20)	
);

INSERT INTO tbl_user (u_username,u_nickname,u_tel)
VALUES('hong','홍길동','090-1111-1111');
INSERT INTO tbl_user (u_username,u_nickname,u_tel)
VALUES('lee','이몽룡','090-2222-2222');
INSERT INTO tbl_user (u_username,u_nickname,u_tel)
VALUES('seoung','성춘향','090-3333-3333');

SELECT * FROM tbl_user;

-- FK 설정
-- ALTER TABLE 설정할_테이블
-- ADD CONSTRAINT 포링키_닉네임
-- FOREIGN KEY (설정할_테이블_컬럼)
-- REFERENCES 참조할_테이블(참조할_테이블_컬럼);
ALTER TABLE tbl_bbs
ADD CONSTRAINT f_username
FOREIGN KEY (b_username)
REFERENCES tbl_user(u_username); 

SHOW TABLES;
DESC tbl_bbs;
DESC tbl_user;

SELECT B.b_seq, B.b_pseq, B.b_date, B.b_time, B.b_username, U.u_nickname,
	   B.b_subject, B.b_content, B.b_count, B.b_update
  FROM tbl_bbs B, tbl_user U
 WHERE B.b_username = U.u_username;

SELECT *
  FROM tbl_user;