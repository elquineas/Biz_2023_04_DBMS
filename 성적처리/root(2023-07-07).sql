-- root 페이지
DROP USER 'todo'@'localhost';
DROP USER 'todo'@'192.168.4.%';
DROP USER 'todo'@'%';

DROP USER todo@localhost;
CREATE USER todo@localhost IDENTIFIED BY '88888888';
GRANT ALL PRIVILEGES ON todoDB.* TO todo@localhost;
FLUSH PRIVILEGES;

-- MySQL 스키마 생성
CREATE DATABASE scoreDB;
GRANT ALL PRIVILEGES ON scoreDB.* TO todo@localhost;
FLUSH PRIVILEGES;