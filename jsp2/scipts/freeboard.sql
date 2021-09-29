-- 자유게시판 : 테이블 2개 ㅏ(메인글 저장, 댓글 저장)

create table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null,				-- 작성자
	password varchar(10) not null,			-- 글 비밀번호
	subject varchar(40) not null,			-- 글 제목
	content varchar(2000) not null,			-- 내용
	readCount int default 0,				-- 조회수
	wdate datetime default current_timestamp,	-- 서버의 현재날짜,시간
	ip varchar(15) default '127.0.0.1',		-- 작성자 ip
	commentCount smallint default 0,		-- 댓글 개수
	primary key(idx)
);
alter TABLE freeboard MODIFY COLUMN wdate timestamp DEFAULT current_timestamp;



insert into freeboard (name, password, subject, content, ip)
	values('honey', '1111', '월컴~', 'hi hello banga', '192.168.17.3');
insert into freeboard (name, password, subject, content, ip)
	values('사나', '1111', 'welcome~', '하이 방가워', '192.168.22.3');
insert into freeboard (name, password, subject, content, ip)
	values('마나', '1111', '바이~', '안녕히가세요', '192.168.23.3');
insert into freeboard (name, password, subject, content, ip)
	values('가나', '1111', 'u welcome~', '어서오세요', '192.168.24.3');
insert into freeboard (name, password, subject, content, ip)
	values('오나', '1111', 'again~', '또 오셨네요', '192.168.25.3');
insert into freeboard (name, password, subject, content, ip)
	values('또냐', '1111', 'enough~', '그만 오세요', '192.168.26.3');
	
select * from freeboard order by idx desc ;
-- mysql에서의 limit 키워드 : limit 번호(row number), 개수
select * from freeboard order by idx desc limit 0, 15 ;		-- 1페이지 목록
select * from freeboard order by idx desc limit 15, 15 ;	-- 2페이지 목록
select * from freeboard order by idx desc limit 30, 15 ;	-- 3페이지 목록


commit;

-- 글 수정 : subject, content. idx 컬럼을 조건으로 함
update freeboard set subject = '수정한 제목', content = '내용 수정' 
	where idx = 123;

-- 조회수 변경 : 읽을 때 마다 (url 요청 발생) 카운트 ++
update freeboard set readCount = readCount + 1 where idx = 123; 

-- 글 삭제 : 글 비밀번호 1)있을때 2)없을때
delete from freeboard where idx = 123 and password = '1111' ;	-- 잘못된 비밀번호 : 쿼리 결과 null
delete from freeboard where idx = 123 and password = '1111' ;	-- 올바른 비밀번호 : 쿼리결과 1개 행 조회
delete from freeboard where idx = 123;

-- 로그인 기능 : 비밀번호 체크

-- 댓글 테이블
create table board_comment(
	idx int not null auto_increment,
	mref int not null,						-- 글의 idx(freeboard.idx)
	name varchar(30) not null,				-- 작성자
	password varchar(10) not null,			-- 글 비밀번호
	content varchar(2000) not null,			-- 내용
	wdate timestamp default current_timestamp,	-- 서버의 현재날짜,시간
	ip varchar(15) default '127.0.0.1',		-- 작성자 ip
	primary key(idx),
	foreign key(mref) references freeboard(idx)
);

insert into board_comment (mref, name, password, content, ip)
	values (126,'다현' ,'1234', '첫 댓글', '192.168.11.11');
insert into board_comment (mref, name, password, content, ip)
	values (126,'다현' ,'1234', '둘 댓', '192.168.11.11');
insert into board_comment (mref, name, password, content, ip)
	values (126,'다현' ,'1234', '셋 댓글', '192.168.11.11');

insert into board_comment (mref, name, password, content, ip)
	values (123,'다현' ,'1234', '첫 댓글', '192.168.11.11');
insert into board_comment (mref, name, password, content, ip)
	values (123,'다현' ,'1234', '둘 댓글', '192.168.11.11');
	
-- 댓글 개수
select count(*) from board_comment where mref = 126; 	-- 126번 글의 댓글 개수
select count(*) from board_comment where mref = 123; 
select count(*) from board_comment where mref = 100; 

-- 댓글 리스트
select  * from board_comment where mref = '126';

-- 댓글 개수 업데이트, 글 목록 실행 전
update freeboard set commentCount = (
	select count(*) from board_comment where mref = 126) where idx = 126;
	
-- 댓글 입력 후 저장
update freeboard set commentCount = commentCount + 1 where idx = 126;

select * from freeboard order by idx desc ;