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

