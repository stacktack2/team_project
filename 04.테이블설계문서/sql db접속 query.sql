use mysql; -- use조회
select * from user; -- 유저 목록 조회
drop user 'cteam'@'localhost'; -- 계정 삭제
drop user 'cteam'@'192.168.35.148'; -- 계정 삭제
create user 'cteam'@'localhost' identified by 'ezen'; -- 로컬호스트 유저 생성
create user 'cteam'@'192.168.35.148' identified by 'ezen'; -- % 유저 생성
grant all privileges on campingweb.* to 'cteam'@'localhost'; -- campingweb 권한 부여 -> localhost
grant all privileges on campingweb.* to 'cteam'@'%'; -- campingweb 권한 부여 %-> 외부

grant all privileges on campingweb.* to 'cteam'@'192.168.35.148';
grant all privileges on campingweb.* to 'cteam'@'192.168.0.26';
grant all privileges on campingweb.* to 'cteam'@'192.168.0.37';
grant all privileges on campingweb.* to 'cteam'@'192.168.0.7';
grant all privileges on campingweb.* to 'cteam'@'192.168.0.8'; -- 노트북
-- 특정 ip접근 허용
FLUSH PRIVILEGES; -- 권한 적용

use mysql;
select host, user from user;

