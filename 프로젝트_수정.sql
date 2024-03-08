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

