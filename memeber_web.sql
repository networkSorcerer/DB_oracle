
select msg_no, local_nm, type, nm, nm_sub, description, list_img from chungnam;

create table t_member (
    m_id varchar2(15) not null,
    m_passwd varchar2(15) not null,
    m_name varchar2(18) not null,
    m_email varchar2(100) not null,
    m_tel varchar2(15) not null,
    reg_date date default sysdate,
    constraint t_member_pk primary key(m_id)
);

comment on table t_member is 'ȸ������';
comment on column t_member.m_id is 'ȸ�� ���̵�';
comment on column t_member.m_passwd is 'ȸ�� ��й�ȣ';
comment on column t_member.m_name is 'ȸ����';
comment on column t_member.m_email is 'ȸ�� �̸���';
comment on column t_member.m_tel is 'ȸ�� ��ȭ��ȣ';
comment on column t_member.reg_date is 'ȸ�� �����';

--ȸ������� ���ּ��� (���ڵ� �� : 2 �̻�)

insert into t_member(m_id, m_passwd,  m_email, m_tel)
values('javauser','java1234','ȫ�浿','javagidong@naver.com','01066489645');

insert into t_member(m_id, m_passwd, m_name,m_email, m_tel)
values('khkhkh','khkhkh1234','����','khkhkhkh@naver.com','01095959595');

