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


--파일명을 위한 필드
alter table spring_board
add(b_file varchar2(500));

comment on column spring_board.b_file is '게시판 이미지 경로 및 파일명';

--썸네일을 위한 필드
--alter table spring_board
--add(b_thumb varchar2(500));

--comment on column spring_board.b_thumb is '게시판 썸네일 이미지 경로 및 파일명';

select * from spring_board;

create table spring_reply(
    r_num number not null,
    b_num number not null,
    r_name varchar2(15) not null,
    r_content varchar2(2000) not null,
    r_pwd varchar2(18) not null,
    r_date date default sysdate,
    constraint spring_reply_pk primary key(r_num),
    constraint spring_reply_fk foreign key(b_num)
        references spring_board(b_num)
);

comment on table spring_reply is '댓글 정보';
comment on column spring_reply.r_num is '댓글번호';
comment on column spring_reply.b_num is '게시판 글번호';
comment on  column spring_reply.r_name is '댓글 작성자';
comment on column spring_reply.r_content is '댓글 내용';
comment on column spring_reply.r_pwd is '댓글 비밀번호(본인글 확인)';

CREATE SEQUENCE spring_reply_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

select * from spring_reply;
select * from spring_board;
-- 예제 1
INSERT INTO spring_reply (r_num, b_num, r_name, r_content, r_pwd)
VALUES (spring_reply_seq.nextval, 1, 'John Doe', 'Great post!', 'password123');

-- 예제 2
INSERT INTO spring_reply (r_num, b_num, r_name, r_content, r_pwd)
VALUES (spring_reply_seq.nextval, 1, 'Jane Smith', 'I agree!', 'securepwd456');


-- 예제 1
INSERT INTO spring_reply (r_num, b_num, r_name, r_content, r_pwd)
VALUES (spring_reply_seq.nextval, 1, '늘한봄', '멈추지 말고 목표에 매진하라!', 'password123');

-- 예제 2
INSERT INTO spring_reply (r_num, b_num, r_name, r_content, r_pwd)
VALUES (spring_reply_seq.nextval, 1, '김철수', '꾸준함!', 'securepwd456');
