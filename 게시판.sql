
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

--답변 게시판을 위한 컬럼 
-- REPORT, REPSTEP, REPINDENT

--DROP TABLE BOARD;
COMMENT ON TABLE BOARD IS '게시판 테이블';
COMMENT ON COLUMN BOARD.NUM IS '게시판 번호';
COMMENT ON COLUMN BOARD.AUTHOR IS '게시판 작성자';
COMMENT ON COLUMN BOARD.TITLE IS '게시판 제목';
COMMENT ON COLUMN BOARD.CONTENT IS '게시판 내용';
COMMENT ON COLUMN BOARD.WRITEDAY IS '게시판 등록일';
COMMENT ON COLUMN BOARD.READCNT IS '게시판 조회수';
COMMENT ON COLUMN BOARD.REPROOT IS '게시판 답변글(원래글의 번호 참조 - 그룹번호)';
COMMENT ON COLUMN BOARD.REPSTEP IS '게시판 답변글(답변글의 위치번호 지정)';
COMMENT ON COLUMN BOARD.REPINDENT IS '게시판 답변글(답변글의 계층번호 지정)';
COMMENT ON COLUMN BOARD.PASSWD IS '게시판 비밀번호';

--BOARD 게시판 테이블에 저장할 글 번호 시퀀스 (증가값 : 시퀀스명.NEXTVAL / 현재값 : 시퀀스명.CURRVAL)
CREATE SEQUENCE BOARD_SEQ START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE 
CACHE 2;

--DROP SEQUENCE BOARD_SEQ;

--일반 게시글 입력시 REPORT : NUM의 값. REPSTEP/REPINDENT : 0으로 입력하면 됩니다
SELECT * FROM BOARD;

INSERT INTO BOARD(NUM, AUTHOR, TITLE, CONTENT, REPROOT, REPSTEP, REPINDENT, PASSWD)
VALUES (BOARD_SEQ.NEXTVAL , '홍길동' , '노력에 관련된 명언',
'중요한 것은 목표를 이루는 것이 아니라 그 과정에서 무엇을 배우며 얼마나 성장했느냐 이다 - 앤드류 메튜스',
BOARD_SEQ.CURRVAL, 0, 0, '1234');

INSERT INTO BOARD(NUM, AUTHOR, TITLE, CONTENT, REPROOT, REPSTEP, REPINDENT, PASSWD)
VALUES (BOARD_SEQ.NEXTVAL , '홍길동' , '노력에 관련된 명언',
'중요한 것은 목표를 이루는 것이 아니라 그 과정에서 무엇을 배우며 얼마나 성장했느냐 이다 - 앤드류 메튜스',
BOARD_SEQ.CURRVAL, 0, 0, '1234');


select * from board;

--비밀번호 확인 (1 : 비밀번호 일치 / 0 : 비밀번호 불일치)

SELECT NVL((SELECT 1 FROM BOARD WHERE NUM=3 AND PASSWD = '1234'), 0) AS RESULT FROM DUAL;

--SELECT NVL((SELECT 1 FROM BOARD WHERE NUM = #{NUM} AND PASSWD = #{PASSWD} ), 0) AS RESULT FROM DUAL;

--게시판 수정

UPDATE BOARD SET TITLE = '수정확인', CONTENT = '수정합니다', PASSWD = '4321'
WHERE NUM =1;

--UPDATE BOARD SET TITLE=?, CONTENT = ?, PASSWD = ?
--WHERE NUM = ?

--게시판 삭제
DELETE FROM BOARD WHERE NUM=1;
--DELETE FROM BOARD WHERE NUM = ?;

-- 회원가입 테이블
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

comment on table member is '회원 정보';
comment on column member.num is '회원 번호';
comment on column member.m_id is '회원 아이디';
comment on column member.m_passwd is '회원 비밀번호';
comment on column member.m_name is '회원명';
comment on column member.m_email is '회원 이메일';   
comment on column member.m_tel is '회원 전화번호';   
comment on column member.reg_date is '회원 등록일'; 

-- 댓글 시퀀스 생성
create sequence member_seq start with 1
increment by 1
nocycle;

select * from member;
