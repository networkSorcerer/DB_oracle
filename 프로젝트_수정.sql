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

--입양 공고 이미지 파일 
alter table adoption
add(adoption_file varchar2(500));
--입양 공공 썸네일 파일 
alter table  adoption
add(adoption_thumb varchar2(500));

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
        
        
create table center (
    center_id number not null primary key,
    center_adress varchar2(100) , 
    center_operating varchar2(100) ,
    center_tell varchar2(50) ,
    center_lat number ,
    center_lot number
    );

alter table center add center_name varchar2(100);   

select * from center;

ALTER TABLE center
RENAME COLUMN center_adress TO center_address;


CREATE SEQUENCE center_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


insert into center ( center_id,center_name,center_address,center_operating,center_tell,center_lat,center_lot)
values (center_seq.nextval,'도그마루 보호소',' 서울특별시 송파구 석촌호수로 104','연중무휴 10:00 ~ 20:00','070-4349-3357',37.5077209,127.0884273);

insert into center ( center_id,center_name,center_address,center_operating,center_tell,center_lat,center_lot)
values (center_seq.nextval,'아이조아',' 서울 용산구 녹사평대로32길 28 2층','연중무휴 12:00~20:30','0507-1316-1160',37.5334362,126.9902071);

insert into center ( center_id,center_name,center_address,center_operating,center_tell,center_lat,center_lot)
values (center_seq.nextval,'서초 동물 사랑 센터',' 서울특별시 서초구 양재천로19길 22','월요일 휴무 10:00~17:00','02-6956-7980',37.4763321,127.0381241);
           
 select * from adoption;
 
select an.animal_id, an.animal_name, an.animal_species, an.animal_gender, an.animal_gender, 
an.animal_kg, an.animal_age,
an.animal_age,an.animal_color,an.animal_status,an.animal_memo,an.animal_temp, 
ad.adoption_id, ad.adoption_title,ad.adoption_level,ad.adoption_status,ad.adoption_date,
ad.adoption_cnt,ad.adoption_file,ad.adoption_thumb
from animal an  join adoption ad  on an.animal_id = ad.animal_id;

	SELECT
    an.animal_id, an.animal_name, an.animal_species, an.animal_gender, an.animal_kg, an.animal_age,
    an.animal_color, an.animal_status, an.animal_memo, an.animal_temp,
    ad.adoption_id, ad.adoption_title, ad.adoption_level, ad.adoption_status, ad.adoption_date,
    ad.adoption_cnt, ad.adoption_file, ad.adoption_thumb
FROM
    animal an
INNER JOIN
    adoption ad ON an.animal_id = ad.animal_id
    where an.animal_id=ad.animal_id;
    
    
select * from animal;
select * from adoption;
 
ALTER TABLE adoption
DROP COLUMN admin_id;

AlTER TABLE adoption
DROP COLUMN animal_id;

alter table adoption
add(adoption_passwd number default 0);

alter table adoption
add(animal_id number );

INSERT INTO adoption (adoption_id, adoption_title, adoption_level, adoption_status, adoption_content, adoption_passwd)
VALUES (adoption_seq.nextval, '공고', '상', '공고 중', '입양 강추', '1234');


UPDATE adoption
SET animal_id = 1
WHERE adoption_id = 1;
UPDATE adoption
SET animal_id = 2
WHERE adoption_id = 2;
UPDATE adoption
SET animal_id = 3
WHERE adoption_id = 3;
UPDATE adoption
SET animal_id = 4
WHERE adoption_id = 4;
UPDATE adoption
SET animal_id = 5
WHERE adoption_id = 5;
UPDATE adoption
SET animal_id = 6
WHERE adoption_id = 6;
UPDATE adoption
SET animal_id = 7
WHERE adoption_id = 7;
UPDATE adoption
SET animal_id = 8
WHERE adoption_id = 8;
UPDATE adoption
SET animal_id = 9
WHERE adoption_id = 9;
UPDATE adoption
SET animal_id = 10
WHERE adoption_id = 10;
