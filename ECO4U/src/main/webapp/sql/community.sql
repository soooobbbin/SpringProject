--커뮤니티 게시판
create table community(
 c_num number not null,
 c_title varchar2(90) not null,
 c_content clob not null,
 c_uploadfile blob,
 c_filename varchar2(100),
 c_auth number(1) not null,
 c_hit number(8) default 0 not null,
 reg_date date default sysdate not null,
 modify_date date,
 c_category number(1) not null,
 mem_num number not null,
 constraint community_pk primary key (c_num),
 constraint community_fk1 foreign key (mem_num)
                       references member (mem_num)
);

create sequence community_seq;


--커뮤니티 댓글 테이블
create table c_comment (
   com_num number not null,
   com_content clob not null,
   reg_date date default sysdate not null,
   modify_date date,
   c_num number not null,
   mem_num number not null,
   constraint c_comment_pk primary key(com_num),
   constraint c_comment_fk1 foreign key (c_num) references community (c_num),
   constraint c_comment_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence c_comment_seq;

--커뮤니티 게시글 좋아요
create table c_like (
   c_like_num number not null,
   c_num number not null,
   mem_num number not null,
   constraint c_like_pk primary key(c_like_num),
   constraint c_like_fk1 foreign key (c_num) references community (c_num),
   constraint c_like_fk2 foreign key (mem_num) references member (mem_num)
);

create sequence c_like_seq;