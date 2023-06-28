-- 관리자는 SYSDBA 권한을 가진 사용자
-- SYSDBA 사용자는 데이터베이스 시스템을 생성, 제거, 파괴할수 있는 권한을 가진 사용자다

/*
오라클에서 관리자로 로그인하여 수행할 작업
TABLESPACE 생성, USER 생성
 TABLESPACE : 데이터를 저장할 물리적 저장소(파일)
              데이터를 저장하기 위하여 가장 먼저 생성해야할 객체  
       USER : DBMS서버에 로그인을 하고, 자신이 관리할 데이터들과 연결하는 객체             
              오라클에서 USER는 데이터 저장소의 개념, 이 개념은 다른 DBMS와는 약간 다르게 취급한다.
              저장소 SCHEME 라고 표현한다.
C:/app/data : TABLESPACE가 저장될 폴더
*/
-- 1. TABLESPACE 생성
CREATE TABLESPACE student           -- 저장소 이름 student
DATAFILE 'C:/app/data/sudent.dbf'   -- 저장소 폴터에 student.dbf라는 이름으로 생성
SIZE 1M AUTOEXTEND ON NEXT 1K;      -- 초기 저장소 공간 1M 확보, 부족하면 1K씩 자동으로 증가 

-- 2. USER 생성
-- student라는 사용자 생성(PW:12341234)
-- 기본 저장소 student로 연결

-- 오라클 12c 이후 버전에서는 사용자 이름 등록하는 정책이 변경
-- student라는 사용자를 생성하려면 C##student 라는 이름으로 생성해야 한다
-- 이러한 정책은 보안적인 면에서 권장하지만 떄로는 불편할때가 있다
-- 일부 프로그래밍 언어에서 DB에 접속할떄 ## 같은 특수문자가 있으면 접속에 문제를 일으키는 경우가 있다.
-- 오라클에서는 12c이후에 사용자 생성 정책을 예쩐 방식으로 사용할수 있도록 하는 설정을 제공한다
ALTER SESSION SET "_ORACLE_SCRIPT" = true;
CREATE USER student IDENTIFIED by 12341234
DEFAULT TABLESPACE student;

-- 3.생성한 사용자에게 권한을 부요
/*
사용자는 DBMS 소프트웨어에 로그인을 하고 
  SQL을 사용하여 데이터 table을 생성
  CRUD 명령을 수행하여 데이터를 관리
오라클에서 사용자를 생성한 직후에는 아무런 권한이 없다
  심지어 DBMS 소프트웨어 로그인도 할 수 없다
사용자에게 권한을 부여하여 기능을 활성화 시켜야한다
원친적으로 각각항목별  세부적으로 해야하지만 학습적 편리성을 위해 모든권한 부여
사용자에게 DBA 관리자 권한 부여 */
GRANT DBA TO student;



CREATE TABLESPACE memo            -- 저장소 이름 student
DATAFILE 'C:/app/data/memo.dbf'   -- 저장소 폴터에 student.dbf라는 이름으로 생성
SIZE 1M AUTOEXTEND ON NEXT 1K;    -- 초기 저장소 공간 1M 확보, 부족하면 1K씩 자동으로 증가 


ALTER SESSION SET "_ORACLE_SCRIPT" = true;
CREATE USER memo IDENTIFIED by 12341234
DEFAULT TABLESPACE memo;

GRANT DBA TO memo;
