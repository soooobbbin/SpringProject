--장바구니 테이블
create table cart( 
 cart_num number not null,
 order_quantity number(7) not null,
 reg_date date default sysdate not null,
 modify_date date,
 mem_num number not null,
 p_num number not null,
 constraint cart_pk primary key (cart_num),
 constraint cart_fk1 foreign key (mem_num) references member (mem_num),
 constraint cart_fk2 foreign key (p_num) references product (p_num)
);
create sequence cart_seq;

--찜
create table wish(
    w_num number not null,
    reg_date date default sysdate not null,
    modify_date date,
    mem_num number not null,
    p_num number not null,
    constraint wish_pk primary key (w_num),
    constraint wish_fk1 foreign key (mem_num) references member (mem_num),
    constraint wish_fk2 foreign key (p_num) references product (p_num)
);

create sequence wish_seq;
