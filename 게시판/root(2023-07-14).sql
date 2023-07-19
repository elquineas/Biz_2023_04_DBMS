USE bbsDB;

DESC tbl_bbs;
-- tbl_bbs 대표이미지를 저장하는 칼럼 추가

ALTER TABLE tbl_bbs
ADD b_image VARCHAR(125)
AFTER b_count;

TRUNCATE tbl_bbs;

ALTER TABLE tbl_bbs
DROP CONSTRAINT f_username;

ALTER TABLE tbl_bbs
DROP b_nickname;

DESC tbl_bbs;

INSERT INTO tbl_bbs(b_pseq, b_date, b_time, b_username,
					b_subject, b_content, b_count ,b_image)
VALUES(1,1,1,1,1,1,1,1);

SELECT *
FROM  tbl_bbs;

CREATE TABLE tbl_images (
	i_seq	bigint	PRIMARY KEY	auto_increment,
	i_bseq	bigint	NOT NULL		,
	i_originalName	varchar(125)	,		
	i_uploadName	varchar(125)			
);