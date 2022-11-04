--회원
CREATE TABLE member (
	id	varchar(40)	NOT NULL primary key,
	password	varchar(100)	NOT NULL,
	name	varchar(20)	NOT NULL,
	nick_name	varchar(40)	NOT NULL,
	call	varchar(20)	NOT NULL,
	email	varchar(50)	NOT NULL,
	address	varchar(60)	NOT NULL,
	created_date	date	NOT NULL,
	del	char(1) DEFAULT 'n'	NOT NULL,
	authority	char(1) DEFAULT 'n'	NOT NULL,
	age	varchar(10) DEFAULT '20대'	NOT NULL,
	gender	char(1) DEFAULT 'm'	NOT NULL	
);
--경매 물품
CREATE TABLE auction_item (
	auction_no	number(10)	NOT NULL primary key,
	item_name	varchar(20)	NOT NULL,
	item_contents	varchar(300)	NOT NULL,
	item_img	varchar(200)	NOT NULL,
	start_date	date	NOT NULL,
	end_date	date	NOT NULL,
	start_price	number(10)	NOT NULL,
	min_bid	number(10)	NOT NULL,
	view_cnt	number(10)	NOT NULL,
	del	char(1) DEFAULT 'n'	NOT NULL,
	delivery	varchar(10)	NULL,
	reg_date	date	NOT NULL,
	pay	char(1) default 'n' NOT NULL,
	id	varchar(40)	NOT NULL references member(id),
	tag_no	number(10)	NOT NULL
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
	bid_date	number(10)	NOT NULL,
	id	varchar(40)	NOT NULL references member(id),
	auction_no	number(10)	NOT NULL references auction_item(auction_no)
);
--관심태그
CREATE TABLE interest_tag (
	it_tag_no	number(10)	NOT NULL primary key,
	id	varchar(40)	NOT NULL references member(id),
	tag_no number(10)	NOT NULL
);
--태그목록
CREATE TABLE tag (
	tag_no	number(10)	NOT NULL primary key,
	tag_name	varchar(20)	NOT NULL
);
--후기게시판 댓글
CREATE TABLE review_reply (
	re_reply_no	number(10)	NOT NULL primary key,
	reply_contents	varchar(100)	NOT NULL,
	del	char(1) 	DEFAULT 'n'	NOT NULL,
	reg_date	date	NOT NULL,
	up	char(1)	DEFAULT 'n'	NOT NULL,--수정여부
	id	varchar(40)	NOT NULL references member(id),
	review_no	number(10)	NOT NULL
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
select * from AUCTION_ITEM;
select * from tag;
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

insert into auction_item values(112,'배트맨 피규어','배트맨 피규어 한정판','배트맨.jpg',sysdate,sysdate+100,1000000,50000,0,'n',sysdate,'n','test',31);