CREATE TABLE users (
	user_id	varchar2(20)		NOT NULL,
	user_pwd	varchar2(30)		NOT NULL,
	user_name	varchar2(50)		NOT NULL,
	user_phone	varchar2(20)		NOT NULL,
	user_email	varchar2(50)		NOT NULL,
	user_act	number	DEFAULT 1	NOT NULL,
	user_repcnt	number	DEFAULT 0	NOT NULL,
	user_date	date	DEFAULT sysdate	NOT NULL,
	user_volcnt	number	DEFAULT 0	NOT NULL,
	user_level	number	DEFAULT 1	NOT NULL,
	user_adoptchk	number	DEFAULT 0	NOT NULL
);



COMMENT ON COLUMN users.user_id IS '회원은 ID로 구분';

COMMENT ON COLUMN users.user_phone IS '중복 불가';

COMMENT ON COLUMN users.user_email IS '중복 불가';

COMMENT ON COLUMN users.user_act IS '상태코드분류 1: 활동, 2: 활동중지, 0: 탈퇴(비활동) .  기본값은 1';

COMMENT ON COLUMN users.user_repcnt IS '관리자가 회원에 신고제재할 때마다 누적되는 횟수이다.  기본값은 0.';

COMMENT ON COLUMN users.user_date IS '시스템 날짜로 입력됨.';

COMMENT ON COLUMN users.user_volcnt IS '봉사 할때마다 1씩 증가';

COMMENT ON COLUMN users.user_level IS '봉사횟수가 3회 마다 1씩 증가';

COMMENT ON COLUMN users.user_adoptchk IS '입양한 경우 1';

CREATE TABLE admin (
	admin_id	varchar2(20)		NOT NULL,
	admin_pwd	varchar2(30)		NOT NULL
);


COMMENT ON COLUMN admin.admin_id IS '관리자는 한 명으로 가정하였습니다.';

CREATE TABLE volunteer (
	volunteer_id	number		NOT NULL,
	volunteer_detail	varchar2(2000)		NOT NULL,
	volunteer_date	date	DEFAULT sysdate	NOT NULL,
	volunteer_title	varchar2(100)		NOT NULL,
	volunteer_cnt	number	DEFAULT 0	NOT NULL,
	volunteer_time	varchar2(30)		NOT NULL,
	volunteer_due	varchar2(30)		NOT NULL,
	volunteer_limit	number		NOT NULL,
	volunteer_cost	varchar2(20)	DEFAULT '없음'	NOT NULL,
	volunteer_location	varchar2(100)		NOT NULL,
	volunteer_progress	number	DEFAULT 0	NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);


COMMENT ON COLUMN volunteer.volunteer_date IS '작성한 당일로 입력';

COMMENT ON COLUMN volunteer.volunteer_progress IS '신청 가능 일자와 모집 인원에 따라 0 : 모집 전, 1 : 모집 중, 2 : 모집완료,  3 : 모집 종료 로 나뉜다.';

COMMENT ON COLUMN volunteer.admin_id IS '관리자는 한 명으로 가정하였습니다.';

CREATE TABLE adoption (
	adoption_id	number		NOT NULL,
	adoption_content	varchar2(2000)		NOT NULL,
	adoption_date	date	DEFAULT sysdate	NOT NULL,
	adoption_title	varchar2(100)		NOT NULL,
	adoption_cnt	number	DEFAULT 0	NOT NULL,
	adoption_status	varchar2(20)	DEFAULT '공고중'	NOT NULL,
	adoption_level	varchar2(20)		NOT NULL,
	admin_id	varchar2(20)		NOT NULL,
	animal_id	number		NOT NULL
);

COMMENT ON COLUMN adoption.adoption_level IS '입양 공고의 동물마다 레벨 제한이 달라짐';

COMMENT ON COLUMN adoption.admin_id IS '관리자는 한 명으로 가정하였습니다.';

CREATE TABLE freeBoard (
	fboard_id	number		NOT NULL,
	fboard_title	varchar2(80)		NOT NULL,
	fboard_content	varchar2(2000)		NOT NULL,
	fboard_like	number	DEFAULT 0	NOT NULL,
	fboard_cnt	number	DEFAULT 0	NOT NULL,
	fboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN freeBoard.fboard_id IS '자유게시판에 작성된 글의 고유번호';

COMMENT ON COLUMN freeBoard.fboard_like IS '버튼클릭시 +1, 한번 더 클릭시 -1';

COMMENT ON COLUMN freeBoard.fboard_cnt IS '날짜/조회수/좋아요수 순으로 정렬가능';

COMMENT ON COLUMN freeBoard.fboard_date IS '게시글이 작성된 날짜 및 시간 표시';

COMMENT ON COLUMN freeBoard.user_id IS '회원은 ID로 구분';

CREATE TABLE Fcomment (
	fcomment_id	number		NOT NULL,
	fcomment_content	varchar2(150)		NOT NULL,
	fcomment_date	date	DEFAULT sysdate	NOT NULL,
	fboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN Fcomment.fcomment_id IS '자유글 댓글 고유ID';

COMMENT ON COLUMN Fcomment.fboard_id IS '자유게시판에 작성된 글의 고유번호';

COMMENT ON COLUMN Fcomment.user_id IS '회원은 ID로 구분';

CREATE TABLE counseling (
	counseling_id	number		NOT NULL,
	counseling_schedule	date		NOT NULL,
	user_id	varchar2(20)		NOT NULL,
	adoption_id	number		NOT NULL,
	counseling_date	date	DEFAULT sysdate	NOT NULL,
	counseling_judgment	varchar2(20)	DEFAULT '미확인'	NOT NULL,
	counseling_detail	varchar2(2000)		NULL,
	counseling_age	number		NOT NULL,
	counseling_address	varchar2(100)		NOT NULL,
	counseling_job	varchar2(40)		NOT NULL,
	counseling_adopt	number	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN counseling.user_id IS '회원은 ID로 구분';

COMMENT ON COLUMN counseling.counseling_judgment IS '관리자만 수정가능';

COMMENT ON COLUMN counseling.counseling_detail IS '관리자만 조회 수정 삭제';

COMMENT ON COLUMN counseling.counseling_adopt IS '0 : 입양 , 1 : 임시보호';

CREATE TABLE application (
	application_id	number		NOT NULL,
	application_date	date	DEFAULT sysdate	NOT NULL,
	application_comment	varchar2(150)		NULL,
	user_id	varchar2(20)		NOT NULL,
	volunteer_id	number		NOT NULL,
	application_result	number	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN application.application_date IS '당일 로 입력되게 한다';

COMMENT ON COLUMN application.user_id IS '회원은 ID로 구분';

COMMENT ON COLUMN application.application_result IS '이행시 1 이행 하지 않을시 0그대로';

CREATE TABLE donate (
	donate_ID	number		NOT NULL,
	donate_Price	number		NOT NULL,
	donate_Day	date	DEFAULT sysdate	NOT NULL,
	donate_PM	varchar2(30)		NOT NULL,
	donate_FDay	date	DEFAULT sysdate	NOT NULL,
	donate_sprice	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL,
	donate_AHName	varchar2(21)		NOT NULL,
	donate_AHPhone	varchar2(30)		NOT NULL
);

COMMENT ON COLUMN donate.donate_PM IS '카드결제로만 가능하다';

COMMENT ON COLUMN donate.user_id IS '회원은 ID로 구분';

CREATE TABLE animal (
	animal_id	number		NOT NULL,
	animal_species	varchar2(50)		NOT NULL,
	animal_age	varchar2(50)		NOT NULL,
	animal_gender	varchar2(50)		NOT NULL,
	animal_status	varchar2(50)		NOT NULL,
	animal_kg	varchar2(50)		NOT NULL,
	animal_color	varchar2(50)		NOT NULL,
	animal_memo	varchar2(2000)		NOT NULL,
	admin_id	varchar2(20)		NOT NULL,
	animal_temp	number	DEFAULT 0	NOT NULL,
	animal_regist	date	DEFAULT sysdate	NOT NULL,
	animal_name	varchar2(50)		NOT NULL
);

COMMENT ON COLUMN animal.animal_species IS '강아지 또는 고양이';

COMMENT ON COLUMN animal.admin_id IS '관리자는 한 명으로 가정하였습니다.';

COMMENT ON COLUMN animal.animal_temp IS '0 : 불가능 1 : 호스피스 2 : 장기체류 3: 심장사상충';


CREATE TABLE flike (
	flike_id	number		NOT NULL,
	fliuser_id	varchar2(20)		NOT NULL,
	fboard_id	number		NOT NULL,
	flike_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN flike.fliuser_id IS '좋아요 누른 회원 ID';

CREATE TABLE noticeBoard (
	nboard_id	number		NOT NULL,
	nboard_title	varchar2(80)		NOT NULL,
	nboard_content	varchar2(2000)		NOT NULL,
	nboard_date	date	DEFAULT sysdate	NOT NULL,
	nboard_cnt	number	DEFAULT 0	NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN noticeBoard.nboard_id IS '공지게시판에 작성된 글의 고유번호';

COMMENT ON COLUMN noticeBoard.nboard_date IS '게시글이 작성된 날짜 및 시간 표시';

COMMENT ON COLUMN noticeBoard.nboard_cnt IS '글 페이지 접속할때마다 조회수 1증가';

COMMENT ON COLUMN noticeBoard.admin_id IS '관리자는 한 명으로 가정하였습니다.';

CREATE TABLE image (
	image_id	number		NOT NULL,
	board_sort	number		NOT NULL,
	image_name	varchar2(20)		NOT NULL,
	adoption_id	number		NULL,
	animal_id	number		NULL,
	nboard_id	number		NULL,
	volunteer_id	number		NULL,
	fboard_id	number		NULL,
	vfboard_id	number		NULL,
	afboard_id	number		NULL
);

COMMENT ON COLUMN image.board_sort IS '1.유기동물, 2.입양공고, 3.봉사공고, 4.자유게시판, 5.공지게시판, 6.봉사후기, 7.입양후기';

COMMENT ON COLUMN image.nboard_id IS '공지게시판에 작성된 글의 고유번호';

COMMENT ON COLUMN image.fboard_id IS '자유게시판에 작성된 글의 고유번호';

CREATE TABLE volunteerFeedbackBoard (
	vfboard_id	number		NOT NULL,
	vfboard_title	varchar2(80)		NOT NULL,
	vfboard_content	varchar2(2000)		NOT NULL,
	vfboard_like	number	DEFAULT 0	NOT NULL,
	vfboard_cnt	number	DEFAULT 0	NOT NULL,
	vfboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN volunteerFeedbackBoard.user_id IS '회원은 ID로 구분';

CREATE TABLE adoptionFeedbackBoard (
	afboard_id	number		NOT NULL,
	afboard_title	varchar2(80)		NOT NULL,
	afboard_content	varchar2(2000)		NOT NULL,
	afboard_like	number	DEFAULT 0	NOT NULL,
	afboard_cnt	number	DEFAULT 0	NOT NULL,
	afboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN adoptionFeedbackBoard.user_id IS '회원은 ID로 구분';

CREATE TABLE survey (
	survey_id	number		NOT NULL,
	survey_a1	varchar2(100)		NOT NULL,
	survey_a2	varchar2(100)		NOT NULL,
	survey_a3	varchar2(100)		NOT NULL,
	survey_a4	varchar2(100)		NOT NULL,
	survey_a5	varchar2(100)		NOT NULL,
	survey_a6	varchar2(100)		NOT NULL,
	survey_a7	varchar2(100)		NOT NULL,
	survey_a8	varchar2(1000)		NOT NULL,
	counseling_id	number		NOT NULL
);

COMMENT ON COLUMN survey.survey_id IS '설문 고유 ID';

COMMENT ON COLUMN survey.counseling_id IS '예약 고유 ID';

CREATE TABLE VFcomment (
	vfcomment_id	number		NOT NULL,
	vfcomment_content	varchar2(150)		NOT NULL,
	vfcomment_date	date	DEFAULT sysdate	NOT NULL,
	vfboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN VFcomment.vfcomment_id IS '봉사후기글 댓글 고유ID';

COMMENT ON COLUMN VFcomment.vfcomment_content IS '봉사후기 댓글 내용';

COMMENT ON COLUMN VFcomment.user_id IS '회원은 ID로 구분';

CREATE TABLE AFcomment (
	afcomment_id	number		NOT NULL,
	afcomment_content	varchar2(150)		NOT NULL,
	afcomment_date	date	DEFAULT sysdate	NOT NULL,
	afboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN AFcomment.user_id IS '회원은 ID로 구분';

CREATE TABLE VFlike (
	vflike_id	number		NOT NULL,
	vfliuser_id	varchar2(20)		NOT NULL,
	vflike_date	date	DEFAULT sysdate	NOT NULL,
	vfboard_id	number		NOT NULL
);

COMMENT ON COLUMN VFlike.vfliuser_id IS '좋아요 누른 회원 ID';

CREATE TABLE AFlike (
	aflike_id	number		NOT NULL,
	afliuser_id	varchar2(20)		NOT NULL,
	aflike_date	date	DEFAULT sysdate	NOT NULL,
	afboard_id	number		NOT NULL
);

COMMENT ON COLUMN AFlike.afliuser_id IS '좋아요 누른 회원 ID';

CREATE TABLE report (
	report_id	number		NOT NULL,
	report_sort	number		NOT NULL,
	report_date	date	DEFAULT sysdate	NOT NULL,
	report_detail	varchar2(2000)		NULL,
	report_status	number	DEFAULT 1	NOT NULL,
	fboard_id	number		NULL,
	fcomment_id	number		NULL,
	vfboard_id	number		NULL,
	vfcomment_id	number		NULL,
	afcomment_id	number		NULL,
	afboard_id	number		NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN report.report_date IS '1. 욕설 / 2. 도배 / 3. 광고 / 4. 기타';

COMMENT ON COLUMN report.report_status IS '1. 신고됨 / 2. 처리됨';

COMMENT ON COLUMN report.fboard_id IS '자유게시판에 작성된 글의 고유번호';

COMMENT ON COLUMN report.fcomment_id IS '자유글 댓글 고유ID';

COMMENT ON COLUMN report.vfcomment_id IS '봉사후기글 댓글 고유ID';

COMMENT ON COLUMN report.user_id IS '신고한 회원 ID';

CREATE TABLE sanction (
	sanction_id	number		NOT NULL,
	sanction_status	number		NOT NULL,
	sanction_result	number		NOT NULL,
	sanction_date	date	DEFAULT sysdate	NOT NULL,
	report_id	number		NOT NULL
);

COMMENT ON COLUMN sanction.sanction_status IS '1. 신고제재 / 2. 신고무시';

COMMENT ON COLUMN sanction.sanction_result IS '1. 게시글삭제 / 2. 유저활동정지 / 3. 계정삭제';

ALTER TABLE users ADD CONSTRAINT PK_USERS PRIMARY KEY (
	user_id
);

ALTER TABLE admin ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
	admin_id
);

ALTER TABLE volunteer ADD CONSTRAINT PK_VOLUNTEER PRIMARY KEY (
	volunteer_id
);

ALTER TABLE adoption ADD CONSTRAINT PK_ADOPTION PRIMARY KEY (
	adoption_id
);

ALTER TABLE freeBoard ADD CONSTRAINT PK_FREEBOARD PRIMARY KEY (
	fboard_id
);

ALTER TABLE Fcomment ADD CONSTRAINT PK_FCOMMENT PRIMARY KEY (
	fcomment_id
);

ALTER TABLE counseling ADD CONSTRAINT PK_COUNSELING PRIMARY KEY (
	counseling_id
);

ALTER TABLE application ADD CONSTRAINT PK_APPLICATION PRIMARY KEY (
	application_id
);

ALTER TABLE donate ADD CONSTRAINT PK_DONATE PRIMARY KEY (
	donate_ID
);

ALTER TABLE animal ADD CONSTRAINT PK_ANIMAL PRIMARY KEY (
	animal_id
);

ALTER TABLE flike ADD CONSTRAINT PK_FLIKE PRIMARY KEY (
	flike_id
);

ALTER TABLE noticeBoard ADD CONSTRAINT PK_NOTICEBOARD PRIMARY KEY (
	nboard_id
);

ALTER TABLE image ADD CONSTRAINT PK_IMAGE PRIMARY KEY (
	image_id
);

ALTER TABLE volunteerFeedbackBoard ADD CONSTRAINT PK_VOLUNTEERFEEDBACKBOARD PRIMARY KEY (
	vfboard_id
);

ALTER TABLE adoptionFeedbackBoard ADD CONSTRAINT PK_ADOPTIONFEEDBACKBOARD PRIMARY KEY (
	afboard_id
);

ALTER TABLE survey ADD CONSTRAINT PK_SURVEY PRIMARY KEY (
	survey_id
);

ALTER TABLE VFcomment ADD CONSTRAINT PK_VFCOMMENT PRIMARY KEY (
	vfcomment_id
);

ALTER TABLE AFcomment ADD CONSTRAINT PK_AFCOMMENT PRIMARY KEY (
	afcomment_id
);

ALTER TABLE VFlike ADD CONSTRAINT PK_VFLIKE PRIMARY KEY (
	vflike_id
);

ALTER TABLE AFlike ADD CONSTRAINT PK_AFLIKE PRIMARY KEY (
	aflike_id
);

ALTER TABLE report ADD CONSTRAINT PK_REPORT PRIMARY KEY (
	report_id
);

ALTER TABLE sanction ADD CONSTRAINT PK_SANCTION PRIMARY KEY (
	sanction_id
);

ALTER TABLE volunteer ADD CONSTRAINT FK_admin_TO_volunteer_1 FOREIGN KEY (
	admin_id
)
REFERENCES admin (
	admin_id
);

ALTER TABLE adoption ADD CONSTRAINT FK_admin_TO_adoption_1 FOREIGN KEY (
	admin_id
)
REFERENCES admin (
	admin_id
);

ALTER TABLE adoption ADD CONSTRAINT FK_animal_TO_adoption_1 FOREIGN KEY (
	animal_id
)
REFERENCES animal (
	animal_id
);

ALTER TABLE freeBoard ADD CONSTRAINT FK_users_TO_freeBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE Fcomment ADD CONSTRAINT FK_freeBoard_TO_Fcomment_1 FOREIGN KEY (
	fboard_id
)
REFERENCES freeBoard (
	fboard_id
);

ALTER TABLE Fcomment ADD CONSTRAINT FK_users_TO_Fcomment_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE counseling ADD CONSTRAINT FK_users_TO_counseling_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE counseling ADD CONSTRAINT FK_adoption_TO_counseling_1 FOREIGN KEY (
	adoption_id
)
REFERENCES adoption (
	adoption_id
);

ALTER TABLE application ADD CONSTRAINT FK_users_TO_application_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE application ADD CONSTRAINT FK_volunteer_TO_application_1 FOREIGN KEY (
	volunteer_id
)
REFERENCES volunteer (
	volunteer_id
);

ALTER TABLE donate ADD CONSTRAINT FK_users_TO_donate_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE animal ADD CONSTRAINT FK_admin_TO_animal_1 FOREIGN KEY (
	admin_id
)
REFERENCES admin (
	admin_id
);

ALTER TABLE flike ADD CONSTRAINT FK_users_TO_flike_1 FOREIGN KEY (
	fliuser_id
)
REFERENCES users (
	user_id
);

ALTER TABLE flike ADD CONSTRAINT FK_freeBoard_TO_flike_1 FOREIGN KEY (
	fboard_id
)
REFERENCES freeBoard (
	fboard_id
);

ALTER TABLE noticeBoard ADD CONSTRAINT FK_admin_TO_noticeBoard_1 FOREIGN KEY (
	admin_id
)
REFERENCES admin (
	admin_id
);

ALTER TABLE image ADD CONSTRAINT FK_adoption_TO_image_1 FOREIGN KEY (
	adoption_id
)
REFERENCES adoption (
	adoption_id
);

ALTER TABLE image ADD CONSTRAINT FK_animal_TO_image_1 FOREIGN KEY (
	animal_id
)
REFERENCES animal (
	animal_id
);

ALTER TABLE image ADD CONSTRAINT FK_noticeBoard_TO_image_1 FOREIGN KEY (
	nboard_id
)
REFERENCES noticeBoard (
	nboard_id
);

ALTER TABLE image ADD CONSTRAINT FK_volunteer_TO_image_1 FOREIGN KEY (
	volunteer_id
)
REFERENCES volunteer (
	volunteer_id
);

ALTER TABLE image ADD CONSTRAINT FK_freeBoard_TO_image_1 FOREIGN KEY (
	fboard_id
)
REFERENCES freeBoard (
	fboard_id
);

ALTER TABLE image ADD CONSTRAINT FK_volunteerFeedbackBoard_TO_image_1 FOREIGN KEY (
	vfboard_id
)
REFERENCES volunteerFeedbackBoard (
	vfboard_id
);

ALTER TABLE image ADD CONSTRAINT FK_adoptionFeedbackBoard_TO_image_1 FOREIGN KEY (
	afboard_id
)
REFERENCES adoptionFeedbackBoard (
	afboard_id
);

ALTER TABLE volunteerFeedbackBoard ADD CONSTRAINT FK_users_TO_volunteerFeedbackBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE adoptionFeedbackBoard ADD CONSTRAINT FK_users_TO_adoptionFeedbackBoard_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE survey ADD CONSTRAINT FK_counseling_TO_survey_1 FOREIGN KEY (
	counseling_id
)
REFERENCES counseling (
	counseling_id
);

ALTER TABLE VFcomment ADD CONSTRAINT FK_volunteerFeedbackBoard_TO_VFcomment_1 FOREIGN KEY (
	vfboard_id
)
REFERENCES volunteerFeedbackBoard (
	vfboard_id
);

ALTER TABLE VFcomment ADD CONSTRAINT FK_users_TO_VFcomment_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE AFcomment ADD CONSTRAINT FK_adoptionFeedbackBoard_TO_AFcomment_1 FOREIGN KEY (
	afboard_id
)
REFERENCES adoptionFeedbackBoard (
	afboard_id
);

ALTER TABLE AFcomment ADD CONSTRAINT FK_users_TO_AFcomment_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE VFlike ADD CONSTRAINT FK_users_TO_VFlike_1 FOREIGN KEY (
	vfliuser_id
)
REFERENCES users (
	user_id
);

ALTER TABLE VFlike ADD CONSTRAINT FK_volunteerFeedbackBoard_TO_VFlike_1 FOREIGN KEY (
	vfboard_id
)
REFERENCES volunteerFeedbackBoard (
	vfboard_id
);

ALTER TABLE AFlike ADD CONSTRAINT FK_users_TO_AFlike_1 FOREIGN KEY (
	afliuser_id
)
REFERENCES users (
	user_id
);

ALTER TABLE AFlike ADD CONSTRAINT FK_adoptionFeedbackBoard_TO_AFlike_1 FOREIGN KEY (
	afboard_id
)
REFERENCES adoptionFeedbackBoard (
	afboard_id
);

ALTER TABLE report ADD CONSTRAINT FK_freeBoard_TO_report_1 FOREIGN KEY (
	fboard_id
)
REFERENCES freeBoard (
	fboard_id
);

ALTER TABLE report ADD CONSTRAINT FK_Fcomment_TO_report_1 FOREIGN KEY (
	fcomment_id
)
REFERENCES Fcomment (
	fcomment_id
);

ALTER TABLE report ADD CONSTRAINT FK_volunteerFeedbackBoard_TO_report_1 FOREIGN KEY (
	vfboard_id
)
REFERENCES volunteerFeedbackBoard (
	vfboard_id
);

ALTER TABLE report ADD CONSTRAINT FK_VFcomment_TO_report_1 FOREIGN KEY (
	vfcomment_id
)
REFERENCES VFcomment (
	vfcomment_id
);

ALTER TABLE report ADD CONSTRAINT FK_AFcomment_TO_report_1 FOREIGN KEY (
	afcomment_id
)
REFERENCES AFcomment (
	afcomment_id
);

ALTER TABLE report ADD CONSTRAINT FK_adoptionFeedbackBoard_TO_report_1 FOREIGN KEY (
	afboard_id
)
REFERENCES adoptionFeedbackBoard (
	afboard_id
);

ALTER TABLE report ADD CONSTRAINT FK_users_TO_report_1 FOREIGN KEY (
	user_id
)
REFERENCES users (
	user_id
);

ALTER TABLE sanction ADD CONSTRAINT FK_report_TO_sanction_1 FOREIGN KEY (
	report_id
)
REFERENCES report (
	report_id
);

-- 유기동물
CREATE SEQUENCE animal_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE
  CACHE 20;

-- 후원
CREATE SEQUENCE donate_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- 봉사 공고
create sequence volunteer_seq
start with 1
increment by 1
nocycle
nocache;

-- 유기동물 공고
CREATE SEQUENCE adoption_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE
  CACHE 20;
  
-- 공지게시판
create sequence noticeBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- 자유게시판
create sequence freeBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- 봉사 후기 게시판
create sequence volunteerFeedbackBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- 입양 후 이야기 게시판
create sequence adoptionFeedbackBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- 봉사 신청
create sequence application_seq
start with 1
increment by 1
nocycle
nocache;

-- 입양 신청
CREATE SEQUENCE counseling_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- 자유게시판 댓굴
create sequence Fcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- 자유게시판 좋아요
create sequence flike_seq
start with 1
increment by 1
nocycle
nocache;

-- 봉사 후기 게시판 댓글
create sequence VFcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- 봉사 후기 게시판 좋아요
create sequence VFlike_seq
start with 1
increment by 1
nocycle
nocache;

-- 입양 후 이야기 게시판 댓글
create sequence AFcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- 입양 후 이야기 게시판 좋아요
create sequence AFlike_seq
start with 1
increment by 1
nocycle
nocache;

-- 신고
create sequence report_seq
increment by 1
start with 1
nocache
nocycle;

-- 이미지
create sequence image_seq
increment by 1
start with 1
nocache
nocycle;

-- 설문
CREATE SEQUENCE survey_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- 제재
create sequence sanction_seq
increment by 1
start with 1
nocache
nocycle;

-- 유저 더미 데이터
insert all 
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member01', 'password', '김영일', '010-1111-1111', 'member01@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member02', 'password', '김영이', '010-2222-2222', 'member02@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member03', 'password', '김영삼', '010-3333-3333', 'member03@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member04', 'password', '김영사', '010-4444-4444', 'member04@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member05', 'password', '김영오', '010-5555-5555', 'member05@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member06', 'password', '김영육', '010-6666-6666', 'member06@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member07', 'password', '김영칠', '010-7777-7777', 'member07@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member08', 'password', '김영팔', '010-8888-8888', 'member08@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member09', 'password', '김영구', '010-9999-9999', 'member09@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member10', 'password', '김일영', '010-1010-1010', 'member10@naver.com')
select * from dual;

-- 관리자 더미 데이터
insert into admin (admin_id, admin_pwd)
values('admin', 'admin1234');

-- 유기동물
INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '개', '2살', '암컷', '중성화 O', '5kg', '갈색', '활발하고 친화적입니다.', 'admin', 0, SYSDATE, '멍멍이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES 
(animal_seq.nextval, '고양이', '3살', '수컷', '중성화 O', '3kg', '흰색', '신중하지만 귀여움이 물씬 나는 아이에요.', 'admin', 1, SYSDATE, '야옹이');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '개', '1살', '암컷', '중성화 X', '8kg', '검정', '에너지 넘치는 활발한 친구입니다.', 'admin', 2, SYSDATE, '코코');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '2살', '암컷', '중성화 O', '4kg', '회색', '조용하고 깨끗한 성격의 아이에요.', 'admin', 1, SYSDATE, '네로');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '개', '3살', '수컷', '중성화 O', '7kg', '갈색', '훈련된 얌전한 아이입니다.', 'admin', 0, SYSDATE, '루디');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '1살', '수컷', '중성화 O', '5kg', '검정', '사람을 좋아하고 다른 동물과도 잘 지내요.', 'admin', 2, SYSDATE, '미미');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '개', '4살', '암컷', '중성화 X', '6kg', '흰색', '아이들과 잘 어울리는 상냥한 강아지입니다.', 'admin', 0, SYSDATE, '벨라');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '2살', '수컷', '중성화 O', '4kg', '갈색', '매우 활발하고 호기심이 많은 아이에요.', 'admin', 1, SYSDATE, '톰');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '개', '2살', '수컷', '중성화 O', '5kg', '검정', '사람을 잘 따르는 귀여운 강아지입니다.', 'admin', 0, SYSDATE, '쿠키');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '고양이', '3살', '암컷', '중성화 X', '3kg', '흰색', '용감하고 경계심이 강한 아이에요.', 'admin', 2, SYSDATE, '소피');

-- 후원
INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member01', 30000, '신한카드', 30000, '김영일', '010-1111-1111');

INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member02', 50000, '국민카드', 50000, '김영이', '010-1415-7675');

INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member05', 30000, '신한카드', 30000, '김영오', '010-5555-5555');

-- 봉사 공고
insert into volunteer
values(volunteer_seq.nextval, '[봉사 모집] 보령/화성 불법 번식장 구조견들의 돌봄 봉사를 모집합니다!

보령/화성 불법 번식장에서 구조된 동물들에게 따뜻한 도움의 손길을 더해주세요!

 *봉사 신청해주셔서 감사합니다! 봉사 선발은 기재해주신 연락처로 순차적으로 드릴 예정입니다.
 
<모집 개요>
모집 기간 : ~2024년 3월 25일 18:00
대상: 19세 이상 성인, 1회 이상( 2회 이상 봉사 가능하신 분 우대)
인원: 1일 4인
**일정을 충분히 고려하여 꼭 오실 수 있는 분만 신청해주세요**', sysdate, '보령/화성 번식장 구조견 돌봄 봉사', default, '2024.03.31 (수)',
'2023.03.25 (월) 03시 00분', 10, default, '경기 파주시 법원읍 술이홀로 1409 더봄센터(파주)', default, 'admin');


insert into volunteer
values(volunteer_seq.nextval, 
'입양센터 아름품에서 입양을 기다리는 동물들을 돌봐줄 봉사자님을 모집합니다?



동물을 사랑하고 동물 돌봄에 대한 이해가 있으신 분이라면 만 20세 이상 누구나 신청 가능합니다.

단, 신청자가 많을 경우 심사가 진행될 수 있습니다.





 업무 : 강아지방과 고양이방 배변 청소, 세탁, 설거지 및 동물 돌봄.

 대상 : 최소 1개월 이상 봉사 가능하신 분, 청소에 자신 있으신 분, 체력 좋으신 분, 손이 빠르신 분, 멀티가 가능하신 분.



모집요일


3월 16일 일요일 09:30 ~ 18:30 3명





? 신청하기 누르신 후 팝업창 메모란에 오실 수 있는 요일을 작성해 주세요.





 장소 : 서울시 마포구 잔다리로 122, 2층 아름품 (지하철 6호선 망원역 1번 출구 도보 7분)',
sysdate, '아름품 동물돌봄 자원봉사 모집', default, '2024.03.16 (일)', '2024.03.13 (금) 18시 00분',
3, default, '서울 마포구 잔다리로 122 더불어숨센터 아름품', 1, 'admin');

insert into volunteer
values(volunteer_seq.nextval, '
보령 번식장 구조견들이 더불어숨센터에 대거 입소해 새로운 견생을 준비 중입니다! 가족을 기다리는 소중한 구조견들에게 따뜻한 도움의 손길로 함께해 주세요!



※ 봉사 선발은 기재해주신 연락처로 순차적으로 연락 드릴 예정입니다.



〈모집 개요〉
 모집 기간: ~2024년 2월 28일 18:00

모집 대상: 19세 이상 성인, 1회 이상(2회 이상 봉사 가능하신 분 우대)

 모집 인원: 1일 최대 4인



? 일정을 충분히 고려하여 꼭 오실 수 있는 분만 신청해주세요


 봉사 시간: 종일(09:00~18:00) 또는 오전(09:00~12:00)

 봉사 장소: 더불어숨센터(서울특별시 마포구 소재)

 봉사 내용: 보령 번식장 구조견 돌봄',
 sysdate, '보령 번식장 구조견 돌봄 봉사', default, '2024.02.29 (목)', '2024.02.28 (수) 18시 00분',
4, default, '더불어숨센터(서울특별시 마포구 소재)', 3, 'admin');

-- 유기동물 공고
INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '무료분양 이벤트가 시작되었습니다. 많은 참여 부탁드립니다.', TO_DATE('2024-03-05', 'YYYY-MM-DD'), '무료분양 이벤트 공지', 100, '진행중', '상', 'admin', 1);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '당신의 따뜻한 가정이 필요한 아이들이 기다리고 있습니다.', TO_DATE('2024-03-04', 'YYYY-MM-DD'), '어린이날 특별 무료분양', 75, '진행중', '중', 'admin', 2);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '고양이 친구들이 새로운 가족을 찾고 있어요.', TO_DATE('2024-03-03', 'YYYY-MM-DD'), '봄맞이 고양이 무료분양', 120, '종료', '하', 'admin', 3);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '겨울철 특별 무료분양 이벤트! 참여하세요.', TO_DATE('2024-03-02', 'YYYY-MM-DD'), '겨울 무료분양', 90, '진행중', '상', 'admin', 4);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '새로 무료분양받은 친구들을 소개합니다.', TO_DATE('2024-03-01', 'YYYY-MM-DD'), '신규 동물 소개', 110, '진행중', '중', 'admin', 5);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '특별한 무료분양 기회! 놓치지 마세요.', TO_DATE('2024-02-29', 'YYYY-MM-DD'), '특별 무료분양 프로모션', 80, '진행중', '하', 'admin', 6);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '무료분양 후기 이벤트가 진행 중입니다.', TO_DATE('2024-02-28', 'YYYY-MM-DD'), '무료분양 후기 작성 이벤트', 95, '진행중', '상', 'admin', 7);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '봄철 무료분양의 계절, 당신의 집에 따뜻한 친구를 불러보세요.', TO_DATE('2024-02-27', 'YYYY-MM-DD'), '봄 무료분양 이벤트', 110, '종료', '중', 'admin', 8);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '아이들을 위한 특별 무료분양 이벤트가 준비되어 있습니다.', TO_DATE('2024-02-26', 'YYYY-MM-DD'), '무료분양 이벤트', 85, '진행중', '하', 'admin', 9);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '다함께 즐기는 여름! 무료분양 이벤트에 참여하세요.', TO_DATE('2024-02-25', 'YYYY-MM-DD'), '여름 무료분양 캠페인', 105, '진행중', '상', 'admin', 10);

-- 공지 게시판
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Shop on Main Street, The (Obchod na korze)', 'M?ori', '2022-08-22', 4248, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'League of Ordinary Gentlemen, A', 'Greek', '2022-03-25', 6969, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Salut cousin!', 'Persian', '2024-01-17', 8922, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'The Open Road', 'German', '2023-07-21', 5582, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Exercice de l''?tat, L''', 'Romanian', '2023-12-07', 2730, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Hanzo the Razor: Sword of Justice (Goy?kiba)', 'Kazakh', '2024-02-05', 8976, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Poetry (Shi)', 'Tok Pisin', '2023-03-30', 933, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Shipwrecked (a.k.a. Haakon Haakonsen)', 'M?ori', '2023-07-06', 970, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Once Upon a Forest', 'Icelandic', '2022-12-13', 1871, 'admin');
insert into noticeBoard (nboard_id, nboard_title, nboard_content, nboard_date, nboard_cnt, admin_id) values (noticeBoard_seq.nextval, 'Haaveiden keh?', 'Norwegian', '2023-12-18', 5264, 'admin');

-- 자유게시판
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Night the Lights Went Out in Georgia, The', 'Tamil', 1, 1, '2023-07-26', 'member01');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Burrowers, The', 'Azeri', 2, 2, '2023-05-26', 'member02');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Gossip', 'M?ori', 3, 3, '2023-08-11', 'member03');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Skin Deep', 'Georgian', 4, 4, '2023-02-03', 'member04');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'God''s Gun', 'Mongolian', 5, 5, '2023-03-08', 'member05');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Time Limit', 'Belarusian', 6, 6, '2022-11-03', 'member06');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Africa: Texas Style', 'Hiri Motu', 7, 7, '2023-03-11', 'member07');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Sunset', 'Macedonian', 8, 8, '2023-04-12', 'member08');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Melvin and Howard', 'Aymara', 9, 9, '2023-08-29', 'member09');
insert into freeBoard (fboard_id, fboard_title, fboard_content, fboard_like, fboard_cnt, fboard_date, user_id) values (freeBoard_seq.nextval, 'Afternoon of a Torturer, The (Dupa-amiaza unui tortionar)', 'Bulgarian', 10, 10, '2023-08-28', 'member10');

-- 봉사 후기 게시판
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Mo'' Money', 'French', 1, 1, '2023-03-12', 'member01');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Chef in Love, A (Shekvarebuli kulinaris ataserti retsepti)', 'Romanian', 2, 2, '2022-12-15', 'member02');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Clambake', 'Latvian', 3, 3, '2023-11-02', 'member03');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Zone Troopers', 'Dhivehi', 4, 4, '2024-01-21', 'member04');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Die Fighting', 'Malayalam', 5, 5, '2023-06-24', 'member05');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'This Gun for Hire', 'Indonesian', 6, 6, '2023-09-23', 'member06');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Going Down in LA-LA Land', 'Oriya', 7, 7, '2023-11-10', 'member07');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'No Regrets for Our Youth (Waga seishun ni kuinashi)', 'Tsonga', 8, 8, '2023-08-22', 'member08');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Goat, The', 'Khmer', 9, 9, '2023-06-22', 'member09');
insert into volunteerFeedbackBoard (vfboard_id, vfboard_title, vfboard_content, vfboard_like, vfboard_cnt, vfboard_date, user_id) values (volunteerFeedbackBoard_seq.nextval, 'Louis Cyr: The Strongest Man in the World', 'Oriya', 10, 10, '2022-12-31', 'member10');

-- 입양 후 이야기 게시판
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Sleeping Beauty', 'Spanish', 1, 1, '2022-10-28', 'member01');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Aviator''s Wife, The (La femme de l''aviateur)', 'Lao', 2, 2, '2023-11-09', 'member02');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Will Penny', 'Amharic', 3, 3, '2023-11-27', 'member03');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'BloodRayne: The Third Reich', 'Hindi', 4, 4, '2023-10-04', 'member04');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Yol (a.k.a. The Way)', 'Hebrew', 5, 5, '2023-11-10', 'member05');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Destination Tokyo', 'Italian', 6, 6, '2022-12-16', 'member06');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Judy Moody and the Not Bummer Summer', 'Spanish', 7, 7, '2023-07-15', 'member07');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Just Go with It', 'Bosnian', 8, 8, '2022-11-29', 'member08');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Bone Man, The (Der Knochenmann)', 'Malayalam', 9, 9, '2023-01-12', 'member09');
insert into adoptionFeedbackBoard (afboard_id, afboard_title, afboard_content, afboard_like, afboard_cnt, afboard_date, user_id) values (adoptionFeedbackBoard_seq.nextval, 'Killers', 'Icelandic', 10, 10, '2023-04-23', 'member10');

-- 봉사 신청
insert into application
values(application_seq.nextval, sysdate, '', 'member01', 2, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member02', 2, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member03', 3, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member04', 3, default);

-- 입양 신청
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'member01', 1, '미확인', '상담 내용 1', 3, '서울시 강남구', '개발자', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-17', 'YYYY-MM-DD'), 'member02', 2, '미확인', '상담 내용 2', 2, '서울시 서초구', '디자이너', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'member03', 3, '미확인', '상담 내용 3', 4, '서울시 송파구', '마케터', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-22', 'YYYY-MM-DD'), 'member04', 4, '미확인', '상담 내용 4', 5, '서울시 강북구', '프로젝트 매니저', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-25', 'YYYY-MM-DD'), 'member05', 5, '미확인', '상담 내용 5', 3, '서울시 동작구', '데이터 분석가', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'member06', 6, '미확인', '상담 내용 6', 4, '서울시 강서구', '시스템 엔지니어', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 'member07', 7, '미확인', '상담 내용 7', 2, '서울시 강남구', '웹 디자이너', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'member08', 8, '미확인', '상담 내용 8', 5, '서울시 송파구', '데이터 사이언티스트', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'member09', 9, '미확인', '상담 내용 9', 3, '서울시 강동구', '풀스택 엔지니어', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'member10', 10, '미확인', '상담 내용 10', 4, '서울시 중랑구', '소프트웨어 엔지니어', 0);

-- 자유게시판 댓굴
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, '8th Floor', '2023-05-04', 1, 'member01');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'PO Box 9799', '2023-02-02', 2, 'member02');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Suite 55', '2023-02-27', 3, 'member03');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Apt 1581', '2023-06-04', 4, 'member04');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'PO Box 18018', '2023-07-10', 5, 'member05');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'PO Box 96224', '2022-05-15', 6, 'member06');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, '17th Floor', '2023-01-02', 7, 'member07');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Room 1437', '2022-07-25', 8, 'member08');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Room 1499', '2023-10-19', 9, 'member09');
insert into Fcomment (fcomment_id, fcomment_content, fcomment_date, fboard_id, user_id) values (Fcomment_seq.nextval, 'Apt 1738', '2024-02-05', 10, 'member10');

-- 자유게시판 좋아요
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member01', 1, '2022-10-08');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member02', 2, '2023-07-02');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member03', 3, '2023-04-14');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member04', 4, '2023-10-04');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member05', 5, '2023-02-03');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member06', 6, '2022-12-09');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member07', 7, '2023-11-30');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member08', 8, '2023-02-26');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member09', 9, '2023-05-22');
insert into flike (flike_id, fliuser_id, fboard_id, flike_date) values (Flike_seq.nextval, 'member10', 10, '2022-10-04');

-- 봉사 후기 게시판 댓글
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 719', '2022-05-27', 1, 'member01');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 418', '2024-02-02', 2, 'member02');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Suite 35', '2023-03-21', 3, 'member03');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 1251', '2022-04-04', 4, 'member04');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'PO Box 97750', '2023-06-23', 5, 'member05');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Apt 1171', '2022-03-08', 6, 'member06');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, '17th Floor', '2023-11-07', 7, 'member07');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Room 167', '2022-06-10', 8, 'member08');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Room 1216', '2023-12-24', 9, 'member09');
insert into VFcomment (vfcomment_id, vfcomment_content, vfcomment_date, vfboard_id, user_id) values (VFcomment_seq.nextval, 'Room 306', '2023-02-03', 10, 'member10');

-- 봉사 후기 게시판 좋아요
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member01', '2022-09-30', 1);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member02', '2023-07-09', 2);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member03', '2023-04-08', 3);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member04', '2023-11-27', 4);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member05', '2023-03-16', 5);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member06', '2023-05-01', 6);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member07', '2022-06-02', 7);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member08', '2022-10-24', 8);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member09', '2023-05-10', 9);
insert into VFlike (vflike_id, vfliuser_id, vflike_date, vfboard_id) values (VFlike_seq.nextval, 'member10', '2023-12-31', 10);

-- 입양 후 이야기 게시판 댓글
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Apt 1628', '2023-11-22', 1, 'member01');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Room 1329', '2023-10-23', 2, 'member02');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, '13th Floor', '2022-10-28', 3, 'member03');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 2037', '2024-01-27', 4, 'member04');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Room 1779', '2023-03-20', 5, 'member05');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 18663', '2022-02-21', 6, 'member06');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'Suite 82', '2023-12-02', 7, 'member07');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, '8th Floor', '2023-01-16', 8, 'member08');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 80950', '2023-09-27', 9, 'member09');
insert into AFcomment (afcomment_id, afcomment_content, afcomment_date, afboard_id, user_id) values (AFcomment_seq.nextval, 'PO Box 29822', '2022-05-31', 10, 'member10');

-- 입양 후 이야기 게시판 좋아요
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member01', '2022-11-19', 1);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member02', '2023-09-17', 2);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member03', '2023-02-21', 3);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member04', '2022-11-23', 4);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member05', '2023-06-12', 5);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member06', '2023-05-31', 6);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member07', '2023-05-25', 7);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member08', '2023-08-25', 8);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member09', '2023-12-22', 9);
insert into AFlike (aflike_id, afliuser_id, aflike_date, afboard_id) values (AFlike_seq.nextval, 'member10', '2022-05-31', 10);

-- 신고
insert into report(report_id, report_sort, report_date, report_detail, report_status, fboard_id, user_id)
values(47, 1, '2024-03-05', '욕설신고', 1, 1, 
    (select user_id 
        from freeboard
        where fboard_id = 1
    ));

insert into report(report_id, report_sort, report_date, report_detail, report_status, vfboard_id, user_id)
values(46, 2, '2024-03-05', '도배신고', 1, 1, 
    (select user_id 
        from volunteerFeedbackBoard
        where vfboard_id = 1
    ));

insert into report(report_id, report_sort, report_date, report_detail, report_status, afboard_id, user_id)
values(45, 3, '2024-03-05', '', 2, 1, 
    (select user_id 
        from adoptionFeedbackBoard
        where afboard_id = 1
    ));

-- 이미지
insert into image(image_id, board_sort, image_name, fboard_id)
values(1, 4, 'image_01', 1);

insert into image(image_id, board_sort, image_name, vfboard_id)
values(2, 6, 'image_02', 1);

insert into image(image_id, board_sort, image_name, afboard_id)
values(3, 7, 'image_03', 1);

-- 설문
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(1, '예', '아니오', '보통', '예', '아니오', '예', '아니오', '상담 내용이 유용했습니다.', 1);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(2, '아니오', '예', '보통', '아니오', '예', '아니오', '예', '상담 내용이 부족합니다.', 2);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(3, '예', '아니오', '보통', '예', '아니오', '예', '아니오', '더 많은 시간이 필요합니다.', 3);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(4, '아니오', '예', '보통', '아니오', '예', '아니오', '예', '상담이 지루했습니다.', 4);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(5, '예', '아니오', '보통', '예', '아니오', '예', '아니오', '추가 서비스가 필요합니다.', 5);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(6, '아니오', '예', '보통', '아니오', '예', '아니오', '예', '상담이 너무 길었습니다.', 6);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(7, '예', '아니오', '보통', '예', '아니오', '예', '아니오', '자세한 상담이 필요합니다.', 7);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(8, '아니오', '예', '보통', '아니오', '예', '아니오', '예', '상담 내용이 모호합니다.', 8);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(9, '예', '아니오', '보통', '예', '아니오', '예', '아니오', '만족합니다.', 9);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(10, '아니오', '예', '보통', '아니오', '예', '아니오', '예', '더 많은 상담이 필요합니다.', 10);

-- 제재
insert into sanction
values(6, 1,
    (select user_repcnt
        from users
        where user_id = (select user_id
                            from freeboard
                            where fboard_id = 1)
    ), sysdate, 47);

insert into sanction
values(5, 1,
    (select user_repcnt
        from users
        where user_id = (select user_id
                            from volunteerFeedbackBoard
                            where vfboard_id = 1)
    ), sysdate, 46);

insert into sanction
values(4, 1,
    (select user_repcnt
        from users
        where user_id = (select user_id
                            from adoptionFeedbackBoard
                            where afboard_id = 1)
    ), sysdate, 45);

select * from admin;
select * from adoption;
select * from adoptionfeedbackboard;
select * from afcomment;
select * from aflike;
select * from animal;
select * from application;
select * from counseling;
select * from donate;
select * from fcomment;
select * from flike;
select * from freeboard;
select * from image;
select * from noticeboard;
select * from report;
select * from sanction;
select * from survey;
select * from users;
select * from vfcomment;
select * from vflike;
select * from volunteer;
select * from volunteerfeedbackboard;