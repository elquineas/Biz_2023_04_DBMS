use bbsdb;

SELECT *
  FROM tbl_bbs;
  
UPDATE tbl_bbs
   SET b_subject = 'TEST'
 WHERE b_seq = 8;
 
INSERT INTO tbl_bbs(b_username)
VALUES('DOYEON');
 
SELECT *
  FROM tbl_bbs;
SELECT LAST_INSERT_ID();
  
-- INSERT INTO tbl_bbs(
-- 	   b_pseq,		b_date,		b_time,		b_username,
-- 	   b_subject,	b_content,	b_count,	b_image)
-- VALUES(#{b_pseq},		#{b_date},		#{b_time},	#{b_username},
-- 	   #{b_subject},	#{b_content},	#{b_count},	#{b_image})

INSERT INTO tbl_bbs(b_username)
VALUES('DOYEON1'),
('DOYEON2'),
('DOYEON3'),
('DOYEON4'),
('DOYEON5');

CREATE TABLE tbl_images(
	i_seq bigint PRIMARY KEY AUTO_INCREMENT,
    i_bseq bigint NOT NULL,
    i_originalName VARCHAR(125),
    i_uploadName VARCHAR(255)
);
SELECT *
  FROM tbl_images;
SELECT *
  FROM tbl_bbs;
  
  truncate tbl_bbs;
  truncate tbl_images;






