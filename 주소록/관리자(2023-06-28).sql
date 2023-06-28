-- 관리자 화면
-- Project 시작시 TableSpace 설정

-- `addrDB` 저장소 생성
CREATE TABLESPACE addrDB
DATAFILE 'c:/app/data/addr.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- System 을 통해서 DB에 접근할땐 TableSpace에 저장하지 않는다
-- TableSpace에 연결한 계정을 생성하고, 계정을 통해서 접근해야한다.

-- 사용자 생성
-- 오라클 21c(12c 이상)에서는 사용자 등록을 하기전에 SCRIPT 실행을 ON 해야한다.
-- 오라클 12c 이상에서는 사용자 ID C##아이디 형식으로 생성해야 한다
-- 사용자 ID를 관리하기가 상당히 불편하다
-- 이 작업을 선행하지 않으면 사용자ID와 TABLESPACE를 연동할 수 없다.
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 사용자ID : addr / 비밀번호 : 12341234 / 연결된 TABLESPACE : addrDB
CREATE USER addr IDENTIFIED BY 12341234
DEFAULT TABLESPACE addrDB;

-- 새로 생성한 사용자에게 DB 접근 (CRUD)할수 있는 권한 부여
-- 권한 부여할때, 로그인, CRUD, TABLE생성 등의 권한을 세부적으로 부여
-- 학습상황에서 세부적인 권한부여는 다소 불편함이 있어서 DBA의 권한을 부여한다.
GRANT DBA TO addr;