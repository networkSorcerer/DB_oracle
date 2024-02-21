-- Java �����Ͽ� ����� ���̺� ����
-- books ���̺� ����
create table BOOKS (
	book_id number,                  --å��ȣ
	title varchar2(80) not null,     --å����
	publisher varchar2(60) not null, --���ǻ�
	year varchar2(4) not null,       --�Ⱓ�⵵
	price number not null,           --å����
	constraint books_pk primary key(book_id)
);

-- books_seq ������ ����
create sequence BOOK_SEQ
start with 1
increment by 1
maxvalue 999999999
minvalue 1
nocycle
nocache;

insert into BOOKS 
values (1, '�ϰ� ����','�ζ���','2021', 200000);
insert into BOOKS
values (2, '���� ���� ��','�ζ���','2021', 200000);
insert into BOOKS 
values (3, '�뼭�� ����','�ζ���','2021', 200000);
insert into BOOKS
values (4, '�⵵','�ζ���','2021', 200000);
insert into BOOKS 
values (5, '���縦 ���ϴ�','�ζ���','2021', 200000);



select*from BOOKS;