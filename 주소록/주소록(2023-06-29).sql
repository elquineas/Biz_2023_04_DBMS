-- USER
/*
SQL 작성
1. TABLE 에 저장된 전체 데이터의 개수는 몇개인가
2. TABLE 에 저장된 전체 리스트를 전화번호 순으로 정렬하여 확인하기
3. TABLE 에 저장된 전체 리스트를 이름 순으로 정렬하여 확인하기 
4. TABLE 에 저장된 전체 리스트중에 성씨가 "김"으로 시작되는 리스트 확인하기
5. TABLE 에 저장된 전체 리스트중에 전화번호의 국번(090-0000-0000 중에 두번째 구역)
   이 3으로 시작되는 리스트의 개수는 몇개인가
*/

SELECT count(*)
  FROM tbl_address;
  
SELECT *
  FROM tbl_address
 ORDER
    BY a_tel ASC;  
  
SELECT *
  FROM tbl_address
 ORDER
    BY a_name ASC;  
  
SELECT *
  FROM tbl_address
 WHERE a_name LIKE '이%';
  
SELECT count(*)
  FROM tbl_address
 WHERE SUBSTR(a_tel,5,1) = '3';
 
SELECT count(*)
  FROM tbl_address
 WHERE a_tel LIKE '____3%';
 
SELECT MAX(a_id), MIN(a_id)
  FROM tbl_address
 WHERE a_tel LIKE '____3%'; 
 
 
 
 
 
 
 
 
 
 