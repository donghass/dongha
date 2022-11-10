select * from(select a.*,rowNum rn from(select r.*,item_name from review_board r,auction_item ai
where r.aucton_no=ai.auction_no	order by r.review_no desc)a)where rn between 1 and 10;
drop table member cascade constraint;
drop table auction_item cascade constraint;
drop table review_board cascade constraint;
drop table interest cascade constraint;
drop table bidding cascade constraint;
drop table interest_tag cascade constraint;
drop table tag cascade constraint;
drop table review_reply cascade constraint;
drop table qna_board cascade constraint;
--회원
CREATE TABLE member (
	id	varchar(40)	NOT NULL primary key,
	password	varchar(100)	NOT NULL,
	name	varchar(20)	NOT NULL,
	call	varchar(20)	NOT NULL,
	email	varchar(50)	NOT NULL,
	address	varchar(60)	NOT NULL,
	created_date	date	NOT NULL,
	del	char(1) DEFAULT 'n'	NOT NULL,
	authority	char(1) DEFAULT 'n'	NOT NULL,
	age	varchar(10) DEFAULT '20대'	NOT NULL,
	gender	char(1) DEFAULT 'm'	NOT NULL	
);
--태그목록
CREATE TABLE tag (
	tag_no	number(10)	NOT NULL primary key,
	tag_name	varchar(20)	NOT NULL
);

--경매 물품
drop table member;
CREATE TABLE auction_item (
	auction_no	number(10)	NOT NULL primary key,
	item_name	varchar(50)	NOT NULL,
	item_contents	varchar(300)	NOT NULL,
	item_img	varchar(200)	NOT NULL,
	start_date	date	NOT NULL,
	end_date	date	NOT NULL,
	start_price	number(10)	NOT NULL,
	min_bid	number(10)	NOT NULL,
	view_cnt	number(10)	NOT NULL,
	del	char(1) DEFAULT 'n'	NOT NULL,
	reg_date	date	NOT NULL,
	pay	char(1) default 'n' NOT NULL,
	id	varchar(40)	NOT NULL references member(id),
	tag_no	number(10)	NOT NULL references tag(tag_no)
);
--경매 후기 게시판
CREATE TABLE review_board (
	review_no	number(10)	NOT NULL primary key,
	title	varchar(40)	NOT NULL,
	contents	varchar(300)	NOT NULL,
	review_img	varchar(200)	NOT NULL,
	read_cnt	number(10)	NOT NULL,
	del	char(1) DEFAULT 'n'	NOT NULL,
	reg_date	date	NOT NULL,
	rating	number(5)	NOT NULL,
	id	varchar(40)	NOT NULL references member(id),
	auction_no	number(10)	NOT NULL references auction_item(auction_no)
);
--후기게시판 댓글
CREATE TABLE review_reply (
	re_no	number(10)	NOT NULL references review_board(review_no),
	rno	number(10)	NOT NULL,
	replytext	varchar(300)	NOT NULL,
	replier	varchar(40)	NOT NULL,
	reg_date	date	NOT NULL,
	updatedate	date	NOT NULL,
	del	char(1)	NOT NULL,
	id	varchar(40)	NOT NULL references member(id)
);
drop table review_reply;
drop table review_board;
--관심물품
CREATE TABLE interest (
	interest_no	number(10)	NOT NULL primary key,
	id	varchar(40)	NOT NULL references member(id),
	auction_no	number(10)	NOT NULL references auction_item(auction_no)
);
--입찰
CREATE TABLE bidding (
	bid_no	number(10)	NOT NULL primary key,
	bid_price	number(10)	NOT NULL,
	bid_date	date	NOT NULL,
	id	varchar(40)	NOT NULL references member(id),
	auction_no	number(10)	NOT NULL references auction_item(auction_no)
);
--관심태그
CREATE TABLE interest_tag (
	it_tag_no	number(10)	NOT NULL primary key,
	id	varchar(40)	NOT NULL references member(id),
	tag_no number(10)	NOT NULL
);
--문의 게시판
CREATE TABLE qna_board (
	qna_no	number(10)	NOT NULL primary key,
	qna_title	varchar(40)	NULL,
	qna_contents	varchar(300)	NULL,
	del	char(1)		DEFAULT 'n' not NULL,
	reg_date	date	NULL,
	id	varchar(40)	NOT NULL references member(id)
);


--기본 멤버
insert into member values ('master2', '1234', 'IH', '010-9454-5763', 'inhowha9195@naver.com', '분당', sysdate, 'n', 'y', '20대', 'm');
insert into member values ('khs', '1234', '현서', '010-8838-0247', 'ksh98520@naver.com', '분당', sysdate, 'n', 'y', '20대', 'm');
insert into member values ('dongha', '1', 'IH', '010-9454-5763', 'inhowha9195@naver.com', '분당', sysdate, 'n', 'y', '20대', 'm');
insert into member values ('lalala', '1234', 'HH', '010-1111-1111', 'inhowha9591@naver.com', '분당', sysdate, 'n', 'n', '20대', 'f');
--카테고리 태그
--미술품 카테고리
insert into tag values(11,'동양화');
insert into tag values(12,'서양화');
insert into tag values(13,'조각상');
--도서 카테고리
insert into tag values(21,'고서');
insert into tag values(22,'근현대 도서');
insert into tag values(23,'만화/카툰');
insert into tag values(24,'무협지');
--취미/수집 카테고리
insert into tag values(31,'피규어/장난감');
insert into tag values(32,'영화/비디오');
insert into tag values(33,'사진/앨범');
insert into tag values(34,'화폐');
insert into tag values(35,'우표/엽서');
insert into tag values(36,'음반');
insert into tag values(37,'기타수집품');
--중고 생활물품
insert into tag values(41,'가전/컴퓨터');
insert into tag values(42,'스포츠/자동차');
insert into tag values(43,'액세서리');
insert into tag values(44,'침구류/가구류');
insert into tag values(45,'기타 생활용품');
--경매물품
insert into auction_item values(111,'김홍도-향사군탄','김홍도화백의 향사군탄입니다','향사군탄.jpg',sysdate,sysdate+100,1000000,50000,15,'n',sysdate,'n','test',11);
insert into auction_item values(112,'김홍도-향사군탄','김홍도화백의 향사군탄입니다','향사군탄.jpg',sysdate,sysdate+100,1000000,50000,25,'n',sysdate,'n','test',11);
insert into auction_item values(113,'김홍도-향사군탄','김홍도화백의 향사군탄입니다','향사군탄.jpg',sysdate,sysdate+100,1000000,50000,43,'n',sysdate,'n','test',11);
insert into auction_item values(114,'고흐-별이빛나는밤에','고흐의 별빛밤입니다','별빛밤.jpg',sysdate,sysdate+100,1000000,50000,21,'n',sysdate,'n','test',12);
insert into auction_item values(115,'고흐-별이빛나는밤에','고흐의 별빛밤입니다','별빛밤.jpg',sysdate,sysdate+100,1000000,50000,53,'n',sysdate,'n','test',12);
insert into auction_item values(116,'고흐-별이빛나는밤에','고흐의 별빛밤입니다','별빛밤.jpg',sysdate,sysdate+100,1000000,50000,32,'n',sysdate,'n','test',12);
insert into auction_item values(117,'고흐-별이빛나는밤에','고흐의 별빛밤입니다','별빛밤.jpg',sysdate,sysdate+100,1000000,50000,66,'n',sysdate,'n','test',12);
insert into auction_item values(118,'고흐-별이빛나는밤에','고흐의 별빛밤입니다','별빛밤.jpg',sysdate,sysdate+100,1000000,50000,44,'n',sysdate,'n','test',12);
insert into auction_item values(119,'오뎅-띵킹하는사람','로댕의 생각하는 사람일걸요','띵킹하는사람.jpg',sysdate,sysdate+100,1000,500,23,'n',sysdate,'n','test',13);
insert into auction_item values(120,'오뎅-띵킹하는사람','로댕의 생각하는 사람일걸요','띵킹하는사람.jpg',sysdate,sysdate+100,1000,500,11,'n',sysdate,'n','test',13);
insert into auction_item values(121,'오뎅-띵킹하는사람','로댕의 생각하는 사람일걸요','띵킹하는사람.jpg',sysdate,sysdate+100,1000000,50000,6,'n',sysdate,'n','test',13);
insert into auction_item values(122,'오뎅-띵킹하는사람','로댕의 생각하는 사람일걸요','띵킹하는사람.jpg',sysdate,sysdate+100,1000000,50000,7,'n',sysdate,'n','test',13);
insert into auction_item values(123,'직지심체요절','현존하는 세계에서 제일 오래된 금속활자본','직지.jpg',sysdate,sysdate+100,50000,5000,14,'n',sysdate,'n','test',21);
insert into auction_item values(124,'직지심체요절','현존하는 세계에서 제일 오래된 금속활자본','직지.jpg',sysdate,sysdate+100,50000,5000,54,'n',sysdate,'n','test',21);
insert into auction_item values(125,'직지심체요절','현존하는 세계에서 제일 오래된 금속활자본','직지.jpg',sysdate,sysdate+100,50000,5000,42,'n',sysdate,'n','test',21);
insert into auction_item values(126,'직지심체요절','현존하는 세계에서 제일 오래된 금속활자본','직지.jpg',sysdate,sysdate+100,50000,5000,72,'n',sysdate,'n','test',21);
insert into auction_item values(127,'도라에몽 1권','하고싶은 일들을 할수있음좋을듯','도라.jpg',sysdate,sysdate+100,3000,1000,24,'n',sysdate,'n','test',23);
insert into auction_item values(128,'도라에몽 1권','하고싶은 일들을 할수있음좋을듯','도라.jpg',sysdate,sysdate+100,3000,1000,53,'n',sysdate,'n','test',23);
insert into auction_item values(129,'도라에몽 1권','하고싶은 일들을 할수있음좋을듯','도라.jpg',sysdate,sysdate+100,3000,1000,63,'n',sysdate,'n','test',23);
insert into auction_item values(130,'화산귀환 전집','화산귀환 전집 팝니다','화산귀환.jpg',sysdate,sysdate+100,100000,5000,25,'n',sysdate,'n','test',24);
insert into auction_item values(131,'화산귀환 전집','화산귀환 전집 팝니다','화산귀환.jpg',sysdate,sysdate+100,100000,5000,63,'n',sysdate,'n','test',24);
insert into auction_item values(132,'화산귀환 전집','화산귀환 전집 팝니다','화산귀환.jpg',sysdate,sysdate+100,100000,5000,83,'n',sysdate,'n','test',24);
insert into auction_item values(133,'배트맨 피규어','배트맨 피규어 한정판','배트맨.jpg',sysdate,sysdate+100,100,50,5,'n',sysdate,'n','test',31);
insert into auction_item values(134,'배트맨 피규어','배트맨 피규어 한정판','배트맨.jpg',sysdate,sysdate+100,100,50,3,'n',sysdate,'n','test',31);
insert into auction_item values(135,'배트맨 피규어','배트맨 피규어 한정판','배트맨.jpg',sysdate,sysdate+100,100,50,5,'n',sysdate,'n','test',31);
insert into auction_item values(136,'배트맨 피규어','배트맨 피규어 한정판','배트맨.jpg',sysdate,sysdate+100,100,50,12,'n',sysdate,'n','test',31);
insert into auction_item values(137,'사랑하기떄문에 LP앨범','유재하 1집 음반 사랑하기때문에','사랑하기때문에.jpg',sysdate,sysdate+100,10000,500,4,'n',sysdate,'n','test',36);
insert into auction_item values(138,'사랑하기떄문에 LP앨범','유재하 1집 음반 사랑하기때문에','사랑하기때문에.jpg',sysdate,sysdate+100,10000,500,6,'n',sysdate,'n','test',36);
insert into auction_item values(139,'사랑하기떄문에 LP앨범','유재하 1집 음반 사랑하기때문에','사랑하기때문에.jpg',sysdate,sysdate+100,10000,500,2,'n',sysdate,'n','test',36);
insert into auction_item values(140,'김구우표','독립운동가 김구 우표','김구우표.jpg',sysdate,sysdate+100,1000,100,5,'n',sysdate,'n','test',35);
insert into auction_item values(141,'김구우표','독립운동가 김구 우표','김구우표.jpg',sysdate,sysdate+100,1000,100,2,'n',sysdate,'n','test',35);
insert into auction_item values(142,'김구우표','독립운동가 김구 우표','김구우표.jpg',sysdate,sysdate+100,1000,100,7,'n',sysdate,'n','test',35);
insert into auction_item values(143,'울트라맨 비디오 모음','개오래된 울트라맨 비디오 모음집','울트라맨.jpg',sysdate,sysdate+100,25000,2000,1,'n',sysdate,'n','test',32);
insert into auction_item values(144,'울트라맨 비디오 모음','개오래된 울트라맨 비디오 모음집','울트라맨.jpg',sysdate,sysdate+100,25000,2000,88,'n',sysdate,'n','test',32);
insert into auction_item values(145,'울트라맨 비디오 모음','개오래된 울트라맨 비디오 모음집','울트라맨.jpg',sysdate,sysdate+100,25000,2000,6,'n',sysdate,'n','test',32);
insert into auction_item values(146,'조선컴','98년도 조선컴 윈도우도 98임 올린사람도 98임','조선컴.jpg',sysdate,sysdate+100,90000,5000,23,'n',sysdate,'n','test',41);
insert into auction_item values(147,'조선컴','98년도 조선컴 윈도우도 98임 올린사람도 98임','조선컴.jpg',sysdate,sysdate+100,90000,5000,62,'n',sysdate,'n','test',41);
insert into auction_item values(148,'조선컴','98년도 조선컴 윈도우도 98임 올린사람도 98임','조선컴.jpg',sysdate,sysdate+100,90000,5000,53,'n',sysdate,'n','test',41);
insert into auction_item values(149,'조선컴','98년도 조선컴 윈도우도 98임 올린사람도 98임','조선컴.jpg',sysdate,sysdate+100,90000,5000,83,'n',sysdate,'n','test',41);
insert into auction_item values(150,'LG사인 야구배트','LG 박용택 사인 배트','박용택배트.jpg',sysdate,sysdate+100,1000000,50000,2,'n',sysdate,'n','test',42);
insert into auction_item values(151,'LG사인 야구배트','LG 박용택 사인 배트','박용택배트.jpg',sysdate,sysdate+100,1000000,50000,42,'n',sysdate,'n','test',42);
insert into auction_item values(152,'LG사인 야구배트','LG 박용택 사인 배트','박용택배트.jpg',sysdate,sysdate+100,1000000,50000,23,'n',sysdate,'n','test',42);
insert into auction_item values(153,'스왈로브 스키 시계','매우 비싼 스왈로브스키 시계','스왈로브스키시계.jpg',sysdate,sysdate+100,1000000,50000,64,'n',sysdate,'n','test',43);
insert into auction_item values(154,'스왈로브 스키 시계','매우 비싼 스왈로브스키 시계','스왈로브스키시계.jpg',sysdate,sysdate+100,1000000,50000,25,'n',sysdate,'n','test',43);
insert into auction_item values(155,'스왈로브 스키 시계','매우 비싼 스왈로브스키 시계','스왈로브스키시계.jpg',sysdate,sysdate+100,1000000,50000,28,'n',sysdate,'n','test',43);
