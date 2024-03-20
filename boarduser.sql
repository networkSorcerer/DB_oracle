--���̺� ����
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

comment on table spring_board is '�Խ��� ����';
comment on column spring_board.b_num is '�Խ��Ǽ���';
comment on column spring_board.b_name is '�Խ����ۼ���';
comment on column spring_board.b_title is '�Խ�������';
comment on column spring_board.b_content is '�Խ��ǳ���';
comment on column spring_board.b_pwd is '�Խ��Ǻ�й�ȣ';
comment on column spring_board.b_date is '�Խ��ǵ����';

create sequence spring_board_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

--drop sequence spring_board_seq;


insert into spring_board(b_num, b_name, b_title, b_content, b_pwd)
values(spring_board_seq.nextval, 'ȫ�浿', '���� �� ���� �Ǵ� ���',
'������ ���� ���� ���ٽɳ��� ����, �� �� �ִ� ��ŭ �ּ��� ������.','1234');

select * from spring_board order by b_num desc;


--�Խ��� ��ȸ �� �߰� (readcnt)
alter table spring_board
add(readcnt number default 0);

comment on column spring_board.readcnt is '�Խ��� ��ȸ��';

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

comment on table spring_admin is '������ ���̺� ����';
comment on column spring_admin.a_id is '������ ���̵�';
comment on column spring_admin.a_pwd is '������ ��й�ȣ';
comment on column spring_admin.a_name is '������ �̸�';
comment on column spring_admin.a_phone is '������ �ڵ�����ȣ';
comment on column spring_admin.a_email is '������ �̸���';
comment on column spring_admin.a_date is '������ �����';

select * from spring_admin;

--spring_admin ���̺� ���ڵ� 1�� �Է��� �ּ���
insert into spring_admin (a_id, a_pwd, a_name, a_phone, a_email)
values('javaadmin','java1234','ȫ�浿','010-1235-8945','cat1210@naver.com');

--�α��� ó�� ������
select a_id, a_name, a_email
from spring_admin
where a_id = 'javaadmin' and a_pwd = 'java1234';


--���ϸ��� ���� �ʵ�
alter table spring_board
add(b_file varchar2(500));

comment on column spring_board.b_file is '�Խ��� �̹��� ��� �� ���ϸ�';

--������� ���� �ʵ�
--alter table spring_board
--add(b_thumb varchar2(500));

--comment on column spring_board.b_thumb is '�Խ��� ����� �̹��� ��� �� ���ϸ�';

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

select * from spring_reply;
select * from spring_board;
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
