--��Ȱ���ϱ� 
--����߿��� �ֱٿ� �Ի��� ��� 5���� ��� ���� ���ǹ��� �ۼ��Ѵ�  rownumĮ���� �̿��Ѵ�
--rownumĮ���� ����Ŭ ���������� �ο��Ǵµ� insert���� ���� �Է��� ������ ���� 1�� �����Ǹ鼭 ���� �����ȴ�

select rownum, employee_id, first_name, hire_date
from employees;

select rownum, employee_id, first_name, hire_date
from employees
order by hire_date desc;

--�Ի����� �������� ������������ ������ �ߴµ��� �ش� ���� rownum�� �ٲ��� �ʴ´�
--�����Ͱ� �Էµ� �������� �����Ǹ� �ٽô� ���� �ٲ��� �ʱ� �����̴�
--���ο� ���̺� �Ի����� �������� �������� ������ �������� ����������ϸ� �ֱٿ� �Ի��� ��������� 
--rownum Į������ 1���� �ο��ȴ�

create or replace view view_hire
as select employee_id, first_name, hire_date
from employees
order by hire_date desc;

select rownum, employee_id, first_name, hire_date
from view_hire;

select rownum, employee_id, first_name, hire_date
from view_hire
where rownum <= 5;

--�ζ��� ��� top_n���ϱ�
--�ζ��� ��� sql���忡�� ����ϴ� ���������� �������� ���� from ���� ��ġ�ؼ� ���̺� ó�� ����ϴ� ���̴�
--�ζ��� ��� ���� ������ select���� from �� ���ο� ���� ������������ ���Ѵ�
--create view�� �����ϴ� ���� �ƴ϶� �ζ��� ��� sql�� ���ο� �並 �����ϰ� �̸� ���̺�ó�� ����Ѵ�
select rownum, employee_id, first_name, hire_date
from (select employee_id, first_name, hire_date
from employees
order by hire_date desc)
where rownum <= 5;

--employee ���̺�� department ���̺��� ��ȸ�Ͽ� �μ���ȣ�� �μ��� �ִ� �޿� �� �μ����� ����ϼ��� 

select e.department_id, d.department_name, e.salary
from (select department_id, max(salary)salary
from employees group by department_id)
e inner join departments d
on e.department_id = d.department_id;

--with
--���������� �̸��� �ٿ��ְ� �ζ��κ�� ���� ���������� �̸����� from ���� ��� �����ϴ�
--���� ���������� ������ ���� ��� �ߺ� �ۼ��� ���Ҽ� �ְ� ����ӵ��� �������ٴ� ������ �ִ�
--�ֱٿ� �Ի��� ��� 5���� ������ּ��� �̶� rownum�÷��� �̿��� ������ ����

with topn_hire
as
(select employee_id, first_name, hire_date
from employees
order by hire_date desc)

select rownum, employee_id, first_name, hire_date
from topn_hire
where rownum <=5;

--employees ���̺��� �޿��� �ڽ��� ���� �μ��� ��� �޿����� ���� �޴� ����� �μ���ȣ, �̸�, �޿��� ����ϴ� 
--select���� �ۼ��Ͻÿ�

select e.department_id, e.first_name, e.salary
from employees e inner join (select department_id, avg(salary) d_salary
from employees
group by department_id)d
on e.department_id = d.department_id
where e.salary > d.d_salary
order by e.department_id;

with dept_sal
as
(select department_id, avg(salary) d_salary
from employees
group by department_id)

select e.department_id, e.first_name, e.salary
from employees e inner join dept_sal d on e.department_id=d.department_id
where e.salary > d.d_salary
order by e.department_id;

--rank() over()
--�����ο��� �ߺ���(������)�� �߻��Ǹ� �ߺ����� ������ŭ �ǳʶٰ� ���� ���� �ο��Ѵ�
--���� ��� 90, 80, 80, 80, 70�̸� ������ 1,2,2,2,5�� �ο���

--������̺��� 60�� �μ��� �Ҽӵ� ����߿��� �Ի�⵵�� ���� ���� ������ �����ȣ, �����, �Ի�����, ������ �ο��Ͽ� 
--������ּ���

select employee_id as �����ȣ, first_name as �����, hire_date as �Ի�����, 
rank() over (order by hire_date desc) as ����
from employees
where department_id =60;

--������̺��� �޿��� ���� ���� �޴� ������ �ο��ϰ� ���� 5�� ����� ���ô�

select salary_rank, first_name, salary
from (select first_name, salary,
rank()over(order by salary desc)as salary_rank
from employees
order  by salary desc)
--where rownum <= 5;
where salary_rank <=5;

--dense_rank() over()
--������̺� 60�� �μ��� �Ҽӵ� ����߿��� �޿������� ���� �޴� ������ �����ȣ, �����, �޿�,
--������ �ο��ϼ���
select employee_id as �����ȣ, first_name as �����, salary as �Ի�����,
row_number() over(order by salary desc) as ����
from employees
where department_id = 60;

--partition by
--����Ŭ���� �׷��Լ��� ����Ҷ� partition by�� ����Ͽ� �׷����� ��� ������ �Ҽ��ִ�. 
--group by ���� ������� �ʰ� ��ȸ�� �� �࿡ �׷����� ����� ���� ǥ���Ҷ� over ���� �Բ� 
--partition by���� ����ϸ� �ȴ�

--�μ��� �޿��� �� ���
select department_id,
sum(salary)
from employees
where department_id between 10 and 30
group by department_id
order by department_id;

--�μ���ȣ�� �����, �μ��� �޿��� ���� �Բ� ���
select department_id,
first_name,
sum(salary) over(partition by department_id)as salary_total
from employees
where department_id between 10 and 30
order by department_id;

-- ���� ������ ���� �����и� ��ȸ�� �� �࿡ �׷��Լ��� ������ ���� �߰��� �� �࿡ ǥ���ϸ�,
--��ȸ�� �����ʹ� group by���� ������� �ʾұ� ������ �����Ͱ� �������� �ʴ´�

--�׷��Լ��� ����Ҷ��� over ���� �Բ� ����ؾ��ϸ�, over �� ���ο� 
--partition by���� ������� ������ ������ü�� �����ϸ�
--partition by ���� ����ϸ� ���� ������� �ش� Į���� �׷����� ��� ����� ǥ���Ѵ�

select department_id,
first_name,
salary,
sum(salary) over(partition by department_id) as department_total,
sum(salary) over() as salary_total
from employees
where department_id between 10 and 30
order by department_id;

--�� �μ��� �Ҽӵ� ��� ��ü�� �ƴ϶� �� �μ��� �Ѹ��� ����� ����ϰ��� �Ѵ�. �̶� �����ȣ, �����,
--������ȣ, �޿�, �μ���ȣ�� ��ȸ�غ��ô�
--������ �� �μ����� ��ȣ�� �ο��غ��ô�
select employee_id
,first_name
,job_id
,salary
,department_id
,row_number()over(partition by department_id order by employee_id) as rnum
from employees
order by department_id;

select employee_id, first_name, department_id, hire_date
from (select row_number() over(partition by department_id order by employee_id)
as rnum, employee_id, first_name, department_id, hire_date
from employees) data
where data.rnum = 1;



create table subject (
no number not null,
s_num varchar2(2) not null,
s_name varchar2(80) not null,
constraint subject_no_pk primary key(no),
constraint subject_s_num_uk unique(s_num)
);

insert into subject (no, s_num, s_name) values(1, '01', '��ǻ���а�');
insert into subject (no, s_num, s_name) values(2, '02', '�����а�');
insert into subject (no, s_num, s_name) values(3, '03', '�Ź�����а�');
insert into subject (no, s_num, s_name) values(4, '04', '���ͳݺ���Ͻ��а�');
insert into subject (no, s_num, s_name) values(5, '05', '����濵��');



--�л� ���̺� (�ڽ����̺�)
create table student(
no number not null,
sd_num varchar2(8) not null,
sd_name varchar2(20) not null,
sd_id varchar2(15) not null,
sd_passwd varchar2(15) not null,
s_num varchar2(2) not null,
sd_birth char(8) not null,
sd_phone varchar2(15) not null,
sd_address varchar2(200) not null,
sd_email varchar2(100) not null,
sd_date date default sysdate,
constraint student_no_pk primary key(no),
constraint student_sd_num_uk unique(sd_num),
constraint student_id_uk unique(sd_id),
constraint student_s_num_fk foreign key(s_num) references subject(s_num)
);

insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(1, '06010001','������','javajsp','java1234','01','19860424','01012345678','����� ���빮�� â����','java12@naver.com');
insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(2, '95010002','�����','jdbcmania','mania12','01','19751009','0103452468','����� ���ʱ� ���絿','jdbmania@naver.com');
insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(3, '98040001','������','gonji','mania12','04','19780516','01012657455','�λ걤���� �ؿ�뱸 �ݼ۵�','gonji@naver.com');
insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(4, '02050001','������','water','java1234','05','19820831','0107681499','���������� �߱� ���ൿ','water@naver.com');
insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(5, '94040002','�ְ��','novel','novle2468','04','19741025','0109872455','��⵵ ������ ��ȱ� �̸�','novel@naver.com');
insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(6, '08020001','������','korea','korea99','02','19880805','0108452345','����� ������ ���ﵿ','korea@naver.com');
