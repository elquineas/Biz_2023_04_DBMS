
--DROP TABLE tbl_memo;
CREATE TABLE tbl_memo (
    m_seq	    NUMBER		    PRIMARY KEY,
    m_writer    nVARCHAR2(20)   NOT NULL,
    m_date      VARCHAR2(10)    NOT NULL,
    m_subject   nVARCHAR2(20)   NOT NULL,
    m_content   nVARCHAR2(400)  NOT NULL	
);

DROP SEQUENCE seq_memo;
CREATE SEQUENCE seq_memo
START WITH 1 INCREMENT BY 1;


SELECT * FROM tbl_memo
WHERE 1 = '1';

INSERT INTO tbl_memo(m_seq,m_writer,m_date,m_subject,m_content)
VALUES(seq_memo.nextval,'홍길동','2023-05-26','테스트 제목2','테스트 내용2');

commit; 

