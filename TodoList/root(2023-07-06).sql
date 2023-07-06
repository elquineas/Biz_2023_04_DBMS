-- 여기는 root 화면
/*
MySQL 프로젝트 시작
1. database 생성
2. 사용자 등록
   DB 서버가 Application 서버과 같은 동일한 운영체제에 있을때는 사용자 등록이 선택사항이다
   root 사용자가 등록되어 있는데
   root 사용자는 기본적으로 localhost 에서만 접근이 된다
   
   만약 네트워크를 통해서 DB 서버에 접근 하거나 특별히 보안이 요구되는 경우가 아니면
   root 사용자를 일반 DB 사용자로 사용하는 경우가 많다
*/

CREATE DATABASE todoDB;
USE todoDB;
SHOW DATABASES;

-- 사용자 등록
-- 사용자 등록을 할때 접근할수 있는 범위를 설정해야 한다
-- 로컬에서만 접근할수 있는 todo 생성
CREATE USER 'todo'@'localhost' IDENTIFIED BY '12341234';

-- 로컬 네트워크(192.168.*.*)에서 현제 System의 MySQL에 접속할수 있는 사용자
CREATE USER 'todo'@'192.168.4.%' IDENTIFIED BY '88888888';

-- 모든 곳에서 접근가능한 사용자 생성
-- CREATE USER 'todo'@'*' IDENTIFIED BY '88888888';

-- 권한부여
-- ALL PRIVILEGES : DBA 권한
-- ON *.* : 모든 database 에 대하여 모든 역할 수행 (schemas.table)
-- TO 'todo'@'localhost' : 접속 가능한 유저
GRANT ALL PRIVILEGES ON *.* TO 'todo'@'localhost';

-- todoDB에 모든 권한 부여
GRANT ALL PRIVILEGES ON todoDB.* TO 'todo'@'192.168.4.%';
-- todoDB에 todolist 테이블에 모든 권한 부여
GRANT ALL PRIVILEGES ON todoDB.tbl_todolist TO 'todo'@'192.168.4.%';
-- CRUD에 관한 권한 부여
GRANT CREATE, DROP, SELECT, INSERT, UPDATE, DELETE ON todoDB.* TO 'todo'@'192.168.4.%';


-- 유저 삭제
-- DROP USER 'todo'@'192.168.4.%'

-- COMMIT;
FLUSH PRIVILEGES;

