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
delete from freeboard where idx = 123 and password = '1111' ;
delete from freeboard where idx = 123;