-----------------------------------------------------------------------------------------
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

-- 1. ���̺� ���� ���� (���ο� �÷� �߰�) --animal_temp�� select �� �����߽��ϴ�
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



--animal�� ����� image �����
ALTER TABLE image
ADD CONSTRAINT FK_animal_TO_image_1
FOREIGN KEY (animal_id)
REFERENCES animal(animal_id)
ON DELETE CASCADE;

--adoption ����� image �����
ALTER TABLE image
ADD CONSTRAINT FK_adoption_TO_image_1
FOREIGN KEY (adoption_id)
REFERENCES adoption(adoption_id)
ON DELETE CASCADE;

--adoption ����� counseling �����
ALTER TABLE counseling
ADD CONSTRAINT FK_adoption_TO_counseling_1
FOREIGN KEY (adoption_id)
REFERENCES adoption(adoption_id)
ON DELETE CASCADE;

--animal ����� adoption ����� 
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

-- �̹��� ���̺��� animal_id �ܷ� Ű ���� ���� ����
ALTER TABLE image
DROP CONSTRAINT FK_animal_TO_image_1;

-- �̹��� ���̺��� adoption_id �ܷ� Ű ���� ���� ����
ALTER TABLE image
DROP  CONSTRAINT FK_adoption_TO_image_1;

-- ��� ���̺��� adoption_id �ܷ� Ű ���� ���� ����
ALTER TABLE counseling
DROP CONSTRAINT FK_adoption_TO_counseling_1;

-- �Ծ� ���̺��� animal_id �ܷ� Ű ���� ���� ����
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



--Adoption �������

alter table adoption
add(adoption_passwd number default 0);

alter table adoption
add(adoption_file varchar2(500));

--������� ���� �ʵ�
alter table adoption
add(adoption_thumb varchar2(500));





UPDATE animal
SET animal_file = NULL;




-- ���̺��� ���� Ȯ��
DESCRIBE animal;
DESCRIBE adoption;
DESCRIBE image;
-- ���̺��� ��� ������ ��ȸ

select * from animal;
select * from adoption;
select * from admin;
select * from image;

ALTER TABLE application DROP CONSTRAINT FK_volunteer_TO_application_1;

ALTER TABLE application ADD CONSTRAINT FK_volunteer_TO_application_1 FOREIGN KEY (volunteer_id)
REFERENCES volunteer (volunteer_id)
ON DELETE CASCADE;

