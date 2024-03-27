-----------------------------------------------------------------------------------------
--Animal 변경 사항 
alter table animal
add(readcnt number default 0);

alter table animal
add(animal_passwd number default 0);

ALTER TABLE animal DROP COLUMN admin_id;

alter table animal
add(animal_file varchar2(500));



--썸네일을 위한 필드
alter table animal
add(animal_thumb varchar2(500));

-- 1. 테이블 구조 변경 (새로운 컬럼 추가) --animal_temp를 select 로 변경했습니다
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



--animal을 지우면 image 지우기
ALTER TABLE image
ADD CONSTRAINT FK_animal_TO_image_1
FOREIGN KEY (animal_id)
REFERENCES animal(animal_id)
ON DELETE CASCADE;

--adoption 지우면 image 지우기
ALTER TABLE image
ADD CONSTRAINT FK_adoption_TO_image_1
FOREIGN KEY (adoption_id)
REFERENCES adoption(adoption_id)
ON DELETE CASCADE;

--adoption 지우면 counseling 지우기
ALTER TABLE counseling
ADD CONSTRAINT FK_adoption_TO_counseling_1
FOREIGN KEY (adoption_id)
REFERENCES adoption(adoption_id)
ON DELETE CASCADE;

--animal 지우면 adoption 지우기 
ALTER TABLE adoption
ADD CONSTRAINT FK_animal_TO_adoption_1
FOREIGN KEY (animal_id)
REFERENCES animal(animal_id)
ON DELETE CASCADE;

ALTER TABLE survey
ADD CONSTRAINT FK_COUNSELING_TO_SURVEY_1
FOREIGN KEY (counseling_id)
REFERENCES counseling(counseling_id)
ON DELETE CASCADE;

-- 이미지 테이블의 animal_id 외래 키 제약 조건 삭제
ALTER TABLE image
DROP CONSTRAINT FK_animal_TO_image_1;

-- 이미지 테이블의 adoption_id 외래 키 제약 조건 삭제
ALTER TABLE image
DROP  CONSTRAINT FK_adoption_TO_image_1;

-- 상담 테이블의 adoption_id 외래 키 제약 조건 삭제
ALTER TABLE counseling
DROP CONSTRAINT FK_adoption_TO_counseling_1;

-- 입양 테이블의 animal_id 외래 키 제약 조건 삭제
ALTER TABLE adoption
DROP CONSTRAINT FK_animal_TO_adoption_1;

ALTER TABLE survey
DROP CONSTRAINT FK_COUNSELING_TO_SURVEY_1;

--FK_animal_TO_adoption_1
--FK_adoption_TO_image_1
--FK_animal_TO_image_1
--FK_adoption_TO_counseling_1
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------



--Adoption 변경사항

alter table adoption
add(adoption_passwd number default 0);

alter table adoption
add(adoption_file varchar2(500));

--썸네일을 위한 필드
alter table adoption
add(adoption_thumb varchar2(500));





UPDATE animal
SET animal_file = NULL;




-- 테이블의 구조 확인
DESCRIBE animal;
DESCRIBE adoption;
DESCRIBE image;
-- 테이블의 모든 데이터 조회

select * from animal;
select * from adoption;
select * from admin;
select * from image;

ALTER TABLE application DROP CONSTRAINT FK_volunteer_TO_application_1;

ALTER TABLE application ADD CONSTRAINT FK_volunteer_TO_application_1 FOREIGN KEY (volunteer_id)
REFERENCES volunteer (volunteer_id)
ON DELETE CASCADE;

