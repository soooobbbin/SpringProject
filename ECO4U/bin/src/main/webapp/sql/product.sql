 -- 상품테이블
create table product(
 p_num number not null,
 p_name varchar2(30) not null,
 p_price number(8) not null,
 p_dprice number(8) not null,
 p_quantity number(8) not null,
 p_brand varchar2(30) not null,
 p_photo blob not null,
 p_cont1 clob not null,
 p_cont2 clob not null,
 p_status number(1) not null, --1.표시 2.미표시
 p_category number(1) not null, --1.리빙 2.뷰티 3.패션
 reg_date date default sysdate not null,
 modify_date date,
 constraint product_pk primary key (p_num)
);

--상품 리뷰 테이블
create table p_review( 
 r_num number not null,
 r_title varchar2(30) not null,
 r_content clob not null,
 r_photo blob,
 reg_date date default sysdate not null,
 modify_date date,
 p_num number not null,
 mem_num number not null,
 constraint p_review_pk primary key (r_num),
 constraint p_review_fk1 foreign key (p_num)
 				references product (p_num),
 constraint p_review_fk2 foreign key (mem_num)
 				references member (mem_num)
);

--상품 리뷰 좋아요 테이블
create table r_like( 
 r_like_num number not null,
 r_num number not null,
 mem_num number not null,
 constraint r_like_pk primary key (r_like_num),
 constraint r_like_fk1 foreign key (r_num)
 				references p_review (r_num),
 constraint r_like_fk2 foreign key (mem_num)
 				references member (mem_num)
);

create sequence product_seq;
create sequence p_review_seq;
create sequence r_like_seq;