
--PL/SQL
--SQL���忡�� ��������, ����ó��, �ݺ�ó�� ���� �����Ѵ�
--DECLARE
--�����(DECLARE SECTION)
--������ ��� ����
--BEGIN
--�����(EXECUTABLE SECTION)
--SQL ��
--���, �ݺ���
--Ŀ��
--EXCEPTION
--���� ó����(EXCEPTION SECTION)
--END;
--/

--���α׷��� ���ȭ
--Ư�� ���α׷��� PROCEDURE, FUNCTION, PACKAGE���� ���α׷����� ����� ���� �������α׷�
--�� �� �ÿ� �������� �̿� �� ���� �� �� �ִ�
--������ ����
--��Ʈ��ũ ����� ����
--PL/SQL���� ����ϰ� �Ǹ� ��� SQL�� �� ���� ���α׷��� ���ν��������� �ۼ��ϸ� Ŭ���̾��
--��Ʈ��ũ ������ ���� SQL�� �� ���α׷��� ������ ���� �ƴ϶� ���ν������� �����ϴ�
--������ ������ ���̽��� ������ �־� ��Ʈ��ũ ������� �����ϰ� ���� �� �ִ�

--PL/SQL ��ϳ������� �� ������ �����Ҷ����� �����ݷ��� ����ϳ�
--END�ڿ� ;�� ����Ͽ� �ϳ��� ����� �����ٴ� ���� ����Ѵ�
--DELCLARE�� BEGIN�̶�� Ű����� PL/SQL ����� �����ϴ� ���� �˼��ִ�
--���� �� �ּ��� - �̰� ������ �ּ�/**/�̴�
--PL/SQL ����� �࿡ /�������� ����ȴ�

--��� ������ ���� ��ȣ�� �����ݷ����� ����ؾ��Ѵ� ���Կ����ڷδ� :=�� ����Ѵ�
--���� �����ڴ� ������ ����� �� ������ ���Կ� �̿�ȴ�
--SELECT���� ���� ����ȴ� DATA�� INTO���� ������ �����ؼ� ó���Ѵ�

BEGIN
DBMS_OUTPUT.PUT_LINE('HELLO WORLD!');
END;
/

--IDENTIFIER �����̸�
--CONSTANT ������ ���� �����Ҽ� ������ �����Ѵ�
--DATATYPE �ڷ��� (������ Ÿ��)�� ����Ѵ�
--�ڷ���(������ Ÿ��)�� ����Ѵ�
--���� ������ Ÿ�� : SQLŸ�԰� PL/SQLŸ��
--PL/SQL������ Ÿ�� : BOOLEAN, BINARY_INTRGER
--NOT NULL ���� �ݵ�� �����ϵ��� �ϱ� ���� ������ �����Ѵ�
--EXPRESSION LITERAL �ٸ� ����, �����ڳ� �Լ��� �����ϴ� ǥ����

--VEMPNO NUMBER(4);
--PL/SQL���� ������ �����Ҷ� ���Ǵ� �ڷ����� SQL���� ����ϴ� �ڷ����� ���� �����ϴ�
--���ڸ� �����Ϸ���  NUMBER�� ����ϰ� ���ڸ� �����Ϸ��� VARCHAR2�� ����ؼ� �����Ѵ�
--����� ������ ���� ����ȴ�. �����ʹ� �޸� �ѹ� ���� �Ҵ��ϸ� ������ �ʴ´�

--����� CONSTANT ������ Ÿ�� :=�����;

--������ �� ����
--������ ���� �����ϰų� �������ϱ� ���� PL/SQL�� ���� ���ڸ�����Ѵ�
--����(����)������(:=)�� ������ �����ϴ� ������ ���� ���� �����Ѵٴ��ǹ��̴�
--IDENTIFIER := EXPRESSION;
DECLARE
VAL_NUM NUMBER; --����
BEGIN
VAL_NUM := 100;
DBMS_OUTPUT.PUT_LINE(VAL_NUM);
END;
/

DECLARE
NUM NUMBER :=24*60*60;--����
BEGIN
DBMS_OUTPUT.PUT_LINE('NUM='||TO_CHAR(NUM));
END;
/

DECLARE
VEMPLOYEE_ID NUMBER(6);--����
VFIRST_NAME VARCHAR2(20) --����
BEGIN
VEMPLOYEE_ID :=105;
VFIRST_NAME:='David';

DBMS_OUTPUT.PUT_LINE('��� / �̸�');
DBMS_OUTPUT.PUT_LINE('------------');
DBMS_OUTPUT.PUT_LINE(VEMPLOYEE_ID||'/'||VFIRST_NAME);
END;
/

--��Į�� ����/���۷��� ����
--PL/SQL���� ������ �����ϱ� ���� ����Ҽ� �ִ� ���������� ũ�� ��Į��� ���۷����� ������

--��Į��
--SQL������ �ڷ��� ������ ���� �����ϴ�

--VEMPLOYEE_ID NUMBER(6);
--VFIRST_NAME VARCHAR2(20);

--���۷��� : %TYPE �Ӽ��� %ROWTYPE�Ӽ� ����Ѵ�
--������ ����� �ٸ� ���� �Ǵ� ������ ���̽��� Į���� ���߾� ������ �����ϱ� ���� 
--%TYPE�Ӽ��� ����Ѵ�

--VEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID5TYPE;
--VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;

--%TYPE �Ӽ��� ����Ͽ� ������ VEMPLOYEE_ID������ EMPLOYEES ���̺��� EMPLOYEE_IDĮ���� 
--�ڷ����� ũ�⸦ �״�� �����ؼ� �����Ѵ�
--%ROWTYPE�� �ο� ������ �����Ѵ�
--VEMPLOYEES EMPLOYEES%ROWTYPE;

--%ROWTYPE�� ���� ������ Ư�� ���̺��� Į�� ������ ������ ������ �𸣴��� �����Ҽ��ִ�
--SELECT �������� �ο츦 �˻��� �� �����ϴ�

--PL/SQL���� SQL����
--PL/SQL�� SELECT���� INTO���� �ʿ��ѵ�, INTO������ �����͸� ������ ������ ����Ѵ�
--SELECT�����ִ� Į���� INTO���� �ִ� ������ 1��1������ �ϱ⿡ ������ �������� ��,
--���̰� ��ġ�Ͽ����Ѵ�

--SELECT_LIST ���� ����̸� �� �Լ�, �׷� �Լ�, ǥ������ ����Ҽ� �ִ�
--VARIABLE_NAME �о���� ���� �����ϱ� ���� ��Į�� ����

--RECORD_NAME �о���� ���� �����ϱ� ���� PL/SQL RECORD ����
--CONDITION PL/SQL������ ����� �����Ͽ� ����, ǥ����, ���, �� �����ڷ� �����Ǹ� ����
--�ϳ��� ���� RETURN�Ҽ��ִ� �����̾�� �Ѵ�

--��ȸ�� Į���� ����� ������ ���Խ� INTO���� ����ϸ� �ȴ�
--SELECT EMPLOYEE_ID, FIRST_NAME INTO VEMPLOYEE_ID, VFIRST_NAME FROM EMPLOYEES
--WHERE FIRST_NAME = 'David';

--VEMPLOYEE_ID, VFIRST_NAME ������ Į��(EMPLOYEE_ID, FIRST_NAME)�� ������ ������ ����
--������ �ϱ� ���ؼ� %TYPE�Ӽ��� ����Ѵ�. INTO���� ������ SELECT���� ����� Į���� 
--������ ���Ӹ� �ƴ϶� Į���Ǽ��͵� ��ġ�ؾ� �Ѵ�

DECLARE 
--%TYPE �Ӽ����� Į�� ������ �����͸� �����Ҽ��ִ� ���۷��� ��������
VEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN 
DBMS_OUTPUT.PUT_LINE('��� /�̸�');
DBMS_OUTPUT.PUT_LINE('---------');
--SELECT ���� ������ ��� ���� INTO �ڿ� ����� ������ ����ȴ�
SELECT EMPLOYEE_ID, FIRST_NAME INTO VEMPLOYEE_ID, VFIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME = 'Susan';

--���۷��� ������ ����� ���� ����Ѵ�
DBMS_OUTPUT.PUT_LINE(VEMPLOYEE_ID||'/'||VFIRST_NAME);
END;
/

--��ü ���ڵ带 �����ϱ� ���ؼ��� %ROWTYPE���� �����ϸ� �ȴ�

DECLARE
--���ڵ�� ���� ����
VEMPLOYEES EMPLOYEES%ROWTYPE;
BEGIN
--JONES ����� ������ ���ڵ� ������ ����
SELECT *
INTO VEMPLOYEES
FROM EMPLOYEES
WHERE FIRST_NAME = 'Lisa';

--���ڵ� ������ ����� ��������� ���
DBMS_OUTPUT.PUT_LINE('�����ȣ :' || TO_CHAR(VEMPLOYEES.EMPLOYEE_ID));
DBMS_OUTPUT.PUT_LINE('�̸�  :' || VEMPLOYEES.FIRST_NAME);
DBMS_OUTPUT.PUT_LINE('�޿� :'|| VEMPLOYEES.SALARY);
DBMS_OUTPUT.PUT_LINE('�Ի����� :'|| TO_CHAR(VEMPLOYEES.HIRE_DATE,'YYYY-MM-DD'));
END;
/

--EMPLOYEES ���̺� ��ϵ� �ѻ���� ���� �޿��� ��, �޿��� ����� ������ �����Ͽ� ����Ͽ� ����

DECLARE
V_TOTAL_EMPLOYEE NUMBER;
V_TOTAL_SALARY NUMBER;
V_AVG_SALARY NUMBER;

BEGIN

SELECT COUNT(*) INTO V_TOTAL_EMPLOYEE
FROM EMPLOYEES;

SELECT SUM(SALARY) INTO V_TOTAL_SALARY
FROM EMPLOYEES;

SELECT AVG(SALARY) INTO V_AVG_SALARY
FROM EMPLOYEES;

DBMS_OUTPUT.PUT_LINE('�� �����' || V_TOTAL_EMPLOYEE);
DBMS_OUTPUT.PUT_LINE('�� �޿�' || V_TOTAL_SALARY);
DBMS_OUTPUT.PUT_LINE('��� �޿�'||V_AVG_SALARY);
END;
/
--JACK ����� ����, �޿�, �Ի�����, �μ����� ������ �����Ͽ� ����Ͽ� ����
DECLARE
V_JOB_ID EMPLOYEES.JOB_ID%TYPE;
V_SALARY EMPLOYEES.SALARY%TYPE;
V_HIRE_DATE EMPLOYEES.HIRE_DATE%TYPE;
V_DEPARTMENT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;

BEGIN
SELECT JOB_ID, SALARY,HIRE_DATE  
INTO V_JOB_ID ,V_SALARY,V_HIRE_DATE
FROM EMPLOYEES
WHERE FIRST_NAME ='Jack';

SELECT D.DEPARTMENT_NAME INTO V_DEPARTMENT_NAME
FROM DEPARTMENTS D JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.FIRST_NAME ='Jack';

DBMS_OUTPUT.PUT_LINE(V_JOB_ID);
DBMS_OUTPUT.PUT_LINE(V_SALARY);
DBMS_OUTPUT.PUT_LINE(V_HIRE_DATE);
DBMS_OUTPUT.PUT_LINE(V_DEPARTMENT_NAME);
END;
/

CREATE TABLE EMP10
AS SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEES;
--������̺��� �����ȣ�� ���� ū ����� ã�Ƴ��� �̹�ȣ +3������ �Ʒ��� ����� 
--������̺� �ű� �Է��ϴ� PL/SQL�� ������ 
DECLARE 
V_MAX_EMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
V_NEW_EMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;

BEGIN
SELECT MAX(EMPLOYEE_ID) INTO V_MAX_EMPLOYEE_ID
FROM EMPLOYEES;

V_NEW_EMPLOYEE_ID := V_MAX_EMPLOYEE_ID+5;

DBMS_OUTPUT.PUT_LINE('����'|| V_NEW_EMPLOYEE_ID);
END;
/

--���
--PL/SQL�� �������� ������� �̿��Ͽ� ������� ���� �帧�� �����Ҽ� �ִ�
--���ǿ� ���� �б��ϴ� ���ù��� �ݺ��� ������ �ѹ� ����ϰ� ������ �����ϵ����ϴ�
--�ݺ����� �ִ�

--IF~THEN~END IF
--�޿��� ���ϴ� ������ �ۼ��Ѵ�



