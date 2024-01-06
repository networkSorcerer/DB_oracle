--���̺� ������ �߰�/ ����/ �����ϱ� ���� DML

--���̺� ���ο� ���� �߰��ϴ� INSERT��

--Ư���� �÷����� DATA�� �Է��ϴ� ���
--INSERT INTO TABLE_NAME(COLUMN_VALUE,...)
--VALUES(COLUMN_VALUE,...)
--��� �÷��� DATA�� �Է��ϴ� ���
--INSERT INTO TABLE_NAME
--VALUES(COLUMN_VALUE,...)
--���ο� ���� �߰��ϱ� ���� INSERT���� ����ϸ� �ѹ��� �ϳ��� �ุ ���Եȴ�
--����� Į�� ��� ������� VALUES�� ������ ���� ���Եȴ�. ���� Į�� ����� �������
--������ ���̺� �ִ� Į���� ����Ʈ ������� VALUES������ ���� ���ԵǸ� ���ڿ� ��¥ ����
--���� ����ǥ('')�� ����ؾ��Ѵ�
--���� �μ� ���̺� DEPT�� �����Ѵ�

CREATE TABLE DEPT(
DEPTNO NUMBER(2),
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);

DESC DEPT;

SELECT*FROM DEPT;

--Į�� DEPTNO�� 10�� �μ�, DNAME���� 'ACCOUNTING'��, LOC���� 'NEWYORK'�� �߰�����

INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING','NEW YORK');

--INSERT �������� ���� �߻��� ��
--Į������ ����� ����� ������ VALUES ������ ������ ��ȣ�ȿ� ����� ���� ������ ������
--������ �߻��Ѵ�

INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(10,'ACCOUNTING');

--Į���� ����� ����� ������ VALUES ������ ������ ��ȣ�� ����� ���� ������ ������
--������ �߻��Ѵ�

INSERT INTO DEPT(DEPTNO, DNAME)
VALUES(10, 'ACCOUNTING','NEW YORK', 20);

--Į������ �߸��ԷµǾ��� ������ ������ �߻��Ѵ�

INSERT INTO DEPT(NUM, DNAME, LOC)
VALUES(10, 'ACCOUNTING','NEW YORK');

--Į���� �Է��� ���� ������ Ÿ���� ���� ���� ���� ��쿡�� ������ �߻��Ѵ�
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES (10, ACCOUNTING, 'NEW YORK');

--Į������ ������ INSERT ����
--���̺� �ο츦 �߰��Ҷ� ��� Ư�� Į���� �ƴѸ�� Į���� �ڷḦ �Է��ϴ� ��쿡�� ����
--Į�� ����� ������� �ʾƵ� �ȴ� Į�� ����� �����Ǹ� VALUES �� ������ ������ ���̺���
--�⺻ Į�� ������� �Էµȴ�

--Į������ ������ ä ���̺��� ���� ��� Į������ �����͸� �߰��Ѵ�

INSERT INTO DEPT
VALUES (20, 'RESEARCH','DALLAS');

SELECT*FROM DEPT;

--NULL���� ����
--�����͸� �Է��ϴ� �������� �ش� Į������ �𸣰ų� Ȯ������ �ʾ��� ��� (�����׸�)���� 
--NULL���� �Է��ؾ� �Ѵ�
--NULL�� ���Կ��� �Ͻ����� ����� ������� ����� �ִ�

DESC DEPT;

--DEPT ���̺��� �����Ҷ� ���������� �������� �ʾұ⿡ ��� Į���� NULL���� ������ �� �ֵ���
--����ϰ� �ִ�

--�μ� ���̺� Į���� NULL�� ����ϴ��� ���캸�� NULL ���� �Է����� ���ϴ� Į���� ���ؼ��� 
--NOT NULL�̶�� ǥ�õȴ�

--�Ͻ������� NULL�� ����
--�Ͻ����� ������� Į���� ����Ʈ�� Į���� �����ϴ� ���̴�. ��, �ٸ� Į���� ���� �Է�������
--�̷��� ������ Į������ �Ͻ������� NULL���� �Ҵ�ȴ�

--�������� �������� ���� 30�μ��� �μ��� �Է�

INSERT INTO DEPT(DEPTNO, DNAME)
VALUES (30, 'SALES');

--��������� NULL ���� ����
--����� ����� VALUES�� NULL�̶�� ���� ����Ͽ� �Է��ϴ� ����̴�

--�������� �������� �ʾƼ� ������ ���� 2���� Į���� �Է��ϸ� ������ �߻��Ѵ�

INSERT INTO DEPT
VALUES(40, 'OPERATIONS');

--���� ����

INSERT INTO DEPT
VALUES (40, 'OPERATIONS',NULL);

SELECT* FROM DEPT;

--NULL���� ���� Į���� �߰��ϱ� ���ؼ� NULL��� ''�� ����Ҽ� �ִ�

INSERT INTO DEPT
VALUES (50, '', 'CHICAGO');

SELECT*FROM DEPT;

--���� �����͸� �����ϰ� �ٽ� �Է� �۾��� ����

DELETE FROM DEPT;

--DEPT ���̺� ������ �÷����� �ڸ����� DEPARTMENTS ���̺��� �÷��� �ڸ����� ��ġ�ϵ���
--���̺��� ��������

ALTER TABLE DEPT MODIFY (DEPTNO NUMBER(4), DNAME VARCHAR2(30));

INSERT INTO DEPT
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID FROM DEPARTMENTS;

SELECT*FROM DEPT;

--INSERT ALL
--�ΰ� �̻��� ���̺� INSERT ALL �� �̿��Ͽ�  �ѹ��� ���� ����
--��, �� ���������� �������� ���ƾ� ��

CREATE TABLE EMP01
AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE 1=0;

CREATE TABLE EMP_MANAGER
AS
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE 1=0;

--EMP01���̺� EMPLOYEES ���̺��� �μ��ڵ尡 30�� ������ ���, �̸�, �ҼӺμ�,
--�Ի����� ����
--EMP_MANAGER���̺� EMPLOYEES ���̺��� �μ��ڵ尡 30�� ������ ���, �̸�, 
--������ ����� ��ȸ�Ͽ� �����ϰ��� �Ѵ�

INSERT ALL

INTO EMP01
VALUES(EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE)

INTO EMP_MANAGER
VALUES(EMPLOYEE_ID, FIRST_NAME, MANAGER_ID)

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE, MANAGER_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

SELECT*FROM EMP01;

SELECT*FROM EMP_MANAGER;

--EMPLOYEES ���̺��� ������ �����Ͽ� ���, �̸�, �Ի���, �޿��� �����Ҽ� �ִ� ���̺�
--EMP_OLD�� EMP_NEW �����ϰ��� �Ѵ�

CREATE TABLE EMP_OLD
AS
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE 1=0;

CREATE TABLE EMP_NEW 
AS 
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE 1=0;

--EMPLOYEES ���̺��� �Ի��� �������� 2006�� 1�� 1�� ������ �Ի��� ����� ���, �̸�,
--�Ի��� , �޿��� ��ȸ�ؼ� EMP_OLD ���̺� �����ϰ� �� �Ŀ� �Ի��� ����� ������ EMP_NEW 
-- EMP_NEW ���̺� �����ϰ��� �Ѵ�

INSERT ALL
WHEN HIRE_DATE < '2006,01/01' THEN
INTO EMP_OLD
VALUES (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY)
WHEN HIRE_DATE > = '2006/01/01' THEN
INTO EMP_NEW
VALUES(EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY)

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES;

SELECT*FROM EMP_OLD;

SELECT*FROM EMP_NEW;

--���̺��� ������ �����ϱ� ���� UPDATE ��

--UPDATE ���� ������ ���� �����ϴ� ���̴�. ���� � ���� �����͸� �����ϴ���
--WHERE���� �̿��Ͽ� ������ �����ؾ� �Ѵ� WHERE ����������� ���� ��쿡��
--���̺� �ִ� ��� ���� �����ȴ�
--���̺��� ��ü ���� �����Ϸ��� �ߴ� ���� �ƴ϶�� ū������ �߻��ϹǷ� WHERE ����
--��� ������ �����ϰ� �Ǵ��ؾ� �Ѵ�

--���̺��� ��� �� ����: WHERE ���� �߰����� ������ ���̺��� ��� ���� ����ȴ�

CREATE TABLE EMP
AS
SELECT*FROM EMPLOYEES;

SELECT*FROM EMP;

--��� ����� �μ� ��ȣ�� 30������ ��������

UPDATE EMP
SET DEPARTMENT_ID = 30;


SELECT*FROM EMP;

--��� ����� �޿��� 10%�λ��Ѵ�

UPDATE EMP
SET SALARY = SALARY*1.1;

--�Ի����� ���÷� �����Ѵ�

UPDATE EMP 
SET HIRE_DATE = SYSDATE;

SELECT*FROM EMP01;

--���̺��� Ư�� �ุ ����
--UPDATE���� WHERE���� �߰��ϸ� ������ �����ϴ� ���̺��� Ư�� �ุ �����Ҽ� �ִ�

--���Ӱ� ��� ���̺��� �����Ѵ�

DROP TABLE  EMP;
CREATE TABLE EMP
AS
SELECT*FROM EMPLOYEES;

--�μ���ȣ�� 10���� ����� �μ���ȣ�� 30������ ����
UPDATE EMP
SET DEPARTMENT_ID=30
WHERE DEPARTMENT_ID=10;

--�޿��� 3000�̻��� ����� �޿��� 10% �λ�
UPDATE EMP
SET SALARY = SALARY*1.1
WHERE SALARY >= 3000;

--2007�� �Ի��� ����� �Ի����� ���÷� �����Ѵ�
UPDATE EMP
SET HIRE_DATE = SYSDATE
WHERE SUBSTR(HIRE_DATE, 1,2)='07';

UPDATE EMP
SET HIRE_DATE = SYSDATE
WHERE HIRE_DATE BETWEEN'07/01/01' AND '07/12/31';

--���̺��� 2�� �̻��� Į�� �� ����
-- ���̺� 2�� �̻��� Į�� ���� �����ϱ� ���� ���ο� ���̺� ����

DROP TABLE EMP;
CREATE TABLE EMP
AS
SELECT*FROM EMPLOYEES;

SELECT*FROM EMP WHERE FIRST_NAME='Susan';

--Susan�� �μ���ȣ�� 20������, ������ FI_MGR

UPDATE EMP
SET DEPARTMENT_ID=20, JOB_ID='FI_MGR'
WHERE FIRST_NAME ='Susan';

SELECT*FROM EMP WHERE FIRST_NAME ='Susan';

SELECT*FROM EMP WHERE LAST_NAME='Russell';

--LAST_NAME �� Russell�� ����� �޿��� 17000��, Ŀ�̼� ������ 0.45�� �λ�ȴ�

UPDATE EMP
SET SALARY =17000,COMMISSION_PCT=0.45
WHERE LAST_NAME='Russell';

--���̺� ���ʿ��� ��(���ڵ�)�� �����ϱ� ���� DELETE��
--���̺� Ư�� �ο�(��)�� �����͸� �����Ѵ�
SELECT*FROM DEPT;
--�μ� ���̺��� �����͸� ��� �����Ѵ�

--30�� �μ��� ����
DELETE FROM DEPT WHERE DEPTNO=30;

--DELETE �� TRUNCATE �� ������
--DELETE ��ɾ�
--DELETE ��ɾ ����Ͽ� TABLE �� ���� ������ ��쿡 ���� ������ ���� ���� �ɶ�����
--���� �ڿ��� �Ҹ�ȴ� �ֳ��ϸ� DELETE ��ɾ�� ���� ���� ���·� ���� ������ ��츦 
--������ ROLLBACK ������ �����ϰ� �־�� �ϱ� �����̴�

--TRUNCATE ��ɾ�
--TRUNCATE ��ɾ�
--ROLLBACK�� ������ ����

--MERGE�� 
--������ ���� �ΰ��� ���̺��� �ϳ��� ���̺�� ��ġ�� ��� ����
-- �� ���̺��� �����ϴ� ������ ���� �����ϸ� UPDATE�ǰ� �����ǰ��� ������ INSERT�Ѵ�

--MERGE���� ������ ���ؼ� ���̺� �ش� ���ǿ� �´� �����Ͱ� ������ INSERT��,
--������ UPDATE�� �����ϴ� �����̴�

CREATE TABLE TB_ADD_CUSTOMER (
CUSTOMER_CD CHAR(7) NOT NULL, --���ڵ�
CUSTOMER_NM VARCHAR2(10) NOT NULL,
MW_FLG CHAR(1) NOT NULL,
BIRTH_DAY CHAR(8) NOT NULL,
PHONE_NUMBER VARCHAR2(16),
CONSTRAINT TB_ADD_CUSTROMER_CUSTOMER_CD_PK PRIMARY KEY(CUSTOMER_CD)
);

INSERT INTO TB_ADD_CUSTOMER(customer_cd, customer_nm, mw_flg, birth_day, phone_number)
VALUES ('2017108','�ڽ´�','M','19711230','010-2580-9919');
INSERT INTO TB_ADD_CUSTOMER(customer_cd, customer_nm, mw_flg, birth_day, phone_number)
VALUES ('2019302','���̷�','W','19740812','010-8864-0232');

SELECT*FROM TB_ADD_CUSTOMER;

MERGE INTO TB_CUSTOMER CU
USING TB_ADD_CUTOMER NC
ON (CU.CUSTOMER_CD=NC.CUSTOMER_CD)
WHEN MATCHED THEN
UPDATE SET CU.CUSTOMER_NM=NC.CUSTOMER_NM,
CU.MW_FLG=NC.MW_FLG,
CU.BIRTH_DAY=NC.BIRTH_DAY,
CU.PHONE_NUMBER=NC.PHONE_NUMBER
WHEN NOT MATCHED THEN
INSERT(CU.CUSTOMER_CD, CU.CUSTOMER_NM, CU.MW_FLG,CU.BIRTH_DAY,
CU.PHONE_NUMBER,CU.EMAIL, CU.TOTAL_POINT, CU.REG_DTTM)
VALUES(NC.CUSTOMER_CD,NC.CUSTOMER_NM,NC.MW_FLG,NC.BIRTH_DAY,
NC.PHONE_NUMBER,'',0,TO_CHAR(SYSDATE,'YYYYMMDDHHMISS'));

SELECT*FROM TB_CUSTOMER;
