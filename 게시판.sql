
CREATE TABLE BOARD (
NUM NUMBER (4) NOT NULL,
AUTHOR VARCHAR2(20) NOT NULL,
TITLE VARCHAR2(500) NOT NULL,
CONTENT VARCHAR2(4000) NOT NULL,
WRITEDAY DATE DEFAULT SYSDATE,
READCNT NUMBER (4) DEFAULT 0,
REPROOT NUMBER (4),
REPSTEP NUMBER(4),
REPINDENT NUMBER(4),
PASSWD VARCHAR2(12) NOT NULL,
CONSTRAINT BOARD_PK PRIMARY KEY(NUM)
);

--�亯 �Խ����� ���� �÷� 
-- REPORT, REPSTEP, REPINDENT

--DROP TABLE BOARD;
COMMENT ON TABLE BOARD IS '�Խ��� ���̺�';
COMMENT ON COLUMN BOARD.NUM IS '�Խ��� ��ȣ';
COMMENT ON COLUMN BOARD.AUTHOR IS '�Խ��� �ۼ���';
COMMENT ON COLUMN BOARD.TITLE IS '�Խ��� ����';
COMMENT ON COLUMN BOARD.CONTENT IS '�Խ��� ����';
COMMENT ON COLUMN BOARD.WRITEDAY IS '�Խ��� �����';
COMMENT ON COLUMN BOARD.READCNT IS '�Խ��� ��ȸ��';
COMMENT ON COLUMN BOARD.REPROOT IS '�Խ��� �亯��(�������� ��ȣ ���� - �׷��ȣ)';
COMMENT ON COLUMN BOARD.REPSTEP IS '�Խ��� �亯��(�亯���� ��ġ��ȣ ����)';
COMMENT ON COLUMN BOARD.REPINDENT IS '�Խ��� �亯��(�亯���� ������ȣ ����)';
COMMENT ON COLUMN BOARD.PASSWD IS '�Խ��� ��й�ȣ';

--BOARD �Խ��� ���̺� ������ �� ��ȣ ������ (������ : ��������.NEXTVAL / ���簪 : ��������.CURRVAL)
CREATE SEQUENCE BOARD_SEQ START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE 
CACHE 2;

--DROP SEQUENCE BOARD_SEQ;

--�Ϲ� �Խñ� �Է½� REPORT : NUM�� ��. REPSTEP/REPINDENT : 0���� �Է��ϸ� �˴ϴ�
SELECT * FROM BOARD;

INSERT INTO BOARD(NUM, AUTHOR, TITLE, CONTENT, REPROOT, REPSTEP, REPINDENT, PASSWD)
VALUES (BOARD_SEQ.NEXTVAL , 'ȫ�浿' , '��¿� ���õ� ���',
'�߿��� ���� ��ǥ�� �̷�� ���� �ƴ϶� �� �������� ������ ���� �󸶳� �����ߴ��� �̴� - �ص�� ��Ʃ��',
BOARD_SEQ.CURRVAL, 0, 0, '1234');

INSERT INTO BOARD(NUM, AUTHOR, TITLE, CONTENT, REPROOT, REPSTEP, REPINDENT, PASSWD)
VALUES (BOARD_SEQ.NEXTVAL , 'ȫ�浿' , '��¿� ���õ� ���',
'�߿��� ���� ��ǥ�� �̷�� ���� �ƴ϶� �� �������� ������ ���� �󸶳� �����ߴ��� �̴� - �ص�� ��Ʃ��',
BOARD_SEQ.CURRVAL, 0, 0, '1234');


select * from board;

--��й�ȣ Ȯ�� (1 : ��й�ȣ ��ġ / 0 : ��й�ȣ ����ġ)

SELECT NVL((SELECT 1 FROM BOARD WHERE NUM=3 AND PASSWD = '1234'), 0) AS RESULT FROM DUAL;

--SELECT NVL((SELECT 1 FROM BOARD WHERE NUM = #{NUM} AND PASSWD = #{PASSWD} ), 0) AS RESULT FROM DUAL;

--�Խ��� ����

UPDATE BOARD SET TITLE = '����Ȯ��', CONTENT = '�����մϴ�', PASSWD = '4321'
WHERE NUM =1;

--UPDATE BOARD SET TITLE=?, CONTENT = ?, PASSWD = ?
--WHERE NUM = ?

--�Խ��� ����
DELETE FROM BOARD WHERE NUM=1;
--DELETE FROM BOARD WHERE NUM = ?;

-- ȸ������ ���̺�
create table member(
	num number,
	m_id varchar2(12)      not null,
	m_passwd varchar2(15)  not null,
	m_name varchar(15)     not null,
	m_email varchar2(80)   not null,
	m_tel varchar2(15)     not null,
	reg_date date default sysdate,
	constraint member_pk primary key(num),
	constraint member_uk unique(m_id)
);

comment on table member is 'ȸ�� ����';
comment on column member.num is 'ȸ�� ��ȣ';
comment on column member.m_id is 'ȸ�� ���̵�';
comment on column member.m_passwd is 'ȸ�� ��й�ȣ';
comment on column member.m_name is 'ȸ����';
comment on column member.m_email is 'ȸ�� �̸���';   
comment on column member.m_tel is 'ȸ�� ��ȭ��ȣ';   
comment on column member.reg_date is 'ȸ�� �����'; 

-- ��� ������ ����
create sequence member_seq start with 1
increment by 1
nocycle;

select * from member;
