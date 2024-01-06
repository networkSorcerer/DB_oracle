--�ϳ��� ���̺� ���ؼ� SQL ��ɾ ����Ͽ���. ������ ������ ������ ���̽�������
--���̺��� ���谡 �߿��ϱ� ������ �ϳ� �̻��� ���̺��� ����� ���յǾ� ���ȴ�.
--�� �� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���ؼ� ���Ǵ� ���� �����̴�
--�ٽ� ���� SQL������ �ΰ� �̻��� ���̺��� �����ؾ߸� ���ϴ� ����� ������ ���� �� 
--�ѹ��� ���Ƿ� ���ϴ� ����� ������ �ִ� ���� ����� �����Ѵ�
--EUQI JOIN ���� Į���� �������� �����Ѵ� (INNER JOIN, SIMPLE JOIN)
--NONEQUI JOIN ���� Į���� ���� �ٸ� ������ ����Ͽ� �����Ѵ�
--OUTER JOIN ���� ���ǿ� �������� �ʴ� �൵ ��Ÿ����
--SELF JOIN �����̺� ������ �����Ѵ�

--WHERE ���� ����ϴ� ������ FROM���� ����� ���� TABLE�� ���� JOIN������ �ȴ�
--�̷��� JOIN������ �ݵ�� ������� TABLE������ �ϳ��� ����
-- TABLE ���� N����� JOIN������ N-1�� �ȴ�

--CARTITION PRODUCT(īƼ�� ��) �Ǵ� CROSS JOIN
--CROSS JOIN�̶� 2�� �̻��� ���̺��� ���εɶ� WHERE �������� ����Ǵ� Į���� ���� ������
--�߻����� �ʴ� ��츦 ���Ѵ�. �׷��� ������ ���̺� �����ϴ� ��� �����Ͱ� �˻� ����� 
--��Ÿ����

--������ CROSS JOIN���� Ư���� Ű���� ���� SELECT���� FROM���� EMPLOYEES ���̺�� 
--DEPARTMENTS ���̺��� ���ÿ� ����Ѵ�

SELECT*FROM EMPLOYEES, DEPARTMENTS;
--���� ��� ���̺���� ������ �����Ǿ��� ��� �߻��ϴ� �������� �ش� ���ο� �����ϴ� 
--��� ��� ���� �� ����Ѵ�

--�⺻������ ������ ������ ���� ��Ģ�� �ؼ��ؾ� �Ѵ�
--PRIMARY KEY �� FOREIGN KEY�÷��� ���� �ٸ� ���̺��� ��� �����Ѵ�
--���� KEY������� ���̺�� ���̺��� �����Ѵ�
--WHERE ������ ���� ������ ����Ѵ�(���� ���� ����=���� ���̺�� -1)
--��Ȯ���� ���� Į�� �̸� �տ� ���̺�� �Ǵ� ���̺� ��Ī�� ���δ�

--������ ����ɴ�� �ΰ� �̻��� ���̺��� ���Ǵµ� �̶� �� ��
--�ϳ��� ���̺��� ���� �а� ���� ���� ���� Ȯ���Ͽ� ������ ���̺� ���� �����͸� 
--�������� �ȴ� �� �� ���� �д� ���̺��� ���� ���̺� �̶�� �ϰ� �ڿ� �д� 
--���̺��� ���� ���̺��̶�� �Ѵ�. �׸��� ���� ���̺��� ��ȸ�� �����Ͱ� ���� ���̺��
--�����ؾ� �ӵ��鿡�� �����ϴ�

--EQUI JOIN
--EQUI JOIN�� ���� ���� ����ϴ� ���� ������μ� ���� ����� �Ǵ� �� ���̺��� ����������
--�����ϴ� Į���� ���� ��ġ�Ǵ� ���� �����Ͽ� ����� �����ϴ� ���� ����̴�

--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� ���� Į���� DEPARTMENT_ID�� ���� ��ġ(=)�Ǵ�
--������ WHERE ���� ����Ѵ�. �����̺��� �����Ϸ��� ��ġ�Ǵ� ���� Į���� ����ؾ� �Ѵ�
--Į������ ���ԵǸ� ȥ���� ���� ������ Į���� �տ� ���̺� ���� ��(.)�� �Բ� ����Ѵ�

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES;

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;

SELECT FIRST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID;

--������ ����� ���캸�� �μ���ȣ�� �������� ���� ���� ���� ��� ���̺�� �μ� ���̺��� 
--���յǾ� �ִ� ������ PRIMARY KEY�� FOREIGN KEY�� ���� �ٸ� ���̺� ��� �����Ѵ�
--�μ� ���̺��� PRIMARY KEY �� �μ�  ��ȣ�� ��� ���̺��� FOREIGN KEY�� 
--�����Ǿ��ִ�

--�� ���� KEY�� WHERE ������ ���� ���ǿ� ����Ͽ���. �� �����ڷ� "="�� ����Ͽ����Ƿ�
--�̸� EQUI JOIN�̶�� �Ѵ�

--���̺���� �ʹ� �� ��쿡�� ���̺�� �����ϰ� ��Ī�� �ο��ؼ� ������ �����ϰ� ����Ҽ� 
--�ִ� ���̺���Ǻ�Ī�� FROM �� ������ ���̺� �̸��� ����ϰ� ������ �� ������ ��Ī��
--�����Ѵ�

SELECT E.FIRST_NAME, D.DEPARTMENT_NAME, E.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--EQUI JOIN�� AND �����ϱ�
--SUSAN�� ������ �������� ����ϱ� ���ؼ��� WHERE ������ AND �����ڸ� �߰��Ѵ�
SELECT E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID AND E.FIRST_NAME='Susan';


--NON-EQUI JOIN
--NON-EQUI ������ ������ ���̺� ���̿� Į���� ���� ���������� ��ġ���� ������ ����ϴ�
--�������� '='�������� �����ڸ� ����Ѵ�
--������ �����ϱ� ���� �޿� ��� ���̺� (SALARYGRADE)�� �����Ͽ� ���ڵ带 �Է��Ѵ�

CREATE TABLE SALARYGRADE(
GRADE NUMBER,
MINSALARY NUMBER,
MAXSALARY NUMBER
);

INSERT INTO SALARYGRADE(GRADE, MINSALARY, MAXSALARY) VALUES(1, 2000, 3000);

INSERT INTO SALARYGRADE(GRADE, MINSALARY, MAXSALARY) VALUES(2, 3001, 4500);

INSERT INTO SALARYGRADE(GRADE, MINSALARY, MAXSALARY) VALUES(3, 4501, 6000);

INSERT INTO SALARYGRADE(GRADE, MINSALARY, MAXSALARY) VALUES(4, 6001, 8000);

INSERT INTO SALARYGRADE(GRADE, MINSALARY, MAXSALARY) VALUES(5, 8001, 10000);

INSERT INTO SALARYGRADE(GRADE, MINSALARY, MAXSALARY) VALUES(6, 10001, 13000);

INSERT INTO SALARYGRADE(GRADE, MINSALARY, MAXSALARY) VALUES(7, 13001, 20000);

INSERT INTO SALARYGRADE(GRADE, MINSALARY, MAXSALARY) VALUES(8, 20001, 30000);

COMMIT;

SELECT*FROM SALARYGRADE;

--�޿� ����� 8���γ����� ���� SALARYGRADE ���̺��� ������ ��� �ͼ� �� �����
--�޿������ �����Ѵ�
--�̸� ���ؼ��� EMPLOYEES ���̺�� SALARYGRADE���̺��� �����ؾ� �Ѵ�

SELECT E.FIRST_NAME, E.SALARY, S.GRADE
FROM EMPLOYEES E, SALARYGRADE S
WHERE E.SALARY BETWEEN S.MINSALARY AND S.MAXSALARY;

SELECT E.FIRST_NAME, E.SALARY, S.GRADE
FROM EMPLOYEES E, SALARYGRADE S
WHERE E.SALARY >=S.MINSALARY AND E.SALARY <=S.MAXSALARY;

--OUTER JOIN
--���� ���� ���ǿ� �������� ���� ��� �� ���� ����� ��Ÿ���� �ʰ� �ȴ�. �̶� ���� ���ǿ� 
--�������� �ʴ� ��鵵 ��Ÿ���� ���� OUTER JOIN�� ���ȴ�
--��� ���̺�� �μ� ���̺��� �����Ͽ� ��� �̸��� �μ���ȣ�� �μ����� ����Ѵ�

SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_ID;
--�μ����̺��� ��ȸ�ϸ� ��ȣ�� 110���̻� �μ��� �����Ѵ�. ������ ���� ����� ���� 10������
--110�� �μ� ��ȣ�� ��µǰ� 120�� ���ʹ� ��µ��� �ʴ´�. �̴� ���� ���̺��� �μ���ȣ����
--110�� ���� ū ��ȣ�� �������� �ʱ� �����̴�
--�μ� ���̺��� 120�� �μ��� ������ ���� ���̺��� �μ���ȣ�� ������ , 120�� �̻� �μ��� 
--��µǵ��� �Ϸ��� OUTER JOIN�� ����ؾ��Ѵ� OUTER JOIN�� �ϱ� ���ؼ� ����ϴ� 
--��ȣ�� +�̸� ���� ���ǿ��� ������ ������ Į���� �ڿ� ��ġ�ϰ� �ϸ� �ȴ�
--��, ��� ���̺� �μ���ȣ 120�� �̻��� �μ���ȣ�� ���� ������ E.DEPARTMENT_ID(+)�ʿ�
--+ ��ȣ�� �����̸� �ȴ�

SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID(+)=D.DEPARTMENT_ID;

--2007�⵵ ��ݱ⿡ �Ի��� ����� ���غ���
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE<='2007/06/30';

--2007�⵵ ��ݱ⿡ �Ի��� �����ȣ, �����, �Ի���, �μ����� ���Ѵ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, D.DEPARTMENT_NAME
FROM EMPLOYEES E , DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
AND HIRE_DATE>='2007/01/01' AND HIRE_DATE<='2007/06/30';

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID(+)
AND HIRE_DATE>='2007/01/01' AND HIRE_DATE<='2007/06/30';

--SELF JOIN
--SELF JOIN �̶� �� �״�� �ڱ� �ڽŰ� ������ �δ� ���� ���Ѵ�. FROM �� ������ 
--������ ���̺� ���� 2�� ����ϰ� WHERE ������ ���������� �־�� �ϴµ�
--�̶� ���� �ٸ� ���̺��ΰ�ó�� �ν��Ҽ� �ֵ��� �ϱ� ���ؼ� ��Ī�� ����Ѵ�

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
FROM EMPLOYEES;

--EMPLOYEES ���̺� ��Ī�� ����Ͽ� �ϳ��� ���̺��� �ΰ��� ���̺��ΰ�ó�� ����Ϸ��� WORK
--�� MANAGER�� ��Ī�� �ο��Ѵ�

SELECT WORK.FIRST_NAME �����, MANAGER.FIRST_NAME �Ŵ�����
FROM EMPLOYEES WORK, EMPLOYEES MANAGER
WHERE WORK.MANAGER_ID=MANAGER.EMPLOYEE_ID;

SELECT RPAD(WORK.FIRST_NAME,11,'')||'�� �Ŵ�����'||MANAGER.FIRST_NAME||'�̴�.'
AS"�� ����� �Ŵ���"
FROM EMPLOYEES WORK, EMPLOYEES MANAGER
WHERE WORK.MANAGER_ID=MANAGER.EMPLOYEE_ID;

--ANSI JOIN
--ANSI SQL�� ��κ��� ��������� ���̽� �ý��ۿ��� ǥ�ؾ���̴�
--�ٸ� DBMS���� ȣȯ���� ���ؼ��� ANSI������ ����ϴ� ���� ����
--ANSI ǥ�� SQL ���� ������ ��� ���ο� Ű����� ���� �����ϸ� , SELECT����
--FROM ������ ������ �Ϻ��ϰ� �����Ҽ� �ִ�
--ANSI CROSS JOIN
--�������� ��ǥ�� ���̺���� �����Ͽ����� ��ǥ��� CROSS JOIN�̶�� ��Ȯ�ϰ� �����Ѵ�

SELECT*FROM EMPLOYEES CROSS JOIN DEPARTMENTS;


SELECT FIRST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID
WHERE FIRST_NAME='Susan';

--USING�� �̿��� ���� ���� ����
--�� ���̺� ���� ���� ���ǿ� ���Ǵ� Į���� ���ٸ� ON ��� USING�� ����� �� �ִ�

SELECT EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES INNER JOIN DEPARTMENTS
USING(DEPARTMENT_ID)
WHERE FIRST_NAME='Susan';

--�⺻������ JOIN�� INNER JOIN�̴�
--�ΰ� �̻��� ���̺��� �����Ҷ� ��ġ�ϴ� ���� ���� ���� ���ο��� ���ܵȴ�
--OUTER JOIN�� ��ġ���� ���� ���� ������ �Ǹ� �ݵ�� OUTER JOIN ������־�� �Ѵ�

--ANSI OUTER JOIN
--ANSI ������ OUTER JOIN������ ��ü �����͸� ������ ���̺��� �������� LEFT, RIGHT�� 
--������ �ָ� �ȴ�
--�׸��� ������ �������� �ʾҴ� FULL���� �����Ѵ�

SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
WHERE HIRE_DATE >='2007/01/01' AND HIRE_DATE<='2007/06/30';