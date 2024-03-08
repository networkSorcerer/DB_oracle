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

SELECT ad.adoption_id, ad.adoption_title, ad.adoption_status, a.animal_id, a.animal_name
		FROM adoption ad JOIN animal a on a.animal_id = ad.animal_id
		ORDER BY ad.adoption_id DESC;


SELECT ad.adoption_id, ad.adoption_title, ad.adoption_status, a.animal_id, a.animal_name, ad.adoption_date, ad.adoption_cnt
		FROM adoption ad JOIN animal a on a.animal_id = ad.animal_id
		ORDER BY ad.adoption_id DESC;
        
        
        
        