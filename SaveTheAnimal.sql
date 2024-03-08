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



COMMENT ON COLUMN users.user_id IS 'ȸ���� ID�� ����';

COMMENT ON COLUMN users.user_phone IS '�ߺ� �Ұ�';

COMMENT ON COLUMN users.user_email IS '�ߺ� �Ұ�';

COMMENT ON COLUMN users.user_act IS '�����ڵ�з� 1: Ȱ��, 2: Ȱ������, 0: Ż��(��Ȱ��) .  �⺻���� 1';

COMMENT ON COLUMN users.user_repcnt IS '�����ڰ� ȸ���� �Ű������� ������ �����Ǵ� Ƚ���̴�.  �⺻���� 0.';

COMMENT ON COLUMN users.user_date IS '�ý��� ��¥�� �Էµ�.';

COMMENT ON COLUMN users.user_volcnt IS '���� �Ҷ����� 1�� ����';

COMMENT ON COLUMN users.user_level IS '����Ƚ���� 3ȸ ���� 1�� ����';

COMMENT ON COLUMN users.user_adoptchk IS '�Ծ��� ��� 1';

CREATE TABLE admin (
	admin_id	varchar2(20)		NOT NULL,
	admin_pwd	varchar2(30)		NOT NULL
);


COMMENT ON COLUMN admin.admin_id IS '�����ڴ� �� ������ �����Ͽ����ϴ�.';

CREATE TABLE volunteer (
	volunteer_id	number		NOT NULL,
	volunteer_detail	varchar2(2000)		NOT NULL,
	volunteer_date	date	DEFAULT sysdate	NOT NULL,
	volunteer_title	varchar2(100)		NOT NULL,
	volunteer_cnt	number	DEFAULT 0	NOT NULL,
	volunteer_time	varchar2(30)		NOT NULL,
	volunteer_due	varchar2(30)		NOT NULL,
	volunteer_limit	number		NOT NULL,
	volunteer_cost	varchar2(20)	DEFAULT '����'	NOT NULL,
	volunteer_location	varchar2(100)		NOT NULL,
	volunteer_progress	number	DEFAULT 0	NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);


COMMENT ON COLUMN volunteer.volunteer_date IS '�ۼ��� ���Ϸ� �Է�';

COMMENT ON COLUMN volunteer.volunteer_progress IS '��û ���� ���ڿ� ���� �ο��� ���� 0 : ���� ��, 1 : ���� ��, 2 : �����Ϸ�,  3 : ���� ���� �� ������.';

COMMENT ON COLUMN volunteer.admin_id IS '�����ڴ� �� ������ �����Ͽ����ϴ�.';

CREATE TABLE adoption (
	adoption_id	number		NOT NULL,
	adoption_content	varchar2(2000)		NOT NULL,
	adoption_date	date	DEFAULT sysdate	NOT NULL,
	adoption_title	varchar2(100)		NOT NULL,
	adoption_cnt	number	DEFAULT 0	NOT NULL,
	adoption_status	varchar2(20)	DEFAULT '������'	NOT NULL,
	adoption_level	varchar2(20)		NOT NULL,
	admin_id	varchar2(20)		NOT NULL,
	animal_id	number		NOT NULL
);

COMMENT ON COLUMN adoption.adoption_level IS '�Ծ� ������ �������� ���� ������ �޶���';

COMMENT ON COLUMN adoption.admin_id IS '�����ڴ� �� ������ �����Ͽ����ϴ�.';

CREATE TABLE freeBoard (
	fboard_id	number		NOT NULL,
	fboard_title	varchar2(80)		NOT NULL,
	fboard_content	varchar2(2000)		NOT NULL,
	fboard_like	number	DEFAULT 0	NOT NULL,
	fboard_cnt	number	DEFAULT 0	NOT NULL,
	fboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN freeBoard.fboard_id IS '�����Խ��ǿ� �ۼ��� ���� ������ȣ';

COMMENT ON COLUMN freeBoard.fboard_like IS '��ưŬ���� +1, �ѹ� �� Ŭ���� -1';

COMMENT ON COLUMN freeBoard.fboard_cnt IS '��¥/��ȸ��/���ƿ�� ������ ���İ���';

COMMENT ON COLUMN freeBoard.fboard_date IS '�Խñ��� �ۼ��� ��¥ �� �ð� ǥ��';

COMMENT ON COLUMN freeBoard.user_id IS 'ȸ���� ID�� ����';

CREATE TABLE Fcomment (
	fcomment_id	number		NOT NULL,
	fcomment_content	varchar2(150)		NOT NULL,
	fcomment_date	date	DEFAULT sysdate	NOT NULL,
	fboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN Fcomment.fcomment_id IS '������ ��� ����ID';

COMMENT ON COLUMN Fcomment.fboard_id IS '�����Խ��ǿ� �ۼ��� ���� ������ȣ';

COMMENT ON COLUMN Fcomment.user_id IS 'ȸ���� ID�� ����';

CREATE TABLE counseling (
	counseling_id	number		NOT NULL,
	counseling_schedule	date		NOT NULL,
	user_id	varchar2(20)		NOT NULL,
	adoption_id	number		NOT NULL,
	counseling_date	date	DEFAULT sysdate	NOT NULL,
	counseling_judgment	varchar2(20)	DEFAULT '��Ȯ��'	NOT NULL,
	counseling_detail	varchar2(2000)		NULL,
	counseling_age	number		NOT NULL,
	counseling_address	varchar2(100)		NOT NULL,
	counseling_job	varchar2(40)		NOT NULL,
	counseling_adopt	number	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN counseling.user_id IS 'ȸ���� ID�� ����';

COMMENT ON COLUMN counseling.counseling_judgment IS '�����ڸ� ��������';

COMMENT ON COLUMN counseling.counseling_detail IS '�����ڸ� ��ȸ ���� ����';

COMMENT ON COLUMN counseling.counseling_adopt IS '0 : �Ծ� , 1 : �ӽú�ȣ';

CREATE TABLE application (
	application_id	number		NOT NULL,
	application_date	date	DEFAULT sysdate	NOT NULL,
	application_comment	varchar2(150)		NULL,
	user_id	varchar2(20)		NOT NULL,
	volunteer_id	number		NOT NULL,
	application_result	number	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN application.application_date IS '���� �� �Էµǰ� �Ѵ�';

COMMENT ON COLUMN application.user_id IS 'ȸ���� ID�� ����';

COMMENT ON COLUMN application.application_result IS '����� 1 ���� ���� ������ 0�״��';

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

COMMENT ON COLUMN donate.donate_PM IS 'ī������θ� �����ϴ�';

COMMENT ON COLUMN donate.user_id IS 'ȸ���� ID�� ����';

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

COMMENT ON COLUMN animal.animal_species IS '������ �Ǵ� �����';

COMMENT ON COLUMN animal.admin_id IS '�����ڴ� �� ������ �����Ͽ����ϴ�.';

COMMENT ON COLUMN animal.animal_temp IS '0 : �Ұ��� 1 : ȣ���ǽ� 2 : ���ü�� 3: ��������';


CREATE TABLE flike (
	flike_id	number		NOT NULL,
	fliuser_id	varchar2(20)		NOT NULL,
	fboard_id	number		NOT NULL,
	flike_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN flike.fliuser_id IS '���ƿ� ���� ȸ�� ID';

CREATE TABLE noticeBoard (
	nboard_id	number		NOT NULL,
	nboard_title	varchar2(80)		NOT NULL,
	nboard_content	varchar2(2000)		NOT NULL,
	nboard_date	date	DEFAULT sysdate	NOT NULL,
	nboard_cnt	number	DEFAULT 0	NOT NULL,
	admin_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN noticeBoard.nboard_id IS '�����Խ��ǿ� �ۼ��� ���� ������ȣ';

COMMENT ON COLUMN noticeBoard.nboard_date IS '�Խñ��� �ۼ��� ��¥ �� �ð� ǥ��';

COMMENT ON COLUMN noticeBoard.nboard_cnt IS '�� ������ �����Ҷ����� ��ȸ�� 1����';

COMMENT ON COLUMN noticeBoard.admin_id IS '�����ڴ� �� ������ �����Ͽ����ϴ�.';

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

COMMENT ON COLUMN image.board_sort IS '1.���⵿��, 2.�Ծ����, 3.�������, 4.�����Խ���, 5.�����Խ���, 6.�����ı�, 7.�Ծ��ı�';

COMMENT ON COLUMN image.nboard_id IS '�����Խ��ǿ� �ۼ��� ���� ������ȣ';

COMMENT ON COLUMN image.fboard_id IS '�����Խ��ǿ� �ۼ��� ���� ������ȣ';

CREATE TABLE volunteerFeedbackBoard (
	vfboard_id	number		NOT NULL,
	vfboard_title	varchar2(80)		NOT NULL,
	vfboard_content	varchar2(2000)		NOT NULL,
	vfboard_like	number	DEFAULT 0	NOT NULL,
	vfboard_cnt	number	DEFAULT 0	NOT NULL,
	vfboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN volunteerFeedbackBoard.user_id IS 'ȸ���� ID�� ����';

CREATE TABLE adoptionFeedbackBoard (
	afboard_id	number		NOT NULL,
	afboard_title	varchar2(80)		NOT NULL,
	afboard_content	varchar2(2000)		NOT NULL,
	afboard_like	number	DEFAULT 0	NOT NULL,
	afboard_cnt	number	DEFAULT 0	NOT NULL,
	afboard_date	date	DEFAULT sysdate	NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN adoptionFeedbackBoard.user_id IS 'ȸ���� ID�� ����';

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

COMMENT ON COLUMN survey.survey_id IS '���� ���� ID';

COMMENT ON COLUMN survey.counseling_id IS '���� ���� ID';

CREATE TABLE VFcomment (
	vfcomment_id	number		NOT NULL,
	vfcomment_content	varchar2(150)		NOT NULL,
	vfcomment_date	date	DEFAULT sysdate	NOT NULL,
	vfboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN VFcomment.vfcomment_id IS '�����ı�� ��� ����ID';

COMMENT ON COLUMN VFcomment.vfcomment_content IS '�����ı� ��� ����';

COMMENT ON COLUMN VFcomment.user_id IS 'ȸ���� ID�� ����';

CREATE TABLE AFcomment (
	afcomment_id	number		NOT NULL,
	afcomment_content	varchar2(150)		NOT NULL,
	afcomment_date	date	DEFAULT sysdate	NOT NULL,
	afboard_id	number		NOT NULL,
	user_id	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN AFcomment.user_id IS 'ȸ���� ID�� ����';

CREATE TABLE VFlike (
	vflike_id	number		NOT NULL,
	vfliuser_id	varchar2(20)		NOT NULL,
	vflike_date	date	DEFAULT sysdate	NOT NULL,
	vfboard_id	number		NOT NULL
);

COMMENT ON COLUMN VFlike.vfliuser_id IS '���ƿ� ���� ȸ�� ID';

CREATE TABLE AFlike (
	aflike_id	number		NOT NULL,
	afliuser_id	varchar2(20)		NOT NULL,
	aflike_date	date	DEFAULT sysdate	NOT NULL,
	afboard_id	number		NOT NULL
);

COMMENT ON COLUMN AFlike.afliuser_id IS '���ƿ� ���� ȸ�� ID';

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

COMMENT ON COLUMN report.report_date IS '1. �弳 / 2. ���� / 3. ���� / 4. ��Ÿ';

COMMENT ON COLUMN report.report_status IS '1. �Ű�� / 2. ó����';

COMMENT ON COLUMN report.fboard_id IS '�����Խ��ǿ� �ۼ��� ���� ������ȣ';

COMMENT ON COLUMN report.fcomment_id IS '������ ��� ����ID';

COMMENT ON COLUMN report.vfcomment_id IS '�����ı�� ��� ����ID';

COMMENT ON COLUMN report.user_id IS '�Ű��� ȸ�� ID';

CREATE TABLE sanction (
	sanction_id	number		NOT NULL,
	sanction_status	number		NOT NULL,
	sanction_result	number		NOT NULL,
	sanction_date	date	DEFAULT sysdate	NOT NULL,
	report_id	number		NOT NULL
);

COMMENT ON COLUMN sanction.sanction_status IS '1. �Ű����� / 2. �Ű���';

COMMENT ON COLUMN sanction.sanction_result IS '1. �Խñۻ��� / 2. ����Ȱ������ / 3. ��������';

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

-- ���⵿��
CREATE SEQUENCE animal_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE
  CACHE 20;

-- �Ŀ�
CREATE SEQUENCE donate_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- ���� ����
create sequence volunteer_seq
start with 1
increment by 1
nocycle
nocache;

-- ���⵿�� ����
CREATE SEQUENCE adoption_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE
  CACHE 20;
  
-- �����Խ���
create sequence noticeBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- �����Խ���
create sequence freeBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- ���� �ı� �Խ���
create sequence volunteerFeedbackBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- �Ծ� �� �̾߱� �Խ���
create sequence adoptionFeedbackBoard_seq
start with 1
increment by 1
nocycle
nocache;

-- ���� ��û
create sequence application_seq
start with 1
increment by 1
nocycle
nocache;

-- �Ծ� ��û
CREATE SEQUENCE counseling_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- �����Խ��� ��
create sequence Fcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- �����Խ��� ���ƿ�
create sequence flike_seq
start with 1
increment by 1
nocycle
nocache;

-- ���� �ı� �Խ��� ���
create sequence VFcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- ���� �ı� �Խ��� ���ƿ�
create sequence VFlike_seq
start with 1
increment by 1
nocycle
nocache;

-- �Ծ� �� �̾߱� �Խ��� ���
create sequence AFcomment_seq
start with 1
increment by 1
nocycle
nocache;

-- �Ծ� �� �̾߱� �Խ��� ���ƿ�
create sequence AFlike_seq
start with 1
increment by 1
nocycle
nocache;

-- �Ű�
create sequence report_seq
increment by 1
start with 1
nocache
nocycle;

-- �̹���
create sequence image_seq
increment by 1
start with 1
nocache
nocycle;

-- ����
CREATE SEQUENCE survey_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- ����
create sequence sanction_seq
increment by 1
start with 1
nocache
nocycle;

-- ���� ���� ������
insert all 
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member01', 'password', '�迵��', '010-1111-1111', 'member01@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member02', 'password', '�迵��', '010-2222-2222', 'member02@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member03', 'password', '�迵��', '010-3333-3333', 'member03@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member04', 'password', '�迵��', '010-4444-4444', 'member04@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member05', 'password', '�迵��', '010-5555-5555', 'member05@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member06', 'password', '�迵��', '010-6666-6666', 'member06@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member07', 'password', '�迵ĥ', '010-7777-7777', 'member07@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member08', 'password', '�迵��', '010-8888-8888', 'member08@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member09', 'password', '�迵��', '010-9999-9999', 'member09@naver.com')
into users(user_id, user_pwd, user_name, user_phone, user_email) 
values('member10', 'password', '���Ͽ�', '010-1010-1010', 'member10@naver.com')
select * from dual;

-- ������ ���� ������
insert into admin (admin_id, admin_pwd)
values('admin', 'admin1234');

-- ���⵿��
INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '��', '2��', '����', '�߼�ȭ O', '5kg', '����', 'Ȱ���ϰ� ģȭ���Դϴ�.', 'admin', 0, SYSDATE, '�۸���');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES 
(animal_seq.nextval, '�����', '3��', '����', '�߼�ȭ O', '3kg', '���', '���������� �Ϳ����� ���� ���� ���̿���.', 'admin', 1, SYSDATE, '�߿���');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '��', '1��', '����', '�߼�ȭ X', '8kg', '����', '������ ��ġ�� Ȱ���� ģ���Դϴ�.', 'admin', 2, SYSDATE, '����');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '�����', '2��', '����', '�߼�ȭ O', '4kg', 'ȸ��', '�����ϰ� ������ ������ ���̿���.', 'admin', 1, SYSDATE, '�׷�');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '��', '3��', '����', '�߼�ȭ O', '7kg', '����', '�Ʒõ� ������ �����Դϴ�.', 'admin', 0, SYSDATE, '���');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '�����', '1��', '����', '�߼�ȭ O', '5kg', '����', '����� �����ϰ� �ٸ� �������� �� ������.', 'admin', 2, SYSDATE, '�̹�');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '��', '4��', '����', '�߼�ȭ X', '6kg', '���', '���̵�� �� ��︮�� ����� �������Դϴ�.', 'admin', 0, SYSDATE, '����');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '�����', '2��', '����', '�߼�ȭ O', '4kg', '����', '�ſ� Ȱ���ϰ� ȣ����� ���� ���̿���.', 'admin', 1, SYSDATE, '��');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '��', '2��', '����', '�߼�ȭ O', '5kg', '����', '����� �� ������ �Ϳ��� �������Դϴ�.', 'admin', 0, SYSDATE, '��Ű');

INSERT INTO animal (animal_id, animal_species, animal_age, animal_gender, animal_status, animal_kg, animal_color, animal_memo, admin_id, animal_temp, animal_regist, animal_name)
VALUES
(animal_seq.nextval, '�����', '3��', '����', '�߼�ȭ X', '3kg', '���', '�밨�ϰ� ������ ���� ���̿���.', 'admin', 2, SYSDATE, '����');

-- �Ŀ�
INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member01', 30000, '����ī��', 30000, '�迵��', '010-1111-1111');

INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member02', 50000, '����ī��', 50000, '�迵��', '010-1415-7675');

INSERT INTO donate (donate_id, user_id, donate_price, donate_pm,
donate_sprice, donate_ahname, donate_ahphone)
VALUES(donate_seq.NEXTVAL, 'member05', 30000, '����ī��', 30000, '�迵��', '010-5555-5555');

-- ���� ����
insert into volunteer
values(volunteer_seq.nextval, '[���� ����] ����/ȭ�� �ҹ� ������ �����ߵ��� ���� ���縦 �����մϴ�!

����/ȭ�� �ҹ� �����忡�� ������ �����鿡�� ������ ������ �ձ��� �����ּ���!

 *���� ��û���ּż� �����մϴ�! ���� ������ �������ֽ� ����ó�� ���������� �帱 �����Դϴ�.
 
<���� ����>
���� �Ⱓ : ~2024�� 3�� 25�� 18:00
���: 19�� �̻� ����, 1ȸ �̻�( 2ȸ �̻� ���� �����Ͻ� �� ���)
�ο�: 1�� 4��
**������ ����� ����Ͽ� �� ���� �� �ִ� �и� ��û���ּ���**', sysdate, '����/ȭ�� ������ ������ ���� ����', default, '2024.03.31 (��)',
'2023.03.25 (��) 03�� 00��', 10, default, '��� ���ֽ� ������ ����Ȧ�� 1409 ��������(����)', default, 'admin');


insert into volunteer
values(volunteer_seq.nextval, 
'�Ծ缾�� �Ƹ�ǰ���� �Ծ��� ��ٸ��� �������� ������ �����ڴ��� �����մϴ�?



������ ����ϰ� ���� ������ ���� ���ذ� ������ ���̶�� �� 20�� �̻� ������ ��û �����մϴ�.

��, ��û�ڰ� ���� ��� �ɻ簡 ����� �� �ֽ��ϴ�.





 ���� : ��������� ����̹� �躯 û��, ��Ź, ������ �� ���� ����.

 ��� : �ּ� 1���� �̻� ���� �����Ͻ� ��, û�ҿ� �ڽ� ������ ��, ü�� ������ ��, ���� ������ ��, ��Ƽ�� �����Ͻ� ��.



��������


3�� 16�� �Ͽ��� 09:30 ~ 18:30 3��





? ��û�ϱ� ������ �� �˾�â �޸���� ���� �� �ִ� ������ �ۼ��� �ּ���.





 ��� : ����� ������ �ܴٸ��� 122, 2�� �Ƹ�ǰ (����ö 6ȣ�� ������ 1�� �ⱸ ���� 7��)',
sysdate, '�Ƹ�ǰ �������� �ڿ����� ����', default, '2024.03.16 (��)', '2024.03.13 (��) 18�� 00��',
3, default, '���� ������ �ܴٸ��� 122 ���Ҿ������ �Ƹ�ǰ', 1, 'admin');

insert into volunteer
values(volunteer_seq.nextval, '
���� ������ �����ߵ��� ���Ҿ�����Ϳ� ��� �Լ��� ���ο� �߻��� �غ� ���Դϴ�! ������ ��ٸ��� ������ �����ߵ鿡�� ������ ������ �ձ�� �Բ��� �ּ���!



�� ���� ������ �������ֽ� ����ó�� ���������� ���� �帱 �����Դϴ�.



������ ���䡵
 ���� �Ⱓ: ~2024�� 2�� 28�� 18:00

���� ���: 19�� �̻� ����, 1ȸ �̻�(2ȸ �̻� ���� �����Ͻ� �� ���)

 ���� �ο�: 1�� �ִ� 4��



? ������ ����� ����Ͽ� �� ���� �� �ִ� �и� ��û���ּ���


 ���� �ð�: ����(09:00~18:00) �Ǵ� ����(09:00~12:00)

 ���� ���: ���Ҿ������(����Ư���� ������ ����)

 ���� ����: ���� ������ ������ ����',
 sysdate, '���� ������ ������ ���� ����', default, '2024.02.29 (��)', '2024.02.28 (��) 18�� 00��',
4, default, '���Ҿ������(����Ư���� ������ ����)', 3, 'admin');

-- ���⵿�� ����
INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '����о� �̺�Ʈ�� ���۵Ǿ����ϴ�. ���� ���� ��Ź�帳�ϴ�.', TO_DATE('2024-03-05', 'YYYY-MM-DD'), '����о� �̺�Ʈ ����', 100, '������', '��', 'admin', 1);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '����� ������ ������ �ʿ��� ���̵��� ��ٸ��� �ֽ��ϴ�.', TO_DATE('2024-03-04', 'YYYY-MM-DD'), '��̳� Ư�� ����о�', 75, '������', '��', 'admin', 2);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '����� ģ������ ���ο� ������ ã�� �־��.', TO_DATE('2024-03-03', 'YYYY-MM-DD'), '������ ����� ����о�', 120, '����', '��', 'admin', 3);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '�ܿ�ö Ư�� ����о� �̺�Ʈ! �����ϼ���.', TO_DATE('2024-03-02', 'YYYY-MM-DD'), '�ܿ� ����о�', 90, '������', '��', 'admin', 4);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '���� ����о���� ģ������ �Ұ��մϴ�.', TO_DATE('2024-03-01', 'YYYY-MM-DD'), '�ű� ���� �Ұ�', 110, '������', '��', 'admin', 5);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, 'Ư���� ����о� ��ȸ! ��ġ�� ������.', TO_DATE('2024-02-29', 'YYYY-MM-DD'), 'Ư�� ����о� ���θ��', 80, '������', '��', 'admin', 6);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '����о� �ı� �̺�Ʈ�� ���� ���Դϴ�.', TO_DATE('2024-02-28', 'YYYY-MM-DD'), '����о� �ı� �ۼ� �̺�Ʈ', 95, '������', '��', 'admin', 7);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '��ö ����о��� ����, ����� ���� ������ ģ���� �ҷ�������.', TO_DATE('2024-02-27', 'YYYY-MM-DD'), '�� ����о� �̺�Ʈ', 110, '����', '��', 'admin', 8);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '���̵��� ���� Ư�� ����о� �̺�Ʈ�� �غ�Ǿ� �ֽ��ϴ�.', TO_DATE('2024-02-26', 'YYYY-MM-DD'), '����о� �̺�Ʈ', 85, '������', '��', 'admin', 9);

INSERT INTO adoption (adoption_id, adoption_content, adoption_date, adoption_title, adoption_cnt, adoption_status, adoption_level, admin_id, animal_id)
VALUES
(adoption_seq.nextval, '���Բ� ���� ����! ����о� �̺�Ʈ�� �����ϼ���.', TO_DATE('2024-02-25', 'YYYY-MM-DD'), '���� ����о� ķ����', 105, '������', '��', 'admin', 10);

-- ���� �Խ���
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

-- �����Խ���
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

-- ���� �ı� �Խ���
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

-- �Ծ� �� �̾߱� �Խ���
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

-- ���� ��û
insert into application
values(application_seq.nextval, sysdate, '', 'member01', 2, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member02', 2, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member03', 3, default);
insert into application
values(application_seq.nextval, sysdate, '', 'member04', 3, default);

-- �Ծ� ��û
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'member01', 1, '��Ȯ��', '��� ���� 1', 3, '����� ������', '������', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-17', 'YYYY-MM-DD'), 'member02', 2, '��Ȯ��', '��� ���� 2', 2, '����� ���ʱ�', '�����̳�', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'member03', 3, '��Ȯ��', '��� ���� 3', 4, '����� ���ı�', '������', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-22', 'YYYY-MM-DD'), 'member04', 4, '��Ȯ��', '��� ���� 4', 5, '����� ���ϱ�', '������Ʈ �Ŵ���', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-25', 'YYYY-MM-DD'), 'member05', 5, '��Ȯ��', '��� ���� 5', 3, '����� ���۱�', '������ �м���', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'member06', 6, '��Ȯ��', '��� ���� 6', 4, '����� ������', '�ý��� �����Ͼ�', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 'member07', 7, '��Ȯ��', '��� ���� 7', 2, '����� ������', '�� �����̳�', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'member08', 8, '��Ȯ��', '��� ���� 8', 5, '����� ���ı�', '������ ���̾�Ƽ��Ʈ', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'member09', 9, '��Ȯ��', '��� ���� 9', 3, '����� ������', 'Ǯ���� �����Ͼ�', 0);
INSERT INTO counseling (counseling_id, counseling_schedule, user_id, adoption_id, counseling_judgment, counseling_detail, counseling_age, counseling_address, counseling_job, counseling_adopt)
VALUES 
(counseling_seq.nextval, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'member10', 10, '��Ȯ��', '��� ���� 10', 4, '����� �߶���', '����Ʈ���� �����Ͼ�', 0);

-- �����Խ��� ��
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

-- �����Խ��� ���ƿ�
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

-- ���� �ı� �Խ��� ���
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

-- ���� �ı� �Խ��� ���ƿ�
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

-- �Ծ� �� �̾߱� �Խ��� ���
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

-- �Ծ� �� �̾߱� �Խ��� ���ƿ�
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

-- �Ű�
insert into report(report_id, report_sort, report_date, report_detail, report_status, fboard_id, user_id)
values(47, 1, '2024-03-05', '�弳�Ű�', 1, 1, 
    (select user_id 
        from freeboard
        where fboard_id = 1
    ));

insert into report(report_id, report_sort, report_date, report_detail, report_status, vfboard_id, user_id)
values(46, 2, '2024-03-05', '����Ű�', 1, 1, 
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

-- �̹���
insert into image(image_id, board_sort, image_name, fboard_id)
values(1, 4, 'image_01', 1);

insert into image(image_id, board_sort, image_name, vfboard_id)
values(2, 6, 'image_02', 1);

insert into image(image_id, board_sort, image_name, afboard_id)
values(3, 7, 'image_03', 1);

-- ����
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(1, '��', '�ƴϿ�', '����', '��', '�ƴϿ�', '��', '�ƴϿ�', '��� ������ �����߽��ϴ�.', 1);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(2, '�ƴϿ�', '��', '����', '�ƴϿ�', '��', '�ƴϿ�', '��', '��� ������ �����մϴ�.', 2);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(3, '��', '�ƴϿ�', '����', '��', '�ƴϿ�', '��', '�ƴϿ�', '�� ���� �ð��� �ʿ��մϴ�.', 3);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(4, '�ƴϿ�', '��', '����', '�ƴϿ�', '��', '�ƴϿ�', '��', '����� �����߽��ϴ�.', 4);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(5, '��', '�ƴϿ�', '����', '��', '�ƴϿ�', '��', '�ƴϿ�', '�߰� ���񽺰� �ʿ��մϴ�.', 5);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(6, '�ƴϿ�', '��', '����', '�ƴϿ�', '��', '�ƴϿ�', '��', '����� �ʹ� ������ϴ�.', 6);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(7, '��', '�ƴϿ�', '����', '��', '�ƴϿ�', '��', '�ƴϿ�', '�ڼ��� ����� �ʿ��մϴ�.', 7);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(8, '�ƴϿ�', '��', '����', '�ƴϿ�', '��', '�ƴϿ�', '��', '��� ������ ��ȣ�մϴ�.', 8);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(9, '��', '�ƴϿ�', '����', '��', '�ƴϿ�', '��', '�ƴϿ�', '�����մϴ�.', 9);
INSERT INTO survey (survey_id, survey_a1, survey_a2, survey_a3, survey_a4, survey_a5, survey_a6, survey_a7, survey_a8, counseling_id)
VALUES 
(10, '�ƴϿ�', '��', '����', '�ƴϿ�', '��', '�ƴϿ�', '��', '�� ���� ����� �ʿ��մϴ�.', 10);

-- ����
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