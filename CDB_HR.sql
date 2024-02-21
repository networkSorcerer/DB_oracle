--�޿��� �Է¹޾� �� �޿����� ���� �޴� ����� �����ȣ, �̸�, �޿��� �ܺη� �����ϴ� ���ν����� 
--������ �ּ���

CREATE OR REPLACE PROCEDURE EMP_SAL_DATA
(VSALARY IN EMPLOYEES.SALARY%TYPE, VEMPLOYEES OUT SYS_REFCURSOR)
IS 
BEGIN
OPEN VEMPLOYEES FOR SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES WHERE SALARY > VSALARY;
END;
/
SHOW ERROR;

DECLARE
PEMPLOYEES SYS_REFCURSOR;
VEMPLOYEES EMPLOYEES%ROWTYPE;
BEGIN
EMP_SAL_DATA(12000, PEMPLOYEES);
LOOP
FETCH PEMPLOYEES INTO VEMPLOYEES.EMPLOYEE_ID, VEMPLOYEES.FIRST_NAME, VEMPLOYEES.SALARY;
EXIT WHEN PEMPLOYEES%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(VEMPLOYEES.EMPLOYEE_ID ||'.'||VEMPLOYEES.FIRST_NAME||''||
VEMPLOYEES.SALARY);
END LOOP;
END;
/
--�� �μ����� ���� �޿��� ���� �޴� ����� �����ȣ, �̸�, �μ���ȣ, �޿�, �Ի����� �ܺη� �����ϴ�
--���ν����� ������ �ּ���(���ν����� :  DEPT_SAL_DATA)

CREATE OR REPLACE PROCEDURE DEPT_SAL_DATA (v_results OUT SYS_REFCURSOR)
IS 
BEGIN
    OPEN v_results FOR
    SELECT e.employee_id,
           e.first_name,
           e.department_id,
           e.salary,
           e.hire_date
    FROM employees e
    JOIN (
        SELECT department_id, MAX(salary) AS max_salary
        FROM employees
        GROUP BY department_id
    ) max_sal ON e.department_id = max_sal.department_id 
              AND e.salary = max_sal.max_salary;
END;
/
DROP PROCEDURE DEPT_SAL_DATA;


CREATE OR REPLACE PROCEDURE DEPT_SAL_DATA 
IS
    CURSOR c_dept_sal_data IS
        SELECT e.employee_id,
               e.first_name,
               e.department_id,
               e.salary,
               e.hire_date
        FROM employees e
        JOIN (
            SELECT department_id, MAX(salary) AS max_salary
            FROM employees
            GROUP BY department_id
        ) max_sal ON e.department_id = max_sal.department_id 
                  AND e.salary = max_sal.max_salary;
    v_employee_id employees.employee_id%TYPE;
    v_first_name employees.first_name%TYPE;
    v_department_id employees.department_id%TYPE;
    v_salary employees.salary%TYPE;
    v_hire_date employees.hire_date%TYPE;
BEGIN
    OPEN c_dept_sal_data;
    LOOP
        FETCH c_dept_sal_data INTO v_employee_id, v_first_name, v_department_id, v_salary, v_hire_date;
        EXIT WHEN c_dept_sal_data%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ', First Name: ' || v_first_name || ', Department ID: ' || v_department_id || ', Salary: ' || v_salary || ', Hire Date: ' || v_hire_date);
    END LOOP;
    CLOSE c_dept_sal_data;
END;
/

--IN OUT MODE �Ű�����
--�Ű������� ���� ������� �Է� �޾� �ٽ� �ش� �Ű����������� ������ DATA�� �޴� �����̴�
--IN�� OUT�� ����� ��� �����Ѵ� �� ����ȯ�濡�� ���ν����� ���� �����ϰ� ���ν������� ����ȯ������
--����� ������ �����Ҽ��ִ�

--2) Ʈ���� 
--���� ���α׷� ������ �ϳ��� TRIGGER�� ���̺� ��, ��Ű�� �Ǵ� ������ ���̽��� ���õ� 
--PL/SQL ��� (�Ǵ� ���ν���)���� ���õ� Ư�� ��� (EVENT) �� �߻� �ɶ����� ������ (�ڵ�)���� 
--�ش� PL/SQL����� ����ȴ� TRIGGER�� ������ ���̽� ���� ������Ʈ�μ� ����Ǿ� 
--�����ǰ�, TRIGGER ��ü�� ����ڰ� �����ؼ� ������ �Ҽ�������, ���� TRIGGER ������ ������ 
--Ư�� ��ǿ� ���ؼ��� �������� �ڵ������� �̷������ TRIGGER�� �̷�� TRIGGER��ü�� TCL���
--��, COMMIT, ROLLBACK, SAVEPONT ����� ���� �ɼ�����

--Ʈ������ �������� �ǹ̴� ��Ƽ質 (��Ƽ踦) ��� �߻��ϴ� (�����) ���߽�Ű�ٶ�� �ǹ̰� �ִ�
--PL/SQL������ Ʈ���� ���� ��Ƽ谡 ������� �ڵ����� �Ѿ��� �߻�ǵ��� ��� �̺�Ʈ�� �߻��ϸ�
--�׿����� �ٸ� �۾��� �ڵ����� ó�� �Ǵ� ���� �ǹ��Ѵ�

--Ʈ���Ŷ� Ư�� ���̺��� ������ ������ �������� �� �ڵ����� ����Ǵ� ���� ���ν������ �Ҽ��ִ�
--�ռ� ��� ���� ���ν����� �ʿ��� ������ �����ڰ� ���� EXECTE��ɾ ȣ���ؾ��ߴ�
--������ Ʈ���Ŵ� �̿� �޸� ���̺��� �����Ͱ� INSERT, UPDATE, DELETE���� ���� ����ɶ� �ڵ����� 
--����ǹǷ� �� ����� �̿��ϸ� �������� �۾��� �Ҽ��ִ�. �̷� ������ Ʈ���Ÿ� ����ڰ� ���� 
--�����ų���� ����

SELECT EMPLOYEE_ID
, FIRST_NAME
, JOB_ID
, SALARY
, DEPARTMENT_ID
, ROW_NUMBER() OVER (PARTITION BY DEPARTMENT_ID ORDER BY EMPLOYEE_ID) AS RNUM
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM (SELECT ROW_NUMBER() OVER(PARTITION BY DEPARTMENT_ID ORDER BY EMPLOYEE_ID) AS RNUM,
EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES) DATA
WHERE DATA.RNUM = 1;

SELECT E.FIRST_NAME, D.DEPARTMENT_NAME, E.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- ��� ���̺� �ο찡 �߰��Ǹ� �ڵ� ������ Ʈ���Ÿ� �����Ѵ�
DROP TABLE EMP03;

CREATE TABLE EMP03(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(20),
JOB VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER EMP_TRG01
AFTER INSERT
ON EMP03
BEGIN
DBMS_OUTPUT.PUT_LINE('���Ի���� �Ի��߽��ϴ�');
END;
/


INSERT INTO EMP03(EMPNO, ENAME, JOB)
VALUES(1, 'ȫ�浿','�濵������(��ȹ/����)');


--��� ���̺� ���ο� ������ �� ���� ����� ������ �޿� ���̺� ���ο� �����͸� 
--�ڵ����� �����ϰ� ���� ���, ��� ���̺� Ʈ���Ÿ� �����Ͽ� �����Ҽ� �ִ�
CREATE TABLE SAL03(
SALNO NUMBER(4),
SAL NUMBER,
EMPNO NUMBER(4),
CONSTRAINT SAL03_PK PRIMARY KEY(SALNO),
CONSTRAINT SAL03_FK FOREIGN KEY(EMPNO) REFERENCES EMP03(EMPNO)
);

CREATE SEQUENCE SAL03_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;

CREATE OR REPLACE TRIGGER EMP_TRG02
AFTER INSERT
ON EMP03
FOR EACH ROW
BEGIN
INSERT INTO SAL03(SALNO, SAL, EMPNO)
VALUES(SAL03_SEQ.NEXTVAL, 2000000, : NEW.EMPNO);
END;
/

DELETE FROM EMP03 WHERE EMPNO = 1;
INSERT INTO EMP03(EMPNO, ENAME, JOB)VALUES(1, '��ö��', '�濵������(����/����)');

SELECT * FROM EMP03;

SELECT * FROM SAL03;

INSERT INTO EMP03(EMPNO, ENAME, JOB)VALUES(2,'�̿���','�濵������(�λ�)');

CREATE OR REPLACE TRIGGER EMP_TRG03
AFTER DELETE ON EMP03
FOR EACH ROW
BEGIN
DELETE FROM SAL03 WHERE EMPNO =: OLD.EMPNO;
END;
/

DELETE FROM EMP03 WHERE EMPNO=2;

CREATE TABLE PRODUCT(
PCODE CHAR(6),
PNAME VARCHAR2(12) NOT NULL,
PCOMPANY VARCHAR2(12),
PPRICE NUMBER(8),
STOCK NUMBER DEFAULT 0,
CONSTRAINT PRODUCT_PK PRIMARY KEY(PCODE)
);

DROP TABLE PRODUCT;

CREATE TABLE RECEIVING(
RNO NUMBER(6),
PCODE CHAR(6),
RDATE DATE DEFAULT SYSDATE,
RQTY NUMBER(6),
RPRICE NUMBER(8),
RAMOUNT NUMBER(8),
CONSTRAINT RECEIVING_PK PRIMARY KEY(RNO),
CONSTRAINT RECEIVING_FK FOREIGN KEY(PCODE) REFERENCES PRODUCT(PCODE)
);

INSERT INTO PRODUCT(PCODE, PNAME, PCOMPANY, PPRICE)
VALUES('A00001','��Ź��','LG',1500000);
INSERT INTO PRODUCT(PCODE, PNAME, PCOMPANY, PPRICE)
VALUES('A00002','��ǻ��','LG',1000000);
INSERT INTO PRODUCT(PCODE, PNAME, PCOMPANY, PPRICE)
VALUES('A00003','�����','�Ｚ',4500000);

DROP TABLE RECEIVING;

CREATE OR REPLACE TRIGGER TRG_IN
AFTER INSERT ON RECEIVING
FOR EACH ROW
BEGIN
UPDATE PRODUCT
SET STOCK = STOCK + :NEW.RQTY 
WHERE PCODE = :NEW.PCODE;
END;
/

--Ʈ���Ÿ� �����Ų �� �԰� ���̺� ���� �߰��Ѵ�. �԰� ���̺��� ���� ��ǰ ���̺���
--��� ������ ������� Ȯ���� �� �ִ�
INSERT INTO RECEIVING(RNO, PCODE, RQTY, RPRICE, RAMOUNT)
VALUES(1, 'A00001', 5,850000,950000);

SELECT * FROM RECEIVING;

SELECT * FROM PRODUCT;

--6. �԰� ���̺� ��ǰ�� �ԷµǸ� �ڵ����� ��ǰ ���̺��� ��� ������ �����ϰ� �ȴ�. 
-- �԰� ���̺� �� �ٸ� ��ǰ�� �Է��Ѵ�
INSERT INTO RECEIVING(RNO, PCODE, RQTY, RPRICE, RAMOUNT)
VALUES(2, 'A00002', 10,680000,780000);

INSERT INTO RECEIVING(RNO, PCODE, RQTY, RPRICE, RAMOUNT)
VALUES(3, 'A00003', 10,250000,300000);


--�ǽ��ϱ� ���� Ʈ���� �ۼ��ϱ� 
--�̹� �԰�� ��ǰ�� ���ؼ� �԰� ������ ����Ǹ� ��ǰ ���̺��� ������ ���� ����Ǿ�� �Ѵ�
--�̸� ���� ���� Ʈ���� �ۼ��غ���
--1. ���� Ʈ���� ����

CREATE OR REPLACE TRIGGER TRG_UP
AFTER UPDATE ON RECEIVING
FOR EACH ROW
BEGIN
UPDATE PRODUCT
SET STOCK = STOCK + (-:OLD.RQTY+:NEW.RQTY)
WHERE PCODE =:NEW.PCODE;
END;
/

--�԰� ��ȣ 3���� ����� �԰�� ������ ����� �����μ� �԰� ��ȣ 3���� �԰������ 8�� �����Ͽ�����
--������� ��� ���� ���� 8�� ����Ǿ���
UPDATE RECEIVING SET RQTY=8, RAMOUNT=280000--�԰������ �԰�ݾ�
WHERE RNO=3;

SELECT * FROM RECEIVING;

SELECT * FROM PRODUCT;

--�ǽ��ϱ� ���� Ʈ���� �ۼ��ϱ�
--�԰� ���̺��� �԰� �Ǿ��� ��Ȳ�� �����Ǹ� ��ǰ ���̺� ���������� ������ �԰� ������ŭ�� 
--���� ���� Ʈ���� �ۼ��� ����
--1. ���� Ʈ���� ����

CREATE OR REPLACE TRIGGER TRG_DEL
AFTER DELETE ON RECEIVING
FOR EACH ROW
BEGIN
UPDATE PRODUCT
SET STOCK = STOCK-:OLD.RQTY
WHERE PCODE =:OLD.PCODE;
END;
/

DELETE RECEIVING WHERE RNO = 3;

SELECT * FROM RECEIVING;

SELECT * FROM PRODUCT;











--FUNCTION�̶�?
--���� ��ȯ�ϴ� ���� PL/SQL BLOCK���� ����  �����Լ��� ���� SQLǥ������ �Ϻη� ����Ͽ�
--SQL���� ������ ���·� ����Ҽ� �ִ�. ���� ��ȯ�ϴ� RETURN�� �ݵ�� ���ԵǸ� �ݵ�� ���� ���� 
--��ȯ�Ѵ� �׷��� ���� �Լ��� ���ν����¹����̳� Ư¡�� ���� ��������� 
--�������� ���ν����� ������ �۾��� ������ �� ����� ��ȯ �Ҽ��� �ְ�(OUT,IN OUT ��� ����)
--��ȯ���� �ʰ� �׳� ���� �Ҽ��������� �Լ��� ������ �۾��� �������� ����� �����ش� (RETURN)
--�ϴ� �κ��̴� �̶� RETURN�� ������ Ÿ���� ���� CHAR, DATE, NUMBER���� �Ѵ�

--�μ� ��ȣ�� �Ű� ������ �μ��� �̸��� ��ȯ�ϴ� �Լ��� �����Ͽ� ���ô� (ù��° ���)
CREATE OR REPLACE FUNCTION GETDNAME(VDEPARTMENT_ID IN DEPARTMENTS.DEPARTMENT_ID%TYPE)
RETURN VARCHAR2
IS
VDEPARTMENT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
VCOUNT NUMBER :=0;
BEGIN
SELECT COUNT(*) INTO VCOUNT FROM DEPARTMENTS
WHERE DEPARTMENT_ID=VDEPARTMENT_ID;

IF VCOUNT = 0 THEN
VDEPARTMENT_NAME :='�ش�μ�����';
ELSE
SELECT DEPARTMENT_NAME INTO VDEPARTMENT_NAME FROM DEPARTMENTS
WHERE DEPARTMENT_ID = VDEPARTMENT_ID;
END IF;
RETURN VDEPARTMENT_NAME;
END;
/

SELECT FIRST_NAME , JOB_ID, NVL(COMMISSION_PCT,0) COMMISSION_PCT, SALARY,
GETDNAME(DEPARTMENT_ID)DNAME
FROM EMPLOYEES
WHERE FIRST_NAME='Lisa';

SELECT GETDNAME(500) FROM DUAL;

--�μ� ��ȣ�� �Ű� ������ �μ��� �̸��� ��ȯ�ϴ� �Լ��� �����Ͽ� ���ô�

CREATE OR REPLACE FUNCTION GETDNAME(VDEPARTMENT_ID IN DEPARTMENTS.DEPARTMENT_ID%TYPE)
RETURN VARCHAR2
IS
VDEPARTMENT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
BEGIN
SELECT DEPARTMENT_NAME INTO VDEPARTMENT_NAME FROM DEPARTMENTS
WHERE DEPARTMENT_ID = VDEPARTMENT_ID;
RETURN VDEPARTMENT_NAME;

EXCEPTION
WHEN NO_DATA_FOUND THEN
VDEPARTMENT_NAME :='�ش� �μ� ����';
RETURN VDEPARTMENT_NAME;
END;
/

SELECT EMPLOYEE_ID, FIRST_NAME, TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')HIREDATE,
GETDNAME(DEPARTMENT_ID)DEPARTMENT_NAME
FROM EMPLOYEES;

SELECT GETDNAME(400) FROM DUAL;

CREATE OR REPLACE FUNCTION GETSUMDEPT(VDEPARTMENT_ID IN DEPARTMENTS.DEPARTMENT_ID%TYPE)
RETURN VARCHAR2
IS
VSUMSALARY VARCHAR2(50);
BEGIN
SELECT NVL(TO_CHAR (ROUND(SUM(SALARY)),'999999'), '�ش� �μ� ����') INTO VSUMSALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = VDEPARTMENT_ID;
RETURN VSUMSALARY;
END;
/

SELECT FIRST_NAME, SALARY, DEPARTMENT_ID , GETDNAME(DEPARTMENT_ID) DEPARTMENT_NAME,
GETSUMDEPT(DEPARTMENT_ID) SUMSALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 100;

--PL/SQL ����

DECLARE
VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
SELECT FIRST_NAME INTO VFIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE'0%';
DBMS_OUTPUT.PUT_LINE('�������' || VFIRST_NAME||'�Դϴ�');
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('�ش����� �������� �ʽ��ϴ�');
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('���� �ܾ ������ ����� �θ� �̻� �����մϴ�');
END;
/

DROP TABLE EMP04;
CREAT TABLE EMP04
AS
SELECT EMPLOYEE_ID, FIRST_NAME EMPLOYEES;

CREATE TABLE EMP01 AS
SELECT *FROM EMPLOYEES;

DROP TABLE EMP02;

CREATE OR REPLACE VIEW VIEW_EMP02
AS
SELECT EMPLOYEE_ID �����ȣ, FIRST_NAME �����, SALARY �޿� , DEPARTMENT_ID �μ���ȣ
FROM EMP01;

CREATE OR REPLACE VIEW VIEW_EMP02(�����ȣ, �����, �޿�, �μ���ȣ)
AS
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,DEPARTMENT_ID
FROM EMP01;
DESC VIEW_EMP02;

--RAISE �� ����Ͽ� ���� ó���ϱ�
--������ �����ϱ� ���ؼ��� EMP04���̺��� �����ϰ� (�����Ѵٸ� ) �ٽ� �����Ѵ�

DROP TABLE EMP04;
CREATE TABLE EMP04
AS
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME FROM EMP04 ORDER BY EMPLOYEE_ID;

CREATE OR REPLACE PROCEDURE NOEMPNO_EXCEPTION
(VEMPLOYEE_ID EMP04.EMPLOYEE_ID%TYPE)
IS
EXEMPID EXCEPTION;
BEGIN
DELETE FROM EMP04 WHERE EMPLOYEE_ID = VEMPLOYEE_ID;
IF SQL%NOTFOUND THEN RAISE EXEMPID;
ELSE
DBMS_OUTPUT.PUT_LINE(CONCAT(VEMPLOYEE_ID,'����� �����Ǿ����ϴ�'));
END IF;
EXCEPTION
WHEN EXEMPID THEN
DBMS_OUTPUT.PUT_LINE('�Է��Ͻ� ��ȣ�� ���� �����ȣ�Դϴ�');
END;
/

EXEC NOEMPNO_EXCEPTION(800);
EXEC NOEMPNO_EXCEPTION(100);

--��Ű�� 
--���� �ִ� ���ν����� ���� ȿ�������� �����ϱ� ���ؼ� ��Ű�� ������ ������ �� �����ϰ� ���ȴ�
--��Ű���� �������� ���� �Լ��� ���ν����� �ϳ��� �׷����� ����δ� ����
--��Ű�� ����ο� ��Ű�� ��ü�η� ����
--��Ű�� ������� ������ �ش� ��Ű���� ���� �Լ��� ���ν���, ����� ���� ���Ǹ� ������ �κ� 
--��Ű�� ��ü�ο����� ����ο��� ����� �Լ��� ���ν������� ���� �����Ǵ� �κ���

CREATE OR REPLACE PACKAGE EMPPACK
IS
PROCEDURE EMPPROC;
PROCEDURE EMPPROC02( V


CREATE OR REPLACE PROCEDURE EMPPROC
IS 
VWORD VARCHAR2(1);
VEMPLOYEES EMPLOYEES%ROWTYPE;
CURSOR C1 (VWORD VARCHAR2)
IS
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES WHERE FIRST_NAME LIKE '%'||VWORD||'%';
BEGIN
VWORD := DBMS_RANDOM.STRING('U',1);
DBMS_OUTPUT.PUT_LINE('������ ���� : '||VWORD);
OPEN C1(VWORD);
DBMS_OUTPUT.PUT_LINE('������ ���� : '|| VWORD);
DBMS_OUTPUT.PUT_LINE('---------------------');
LOOP
FETCH C1 INTO VEMPLOYEES.EMPLOYEE_ID,VEMPLOYEES.FIRST_NAME,VEMPLOYEES.SALARY;
IF C1%ROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('�ش� ����� �������� �ʽ��ϴ�');
END IF;
EXIT WHEN C1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(VEMPLOYEES.EMPLOYEE_ID||'/'||VEMPLOYEES.FIRST_NAME||'/'||
VEMPLOYEES.SALARY);
END LOOP;
END;
/


CREATE OR REPLACE PROCEDURE EMPPROC02(VDEPARTMENT_ID IN EMPLOYEES.DEPARTMENT_ID%TYPE)
IS 
CURSOR C1
IS 
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = VDEPARTMENT_ID;
BEGIN
DBMS_OUTPUT.PUT_LINE('�����ȣ/�����/�޿�');
DBMS_OUTPUT.PUT_LINE('-----------------');
FOR VEMPLOYEES IN C1 LOOP
DBMS_OUTPUT.PUT_LINE(VEMPLOYEES.EMPLOYEE_ID||'/'||VEMPLOYEES.FIRST_NAME||'/'||
VEMPLOYEES.SALARY);
END LOOP;
END;
/
