--테이블 생성
create table spring_board(
    b_num number not null ,
    b_name varchar2(15) not null ,
    b_title varchar2(1000) not null,
    b_content clob,
    b_pwd varchar2(18) not null,
    b_date date default sysdate
);

--drop table spring_board;

select * from spring_board;

alter table spring_board
add constraint spring_board_pk primary key(b_num);

comment on table spring_board is '게시판 정보';
comment on column spring_board.b_num is '게시판순번';
comment on column spring_board.b_name is '게시판작성자';
comment on column spring_board.b_title is '게시판제목';
comment on column spring_board.b_content is '게시판내용';
comment on column spring_board.b_pwd is '게시판비밀번호';
comment on column spring_board.b_date is '게시판등록일';

create sequence spring_board_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

--drop sequence spring_board_seq;


insert into spring_board(b_num, b_name, b_title, b_content, b_pwd)
values(spring_board_seq.nextval, '홍길동', '힘들 때 힘이 되는 명언',
'조급해 하지 말고 조바심내지 말고, 할 수 있는 만큼 최선을 다하자.','1234');

select * from spring_board order by b_num desc;


--게시판 조회 수 추가 (readcnt)
alter table spring_board
add(readcnt number default 0);

comment on column spring_board.readcnt is '게시판 조회수';

create table spring_admin (
    a_id varchar2(15) not null,
    a_pwd varchar2(20) not null,
    a_name varchar2(21) not null,
    a_phone varchar2(15) not null,
    a_email varchar2(100) not null,
    a_date date default sysdate,
    constraint spring_admin_pk primary key(a_id)
);

--drop Table spring_admin;

comment on table spring_admin is '관리자 테이블 정보';
comment on column spring_admin.a_id is '관리자 아이디';
comment on column spring_admin.a_pwd is '관리자 비밀번호';
comment on column spring_admin.a_name is '관리자 이름';
comment on column spring_admin.a_phone is '관리자 핸드폰번호';
comment on column spring_admin.a_email is '관리자 이메일';
comment on column spring_admin.a_date is '관리자 등록일';

select * from spring_admin;

--spring_admin 테이블에 레코드 1를 입력해 주세요
insert into spring_admin (a_id, a_pwd, a_name, a_phone, a_email)
values('javaadmin','java1234','홍길동','010-1235-8945','cat1210@naver.com');

--로그인 처리 쿼리문
select a_id, a_name, a_email
from spring_admin
where a_id = 'javaadmin' and a_pwd = 'java1234';

describe spring_board;
describe board_reply;
