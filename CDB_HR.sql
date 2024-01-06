select*from tab;

select*from departments;

select*from employees;

select*from tab;

DESC EMPLOYEES;

SELECT*FROM EMPLOYEES;

DESC DEPARTMENTS;

SELECT*FROM DEPARTMENTS;
--DEPARTMENTS
SELECT*FROM DEPARTMENTS;
--EMPLOYEES ���̺��� ��� ���� ���
--DEPARTMENTS ���̺��� �μ� ��ȣ�� �μ��� ���
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;
--AS�� �÷��� ��Ī �ο��ϱ� : Į���� ����� �ٷ� �ڿ� AS��� Ű���带 �� �� ��Ī�� ���

SELECT DEPARTMENT_ID AS DepartmentNo, DEPARTMENT_NAME AS DepartmentName
FROM DEPARTMENTS;

--AS ���� �÷��� ��Ī �ο��ϱ�
SELECT DEPARTMENT_ID "Department No", DEPARTMENT_NAME "Department Name"
FROM DEPARTMENTS;

--  ��Ī���� �ѱ� ����� �����ϴ�
SELECT DEPARTMENT_ID �μ���ȣ, DEPARTMENT_NAME �μ���
FROM DEPARTMENTS;
--CONCATENATION �������� ���ǿ� ���(���� ������)
--���� �÷��� �ϳ��� ���ڿ��� ����ϱ�
SELECT FIRST_NAME ||'�� ������'||JOB_ID||'�Դϴ�'AS����
FROM EMPLOYEES;

--�ߺ��� �����͸� �ѹ����� ����ϰ� �ϴ� DISTINCT
SELECT JOB_ID FROM EMPLOYEES;
--��ü ������ ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES;

--�޿��� 3000�̻� �޴� ������ ��� 
SELECT EMPLOYEE_ID, FIRST_NAME , SALARY
FROM EMPLOYEES
WHERE SALARY>= 3000;

--�޿��� 3000�̸� �޴� ������ ���

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY <3000
--�μ���ȣ�� 110���� ������ ���� ��� ������ ����϶�

SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 110;

--�޿��� 5000�̸��� �Ǵ� ������ �����߿��� ����� �̸�, �޿��� ����϶�

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Lex';

-- 2008�� ���Ŀ� �Ի��� ����
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2008/01/01';

--�� ������ ���� ������ ��� �����ؾ� �� ��� AND�����ڸ� ����Ѵ�
--�μ���ȣ�� 100���̰� ������ FI_MGR�� ����

SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, DEPARTMENT_ID,
JOB_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100 AND JOB_ID = 'FI_MGR';

--�޿��� 5000���� 10000���� ���� ���� ���
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 10000
-- OR ������
-- �μ� ��ȣ�� 100���̰ų� ������ FI_MGR�� ����

SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID =100 OR JOB_ID = 'FI_MGR';

--�����ȣ�� 134�̰ų� 201�̰ų� 107�� ���� ���� ���
SELECT DEPARTMENT_ID 
FROM EMPLOYEES

SELECT EMPLOYEE_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID

--�μ���ȣ�� 100���� �ƴ� ����

SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE NOT DEPARTMENT_ID IN(100);

--�޿��� 2000�������� 3000������ ������ ���� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 2000 AND 3000;

SELECT EMPLOYEE_ID , FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 2500 AND 4500

--������ȣ�� 177 �̰ų� 101 �̰ų� 184 �� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID=177 OR EMPLOYEE_ID=101 OR EMPLOYEE_ID=184;

SELECT EMPLOYEE_ID , FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN(177, 101, 184);

--�μ���ȣ�� 10, 20,30 �� �ϳ��� �Ҽӵ� ������ ���� ��ȣ,�̸� �޿��� ����϶�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ( 10, 20, 30);

--���ϵ�ī��(%) ����ϱ�
--%�� �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��� ����Ѵ� %�� ��� ���ڰ� ���� ������ٴ��ǹ�
--K�� �����ϴ»��
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE'K%';
--K�� �����ϴ� ���
SELECT EMPLOYEE_ID , FIRST_NAME
FROM EMPLOYEES
WHERE LOWER(FIRST_NAME)LIKE'%k%';

--�̸��� K�� ������ ���
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE'%k';

--���ϵ�ī��(_) ����ϱ�
--  -�� �ѹ��ڸ� ����ؼ� ����Ѱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_d%';

--NULL������ ������
--����Ŭ������ Į���� NULL���� ����Ǵ� ���� ����Ѵ�
--NULL�� ��Ȯ��, �� ������ (UNKNOWN)���� �ǹ��Ѵ�. 0(ZERO)�� ������� �ƴ� � ����
--�����ϱ�� ������ � �������� �˾Ƴ������� ���� �ǹ��Ѵ�
--NULL�� ����, �Ҵ�, �񱳰� �Ұ����ϴ�

--Ŀ�̼��� ���� �ʴ� ����� ���� �˻�
SELECT EMPLOYEE_ID , FIRST_NAME, COMMISSION_PCT, JOB_ID
FROM EMPLOYEES
WHERE COMMISSION_PCT=NULL;

-- IS NULL , IS NOT NULL �� ǥ�� = �̳� !=�� ������� �ʴ´�

--Ŀ�̼��� ���� �ʴ� ���
SELECT EMPLOYEE_ID , FIRST_NAME, COMMISSION_PCT, JOB_ID
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

--Ŀ�̼��� �޴� ���
SELECT EMPLOYEE_ID, FIRST_NAME, COMMISSION_PCT, JOB_ID
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

--�ڽ��� ���� ����� ���� ������ ��ü �̸��� ���� ��ȣ ���� ID�� ����϶�

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

--ASC �������� DESC ��������

--����� �������� ���� �������� ����
SELECT EMPLOYEE_ID , FIRST_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID ASC;

-- ������������ ������ ���� DESC
-- �����ȣ�� �������� ������������ ����
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID DESC;
