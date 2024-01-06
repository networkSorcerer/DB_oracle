--1. �޿��� 3000 �̻��� ����� ������ �����ȣ, �̸�, ������, �޿��� ����϶�
SELECT EMPLOYEE_ID , FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 3000;

--2. ��� ������ ST_MAN�� ����� ������ �����ȣ, �̸�, ������, �޿�, �μ���ȣ�� ����϶�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'ST_MAN';

---------3. �Ի����ڰ� 2006�� 1��1�� ���Ŀ� �Ի��� ����� ������ �����ȣ, �̸�, ������, �޿�,
--�Ի�����, �μ���ȣ�� ����϶�
SELECT EMPLOYEE_ID , FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('2006/01/01', 'YYYY-MM-DD');

--4. �޿��� 3000���� 5000������ ������ �̸�, ������, �޿� , �μ���ȣ�� ����϶�
SELECT FIRST_NAME, JOB_ID, SALARY , DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 5000;

---------5. �Ի����ڰ� 05�⵵�� �Ի��� ����� ������ �����ȣ, �̸�, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�
SELECT EMPLOYEE_ID, FIRST_NAME , JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EXTRACT(YEAR FROM HIRE_DATE) = 2005;

--6. �������(EMPLOYEES)���̺��� �����ȣ, �̸�, �޿�, ������ȣ, �Ի���, ����� �����ȣ�� ����Ͻÿ�
--�̶� �̸��� ���� �̸��� �����Ͽ� NAME�̶�� ��Ī���� ����Ͻÿ�
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME, SALARY, JOB_ID, HIRE_DATE, MANAGER_ID
FROM EMPLOYEES;

--7.  ����� ���� �̸��� NAME, ������ȣ�� JOB, �޿��� SALARY, ������ $100���ʽ��� �߰��Ͽ� ����� ���� 
--INCREASED Ann_Salary, �޿��� $100���ʽ��� �߰��Ͽ� ����� ������ increased Salary��� ��Ī���� ����Ͻÿ�
select  FIRST_NAME || ' ' || LAST_NAME AS NAME, JOB_ID AS JOB, SALARY, 
NVL(SALARY+(SALARY*COMMISSION_PCT),0) AS INCREASED_Ann_Salary, SALARY+100 AS INCREASED_SALARY
FROM EMPLOYEES;


--------8.��� ����� �̸��� ������ �̸� 1YEAR SALARY=$���� �������� ����ϰ� 1 YEAR SALARY��� ��Ī�� �ٿ� ����Ͻÿ�
SELECT 
    LAST_NAME || ' ' || FIRST_NAME || ' 1YEAR SALARY=$' || SALARY AS "1 YEAR SALARY"
FROM EMPLOYEES;

-------9. �μ����� ����ϴ� ���� ID�� �ѹ��� ����Ͻÿ�
SELECT DISTINCT DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES;

--10. �μ����� ���� �� ������ �޿� ���� ������ �ۼ��Ϸ��� �Ѵ�. ������� ���̺��� �޿��� $7000
--�� �̿��� ����� ���� �̸� �� �޿��� �޿��� ���� ������ ����Ͻÿ�
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY <= 7000
ORDER BY SALARY;

------11.2006�� 05�� 20�Ϻ��� 2007�� 05�� 20�� ���̿� ���� ������� ���� �̸� (NAME ��Ī),
--�����ȣ, �Ի����ڸ� ��, �Ի����� ���� ������ �����Ͻÿ�
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME , EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2006/05/20' AND '2007/05/20'
ORDER BY HIRE_DATE;

------12.�μ������� �޿��� �������� ���� ���� ������ �ۼ��Ϸ��� �Ѵ�
--�̿� ������ �޴� ��� ����� ���� �̸�(NAME ��Ī), �޿�, ����, �������� ����Ͻÿ� 
--�̶� �޿��� ū ������� �����ϵ�, �޿��� ������ �������� ū ������� �����Ͻÿ� 
SELECT 
    LAST_NAME || ' ' || FIRST_NAME AS NAME,
    SALARY,
    JOB_ID,
    COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC;

------�߰�1 �̸�, �޿�, Ŀ�̼� �ݾ�, �Ѿ�(�޿�+Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������� ����϶� 
--��, Ŀ�̼��� NULL�� ����� ���� �Ѵ�
SELECT FIRST_NAME , SALARY , SALARY*NVL(COMMISSION_PCT, 0) AS Ŀ�̼Ǳݾ�, 
SALARY+SALARY*NVL(COMMISSION_PCT, 0) AS �Ѿ�
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY �Ѿ� DESC;

--�߰� 2 �̹��б⿡ 60�� IT�μ������� �ű����α׷��� �����ϰ� �����Ͽ� ȸ�翡 �����Ͽ���
--�̿� �ش� �μ��� ����޿��� 12.3% �λ��ϱ�� �Ͽ���
--60�� IT�μ� ����� �޿��� 12.3% �λ��Ͽ� ������ (�ݿø�) ǥ���ϴ� ������ �ۼ��Ͻÿ�
--��������� ���, �̸��� ��(NAME ���� ��Ī) �޿� �λ�� �޿� (INCREASED SALARY�� ��Ī)������ ����Ѵ�
SELECT 
    EMPLOYEE_ID,
    LAST_NAME || ' ' || FIRST_NAME AS NAME,
    SALARY,
    ROUND(SALARY*1.123) AS "INCREASED SALARY"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY "INCREASED SALARY" DESC;

--�߰� 3. �޿��� 1500���� 3000 ������ ����� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���
--�̸� �̸�, �޿�, ȸ��(�Ҽ��� ���� �ݿø�)�� ����϶�
SELECT FIRST_NAME , SALARY, ROUND(SALARY*0.15) AS ȸ��
FROM EMPLOYEES
WHERE SALARY BETWEEN 1500 AND 3000;

--�߰� 4 ��� ����� �Ǽ��ɾ��� ����Ͽ� ����϶�. ��, �޿��� ���� ������ �̸�, �޿�, �Ǽ��ɾ��� ����϶�
SELECT 
    LAST_NAME || ' ' || FIRST_NAME AS NAME,
    SALARY,
    SALARY - ROUND(SALARY * 0.1) AS NET_SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

