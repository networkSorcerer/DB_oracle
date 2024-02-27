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
