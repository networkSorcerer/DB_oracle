alter table animal
add(readcnt number default 0);



select * from animal;

alter table animal
add(animal_passwd number default 0);

select * from admin;

ALTER TABLE animal DROP COLUMN admin_id;

-- ���̺��� ���� Ȯ��
DESCRIBE animal;

-- ���̺��� ��� ������ ��ȸ
SELECT * FROM animal;


alter table animal
add(animal_file varchar2(500));

comment on column animal.animal_file is '�Խ��� �̹��� ��� �� ���ϸ�';

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

SELECT ad.adoption_id, ad.adoption_title, ad.adoption_status, a.animal_id, a.animal_name
		FROM adoption ad JOIN animal a on a.animal_id = ad.animal_id
		ORDER BY ad.adoption_id DESC;


SELECT ad.adoption_id, ad.adoption_title, ad.adoption_status, a.animal_id, a.animal_name, ad.adoption_date, ad.adoption_cnt
		FROM adoption ad JOIN animal a on a.animal_id = ad.animal_id
		ORDER BY ad.adoption_id DESC;
        
        
        
        