--주문 테이블
create table orders(
    o_num number not null,
    o_name varchar2(300) not null,
    o_total number(8) not null,
    payment number(1) not null,
    notice varchar2(600),
    reg_date date default sysdate not null,
    modify_date date,
    p_num number not null,
    mem_num number not null,
    zip_num number not null,
    constraint orders_pk primary key (o_num),
    constraint orders_fk1 foreign key (p_num) references product (p_num),
    constraint orders_fk2 foreign key (mem_num) references member (mem_num),
    constraint orders_fk3 foreign key (zip_num) references zipcode (zip_num)
);

create sequence orders_seq;

--주문 상세 테이블
create table order_detail(
   od_num number not null,
   item_num number not null,
   item_name varchar2(30) not null,
   item_price number(8) not null,
   item_total number(8) not null,
   od_quantity number(7) not null,
   o_num number not null,
   constraint order_detail_pk primary key (od_num),
   constraint order_detail_fk1 foreign key (o_num) references orders (o_num)
);

create sequence order_detail_seq;

--배송 테이블
create table deliver( 
 d_num number not null,
 d_status number(1) not null,
 reg_date date default sysdate not null,
 modify_date date,
 zip_num number not null,
 mem_num number not null,
 p_num number not null,
 o_num number not null,
 constraint deliver_pk primary key (d_num),
 constraint deliver_fk1 foreign key (zip_num) references zipcode (zip_num),
 constraint deliver_fk2 foreign key (mem_num) references member (mem_num),
 constraint deliver_fk3 foreign key (p_num) references product (p_num),
 constraint deliver_fk4 foreign key (o_num) references orders (o_num)
);

create sequence deliver_seq;
