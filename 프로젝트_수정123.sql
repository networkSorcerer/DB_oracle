
--Animal ���� ���� 
alter table animal
add(readcnt number default 0);

alter table animal
add(animal_passwd number default 0);

ALTER TABLE animal DROP COLUMN admin_id;

alter table animal
add(animal_file varchar2(500));

--������� ���� �ʵ�
alter table animal
add(animal_thumb varchar2(500));

-- 1. ���̺� ���� ���� (���ο� �÷� �߰�)
ALTER TABLE animal
ADD (animal_temp_new VARCHAR2(100));

-- 2. ���ο� �÷��� ���� ������ ����
UPDATE animal
SET animal_temp_new = TO_CHAR(animal_temp);

-- 3. ���� �÷� ����
ALTER TABLE animal
DROP COLUMN animal_temp;

-- 4. ���ο� �÷� �̸� ����
ALTER TABLE animal
RENAME COLUMN animal_temp_new TO animal_temp;








--Adoption �������

alter table adoption
add(readcnt number default 0);

alter table adoption
add(adoption_passwd number default 0);


alter table adoption
add(adoption_file varchar2(500));

--������� ���� �ʵ�
alter table adoption
add(adoption_thumb varchar2(500));






       
create table center (
    
    center_id number not null primary key,
    center_name varchar2(100) ,
    center_address varchar2(100) , 
    center_operating varchar2(100) ,
    center_tell varchar2(50) ,
    center_lat number ,
    center_lot number
    );

 





CREATE SEQUENCE center_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


insert into center ( center_id,center_name,center_address,center_operating,center_tell,center_lat,center_lot)
values (center_seq.nextval,'���׸��� ��ȣ��',' ����Ư���� ���ı� ����ȣ���� 104','���߹��� 10:00 ~ 20:00','070-4349-3357',37.5077209,127.0884273);

insert into center ( center_id,center_name,center_address,center_operating,center_tell,center_lat,center_lot)
values (center_seq.nextval,'��������',' ���� ��걸 �������32�� 28 2��','���߹��� 12:00~20:30','0507-1316-1160',37.5334362,126.9902071);

insert into center ( center_id,center_name,center_address,center_operating,center_tell,center_lat,center_lot)
values (center_seq.nextval,'���� ���� ��� ����',' ����Ư���� ���ʱ� ����õ��19�� 22','������ �޹� 10:00~17:00','02-6956-7980',37.4763321,127.0381241);
           




-- ���̺��� ���� Ȯ��
DESCRIBE animal;
DESCRIBE adoption;
DESCRIBE center;
-- ���̺��� ��� ������ ��ȸ

select * from animal;
select * from adoption;
select * from admin;
select * from center;


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





