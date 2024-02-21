
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

comment on table t_member is '회원정보';
comment on column t_member.m_id is '회원 아이디';
comment on column t_member.m_passwd is '회원 비밀번호';
comment on column t_member.m_name is '회원명';
comment on column t_member.m_email is '회원 이메일';
comment on column t_member.m_tel is '회원 전화번호';
comment on column t_member.reg_date is '회원 등록일';

--회원등록을 해주세요 (레코드 수 : 2 이상)

insert into t_member(m_id, m_passwd,  m_email, m_tel)
values('javauser','java1234','홍길동','javagidong@naver.com','01066489645');

insert into t_member(m_id, m_passwd, m_name,m_email, m_tel)
values('khkhkh','khkhkh1234','금훈','khkhkhkh@naver.com','01095959595');

