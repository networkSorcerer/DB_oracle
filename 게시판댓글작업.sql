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

comment on table spring_reply is '��� ����';
comment on column spring_reply.r_num is '��۹�ȣ';
comment on column spring_reply.b_num is '�Խ��� �۹�ȣ';
comment on  column spring_reply.r_name is '��� �ۼ���';
comment on column spring_reply.r_content is '��� ����';
comment on column spring_reply.r_pwd is '��� ��й�ȣ(���α� Ȯ��)';

CREATE SEQUENCE spring_reply_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


-- ���� 1
INSERT INTO spring_reply (r_num, b_num, r_name, r_content, r_pwd)
VALUES (spring_reply_seq.nextval, 1, 'John Doe', 'Great post!', 'password123');

-- ���� 2
INSERT INTO spring_reply (r_num, b_num, r_name, r_content, r_pwd)
VALUES (spring_reply_seq.nextval, 1, 'Jane Smith', 'I agree!', 'securepwd456');


-- ���� 1
INSERT INTO spring_reply (r_num, b_num, r_name, r_content, r_pwd)
VALUES (spring_reply_seq.nextval, 1, '���Ѻ�', '������ ���� ��ǥ�� �����϶�!', 'password123');

-- ���� 2
INSERT INTO spring_reply (r_num, b_num, r_name, r_content, r_pwd)
VALUES (spring_reply_seq.nextval, 1, '��ö��', '������!', 'securepwd456');
