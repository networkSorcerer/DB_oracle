CREATE TABLE `user` (
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '회원은 ID로 구분',
	`user_pw`	VARCHAR(255)	NULL,
	`user_nm`	VARCHAR(255)	NULL,
	`user_ph`	VARCHAR(255)	NULL	COMMENT '중복 불가',
	`user_em`	VARCHAR(255)	NULL	COMMENT '중복 불가',
	`user_act`	VARCHAR(255)	NULL	DEFAULT 1	COMMENT '상태코드분류 1: 활동, 2: 활동중지, 0: 탈퇴(비활동) .  기본값은 1',
	`user_rep_cnt`	VARCHAR(255)	NULL	DEFAULT 0	COMMENT '관리자가 회원에 신고제재할 때마다 누적되는 횟수이다.  기본값은 0.',
	`user_date`	VARCHAR(255)	NULL	DEFAULT sysdate	COMMENT '시스템 날짜로 입력됨.'
);

CREATE TABLE `admin` (
	`admin_id`	VARCHAR(255)	NOT NULL	COMMENT '관리자는 한 명으로 가정하였습니다.',
	`admin_pw`	VARCHAR(255)	NULL
);

CREATE TABLE `volunteer` (
	`volunteer_num`	VARCHAR(255)	NOT NULL,
	`volunteer_detail`	VARCHAR(255)	NOT NULL,
	`volunteer_date`	VARCHAR(255)	NOT NULL	DEFAULT sysdate	COMMENT '작성한 당일로 입력',
	`volunteer_title`	VARCHAR(255)	NOT NULL,
	`volunteer_readcnt`	VARCHAR(255)	NOT NULL	DEFAULT 0,
	`volunteer_time`	VARCHAR(255)	NOT NULL,
	`volunteer_due`	VARCHAR(255)	NOT NULL,
	`volunteer_limit`	VARCHAR(255)	NOT NULL,
	`volunteer_cost`	VARCHAR(255)	NOT NULL	DEFAULT 없음,
	`volunteer_location`	VARCHAR(255)	NOT NULL,
	`volunteer_thumnail`	VARCHAR(255)	NOT NULL	COMMENT '사진을 입력할 수 있게 한다',
	`volunteer_progress`	VARCHAR(255)	NULL	DEFAULT 모집 전	COMMENT '신청 가능 일자와 모집 인원에 따라 모집 전, 모집 중, 모집완료, 모집 종료 로 나뉜다.',
	`admin_id`	VARCHAR(255)	NOT NULL	COMMENT '관리자는 한 명으로 가정하였습니다.'
);

CREATE TABLE `adoption` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Key3`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL	DEFAULT sysdate,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL	DEFAULT 0,
	`admin_id`	VARCHAR(255)	NOT NULL	COMMENT '관리자는 한 명으로 가정하였습니다.',
	`Field5`	VARCHAR(255)	NULL	DEFAULT 공고중
);

CREATE TABLE `freeBoard` (
	`Key`	VARCHAR(255)	NOT NULL	COMMENT '자유게시판에 작성된 글의 고유번호',
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '회원은 ID로 구분',
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field5`	VARCHAR(255)	NULL	DEFAULT 0	COMMENT '버튼클릭시 +1, 한번 더 클릭시 -1',
	`Field8`	VARCHAR(255)	NULL	DEFAULT 0	COMMENT '날짜/조회수/좋아요수 순으로 정렬가능',
	`Field9`	VARCHAR(255)	NULL	DEFAULT sysdate	COMMENT '게시글이 작성된 날짜 및 시간 표시'
);

CREATE TABLE `CopyOfCopyOfUntitled32` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Key3`	VARCHAR(255)	NOT NULL	COMMENT '자유게시판에 작성된 글의 고유번호',
	`Key22`	VARCHAR(255)	NOT NULL	COMMENT '신고된 자유글 작성 회원ID',
	`Field`	VARCHAR(255)	NULL	COMMENT '1. 욕설 / 2. 도배 / 3. 광고 / 4. 기타',
	`Field2`	VARCHAR(255)	NULL	DEFAULT sysdate,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL	DEFAULT 1	COMMENT '1. 신고됨 / 2. 처리됨',
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '신고한 회원의 ID'
);

CREATE TABLE `comment` (
	`Key`	VARCHAR(255)	NOT NULL,
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '댓글 작성 회원 ID',
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL	DEFAULT sysdate,
	`Key4`	VARCHAR(255)	NOT NULL	COMMENT '자유게시판에 작성된 글의 고유번호',
	`Key22`	VARCHAR(255)	NOT NULL	COMMENT '자유게시판 게시글 작성 회원 ID'
);

CREATE TABLE `CopyOfCopyOfUntitled34` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`user_id`	VARCHAR(255)	NOT NULL,
	`Key3`	VARCHAR(255)	NOT NULL,
	`Key32`	VARCHAR(255)	NOT NULL,
	`Field2`	VARCHAR(255)	NULL	DEFAULT sysdate,
	`Field5`	VARCHAR(255)	NULL	DEFAULT 미확인	COMMENT '관리자만 수정가능',
	`Field6`	VARCHAR(255)	NULL	COMMENT '관리자만 조회 수정 삭제',
	`Field7`	VARCHAR(255)	NULL,
	`Field8`	VARCHAR(255)	NULL,
	`Field9`	VARCHAR(255)	NULL
);

CREATE TABLE `application` (
	`application_num`	VARCHAR(255)	NOT NULL,
	`application_date`	VARCHAR(255)	NOT NULL	DEFAULT sysdate	COMMENT '당일 로 입력되게 한다',
	`application_comment`	VARCHAR(255)	NULL	DEFAULT "   "	COMMENT '없으면 공백으로 표기',
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '회원은 ID로 구분',
	`volunteer_num`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `donate` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL	DEFAULT sysdate,
	`Field5`	VARCHAR(255)	NULL,
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '회원은 ID로 구분'
);

CREATE TABLE `animal` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL	COMMENT '강아지 또는 고양이',
	`Field2`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL,
	`Field5`	VARCHAR(255)	NULL,
	`Field6`	VARCHAR(255)	NULL,
	`Field7`	VARCHAR(255)	NULL,
	`Field8`	VARCHAR(255)	NULL,
	`admin_id`	VARCHAR(255)	NOT NULL	COMMENT '관리자는 한 명으로 가정하였습니다.'
);

CREATE TABLE `like` (
	`Key`	VARCHAR(255)	NOT NULL,
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '좋아요 누른 회원 ID',
	`Key3`	VARCHAR(255)	NOT NULL,
	`Key22`	VARCHAR(255)	NOT NULL	COMMENT '게시판 작성 회원 ID',
	`Field`	VARCHAR(255)	NULL	DEFAULT sysdate
);

CREATE TABLE `noticeBoard` (
	`Key`	VARCHAR(255)	NOT NULL	COMMENT '공지게시판에 작성된 글의 고유번호',
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field6`	VARCHAR(255)	NULL	DEFAULT sysdate	COMMENT '게시글이 작성된 날짜 및 시간 표시',
	`Field3`	VARCHAR(255)	NULL	DEFAULT 0	COMMENT '글 페이지 접속할때마다 조회수 1증가',
	`admin_id`	VARCHAR(255)	NOT NULL	COMMENT '관리자는 한 명으로 가정하였습니다.'
);

CREATE TABLE `CopyOfCopyOfCopyOfUntitled32` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Key2`	VARCHAR(255)	NOT NULL,
	`Key22`	VARCHAR(255)	NOT NULL	COMMENT '신고된 댓글 작성 회원 ID',
	`Field`	VARCHAR(255)	NULL	COMMENT '1. 욕설 / 2. 도배 / 3. 광고 / 4. 기타',
	`Field2`	VARCHAR(255)	NULL	DEFAULT sysdate,
	`Field3`	VARCHAR(255)	NULL	DEFAULT 1	COMMENT '1. 신고됨 / 2. 처리됨',
	`Field4`	VARCHAR(255)	NULL,
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '신고한 회원의 ID'
);

CREATE TABLE `CopyOfCopyOfCopyOfCopyOfUntitled32` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL	COMMENT '1. 신고제재 / 2. 신고무시',
	`Field2`	VARCHAR(255)	NULL	DEFAULT 0	COMMENT '1. 게시글삭제 / 2. 유저활동정지 / 3. 계정삭제',
	`Field4`	VARCHAR(255)	NULL	DEFAULT sysdate,
	`Key2`	VARCHAR(255)	NOT NULL,
	`Key3`	VARCHAR(255)	NOT NULL	COMMENT '자유게시판에 작성된 글의 고유번호',
	`Key22`	VARCHAR(255)	NOT NULL	COMMENT '회원은 ID로 구분'
);

CREATE TABLE `CopyOfCopyOfCopyOfCopyOfCopyOfUntitled32` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL	COMMENT '1. 신고제재 / 2. 신고무시',
	`Field2`	VARCHAR(255)	NULL	DEFAULT 0	COMMENT '1. 댓글삭제 / 2. 유저활동정지 / 3. 계정삭제',
	`Field3`	VARCHAR(255)	NULL	DEFAULT sysdate,
	`Key2`	VARCHAR(255)	NOT NULL,
	`Key22`	VARCHAR(255)	NOT NULL,
	`Key222`	VARCHAR(255)	NOT NULL	COMMENT '댓글 작성 회원 ID'
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `admin` ADD CONSTRAINT `PK_ADMIN` PRIMARY KEY (
	`admin_id`
);

ALTER TABLE `volunteer` ADD CONSTRAINT `PK_VOLUNTEER` PRIMARY KEY (
	`volunteer_num`
);

ALTER TABLE `adoption` ADD CONSTRAINT `PK_ADOPTION` PRIMARY KEY (
	`Key`,
	`Key3`
);

ALTER TABLE `freeBoard` ADD CONSTRAINT `PK_FREEBOARD` PRIMARY KEY (
	`Key`,
	`user_id`
);

ALTER TABLE `CopyOfCopyOfUntitled32` ADD CONSTRAINT `PK_COPYOFCOPYOFUNTITLED32` PRIMARY KEY (
	`Key`,
	`Key3`,
	`Key22`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`Key`,
	`user_id`
);

ALTER TABLE `CopyOfCopyOfUntitled34` ADD CONSTRAINT `PK_COPYOFCOPYOFUNTITLED34` PRIMARY KEY (
	`Key`
);

ALTER TABLE `application` ADD CONSTRAINT `PK_APPLICATION` PRIMARY KEY (
	`application_num`
);

ALTER TABLE `donate` ADD CONSTRAINT `PK_DONATE` PRIMARY KEY (
	`Key`
);

ALTER TABLE `animal` ADD CONSTRAINT `PK_ANIMAL` PRIMARY KEY (
	`Key`
);

ALTER TABLE `like` ADD CONSTRAINT `PK_LIKE` PRIMARY KEY (
	`Key`
);

ALTER TABLE `noticeBoard` ADD CONSTRAINT `PK_NOTICEBOARD` PRIMARY KEY (
	`Key`
);

ALTER TABLE `CopyOfCopyOfCopyOfUntitled32` ADD CONSTRAINT `PK_COPYOFCOPYOFCOPYOFUNTITLED32` PRIMARY KEY (
	`Key`,
	`Key2`,
	`Key22`
);

ALTER TABLE `CopyOfCopyOfCopyOfCopyOfUntitled32` ADD CONSTRAINT `PK_COPYOFCOPYOFCOPYOFCOPYOFUNTITLED32` PRIMARY KEY (
	`Key`
);

ALTER TABLE `CopyOfCopyOfCopyOfCopyOfCopyOfUntitled32` ADD CONSTRAINT `PK_COPYOFCOPYOFCOPYOFCOPYOFCOPYOFUNTITLED32` PRIMARY KEY (
	`Key`
);

ALTER TABLE `adoption` ADD CONSTRAINT `FK_animal_TO_adoption_1` FOREIGN KEY (
	`Key3`
)
REFERENCES `animal` (
	`Key`
);

ALTER TABLE `freeBoard` ADD CONSTRAINT `FK_user_TO_freeBoard_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `CopyOfCopyOfUntitled32` ADD CONSTRAINT `FK_freeBoard_TO_CopyOfCopyOfUntitled32_1` FOREIGN KEY (
	`Key3`
)
REFERENCES `freeBoard` (
	`Key`
);

ALTER TABLE `CopyOfCopyOfUntitled32` ADD CONSTRAINT `FK_freeBoard_TO_CopyOfCopyOfUntitled32_2` FOREIGN KEY (
	`Key22`
)
REFERENCES `freeBoard` (
	`user_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_user_TO_comment_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `CopyOfCopyOfCopyOfUntitled32` ADD CONSTRAINT `FK_comment_TO_CopyOfCopyOfCopyOfUntitled32_1` FOREIGN KEY (
	`Key2`
)
REFERENCES `comment` (
	`Key`
);

ALTER TABLE `CopyOfCopyOfCopyOfUntitled32` ADD CONSTRAINT `FK_comment_TO_CopyOfCopyOfCopyOfUntitled32_2` FOREIGN KEY (
	`Key22`
)
REFERENCES `comment` (
	`user_id`
);

