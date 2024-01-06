-- Java �����Ͽ� ����� ���̺� ����
-- books ���̺� ����
create table books (
	book_id number,                  --å��ȣ
	title varchar2(80) not null,     --å����
	publisher varchar2(60) not null, --���ǻ�
	year varchar2(4) not null,       --�Ⱓ�⵵
	price number not null,           --å����
	constraint books_pk primary key(book_id)
);

-- books_seq ������ ����
create sequence books_seq
start with 1
increment by 1
maxvalue 999999999
minvalue 1
nocycle
nocache;

insert into books 
values (books_seq.nextval, '�ϰ� ����','�ζ���','2021', 200000);
insert into books 
values (books_seq.nextval, '���� ���� ��','�ζ���','2021', 200000);
insert into books 
values (books_seq.nextval, '�뼭�� ����','�ζ���','2021', 200000);
insert into books 
values (books_seq.nextval, '�⵵','�ζ���','2021', 200000);
insert into books 
values (books_seq.nextval, '���縦 ���ϴ�','�ζ���','2021', 200000);

select*from books;

SELECT*FROM BOOKS;

select books_seq.nextval from  dual;

--1.�����ȣ�� ������ �μ���� �μ��� ��ġ�� ����ϴ� ��(VIEW_LOC)�� �ۼ��϶�

CREATE VIEW VIEW_LOC AS
SELECT e.employee_id AS �����ȣ,
       e.first_name AS �����,
       d.department_name AS �μ���,
       l.city AS �μ���_��ġ
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

--2.30�� �μ� �Ҽ� ������̸��� �Ի��ϰ� �μ����� ����ϴ� ��(VIEW_DEPT30)�� �ۼ��϶�
CREATE VIEW VIEW_DEPT30 AS
SELECT e.first_name AS ����̸�,
       e.hire_date AS �Ի���,
       d.department_name AS �μ���
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id = 30;

--3.�μ��� �ִ� �޿������� ������ ��(VIEW_DEPT_MAXSAL)�� �����϶�
CREATE VIEW VIEW_DEPT_MAXSAL AS
SELECT d.department_id AS �μ���ȣ,
       d.department_name AS �μ���,
       MAX(e.salary) AS �ִ�޿�
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

--4. �޿��� ���� �޴� ������� 3�� ����ϴ� ��(VIEW_SAL_TOP3)�� �ζ��κ�� �ۼ��϶�.

CREATE VIEW VIEW_SAL_TOP3 AS
SELECT employee_id AS �����ȣ,
       first_name AS ����̸�,
       salary AS �޿�
FROM employees
ORDER BY salary DESC
FETCH FIRST 3 ROWS ONLY;

SELECT *
FROM (
    SELECT employee_id AS �����ȣ,
           first_name AS ����̸�,
           salary AS �޿�
    FROM employees
    ORDER BY salary DESC
)
WHERE ROWNUM <= 3;



SELECT * FROM VIEW_SAL_TOP3 ;


select*from locations;
select*from departments;