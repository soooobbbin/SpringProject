--QnA
create table QnA(
 q_num number not null,
 q_title varchar2(30) not null,
 q_content clob not null,
 q_category number(1) not null, --1.회원문의 2.상품배송문의 3.기타
 reg_date date default sysdate not null,
 modify_date date,
 mem_num number not null,
 constraint QnA_pk primary key (q_num),
 constraint QnA_fk1 foreign key (mem_num) references member(mem_num)
);

--QnA_comment
create table QnA_comment(
 qc_num number not null,
 qc_content clob not null,
 reg_date date default sysdate not null,
 modify_date date,
 mem_num number not null,
 q_num number not null,
 constraint QnA_comment_pk primary key (qc_num),
 constraint QnA_comment_fk1 foreign key (mem_num) references member(mem_num),
 constraint QnA_comment_fk2 foreign key (q_num) references QnA(q_num)
);

--FAQ
create table FAQ(
 f_num number not null,
 f_title varchar2(30) not null,
 f_content clob not null,
 f_category number(1) not null,--1.회원문의 2.상품/배송문의 3.기타
 reg_date date default sysdate not null,
 modify_date date,
 mem_num number not null,
 constraint FAQ_pk primary key (f_num),
 constraint FAQ_fk1 foreign key (mem_num) references member(mem_num)
);

create sequence QnA_seq;
create sequence QnA_comment_seq;
create sequence FAQ_seq;