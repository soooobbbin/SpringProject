--회원관리
create table member(
 mem_num number not null,
 id varchar2(15) unique not null,
 auth number(1) default 2 not null, --탈퇴회원:0 일반회원:1 관리자:2
 constraint member_pk primary key (mem_num)
);

create sequence member_seq;

create table member_detail(
 mem_num number not null,
 mem_name varchar2(30) not null,
 mem_pw varchar2(15) not null,
 mem_cell varchar2(15) not null,
 mem_email varchar2(50) not null,
 reg_date date default sysdate not null,
 modify_date date,
 constraint member_detail_pk primary key (mem_num),
 constraint member_detail_fk1 foreign key (mem_num)
 				references member (mem_num)
);

--주소 관리
create table zipcode(
 zip_num number not null,
 zip_name varchar2(30) not null,
 zip_cell varchar2(15) not null,
 zip_rec  varchar2(15) not null,
 zip_auth number(1) not null, --0. 대표주소 / 1. 추가주소
 zip_zipcode varchar2(7) not null,
 zip_addr1 varchar2(100) not null,
 zip_addr2 varchar2(100) not null,
 mem_num number not null,
 constraint zipcode_pk primary key (zip_num),
 constraint zipcode_fk1 foreign key (mem_num) 
 				references member(mem_num)
);

create sequence zipcode_seq;
--가게

create table store(
 s_num number not null,
 s_name varchar2(30) not null,
 s_content CLOB not null,
 s_tel varchar2(15) not null,
 s_zipcode varchar2(7) not null,
 s_addr1 varchar2(100) not null,
 s_addr2 varchar2(100) not null,
 photo blob,
 photo_name varchar2(100),
 reg_date date default sysdate not null,
 modify_date date,
 constraint store_pk primary key (s_num)
);

create sequence store_seq;