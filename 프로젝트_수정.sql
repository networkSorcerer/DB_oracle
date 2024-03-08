alter table animal
add(readcnt number default 0);



select * from animal;

alter table animal
add(animal_passwd number default 0);

select * from admin;

ALTER TABLE animal DROP COLUMN admin_id;

-- 테이블의 구조 확인
DESCRIBE animal;

-- 테이블의 모든 데이터 조회
SELECT * FROM animal;


alter table animal
add(animal_file varchar2(500));

comment on column animal.animal_file is '게시판 이미지 경로 및 파일명';

--썸네일을 위한 필드
alter table animal
add(animal_thumb varchar2(500));



-- 1. 테이블 구조 변경 (새로운 컬럼 추가)
ALTER TABLE animal
ADD (animal_temp_new VARCHAR2(100));

-- 2. 새로운 컬럼에 기존 데이터 복사
UPDATE animal
SET animal_temp_new = TO_CHAR(animal_temp);

-- 3. 기존 컬럼 삭제
ALTER TABLE animal
DROP COLUMN animal_temp;

-- 4. 새로운 컬럼 이름 변경
ALTER TABLE animal
RENAME COLUMN animal_temp_new TO animal_temp;


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
