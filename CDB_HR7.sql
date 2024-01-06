--SUM , AVG, MIN, MAX, COUNT �׷��Լ��� �н��Ѵ�
--Į���� �� ���� �׷� �Լ��� ��� ���� ���ϴ� GROUP BY ���� �н��Ѵ�
 --�׷��� ����� ���� �Ҷ��� HAVING���� �н��Ѵ�
 
 --������ �� �޿� ���ϱ� 
 SELECT SUM(SALARY)
 FROM EMPLOYEES;
 SELECT TO_CHAR(SUM(SALARY), '$999,999') AS TOTAL
 FROM EMPLOYEES;
 
 --������ ��� �޿� ���ϱ� (AVG�Լ�)
 SELECT AVG(SALARY)
 FROM EMPLOYEES;
 
 SELECT ROUND(AVG(SALARY),1)
 FROM EMPLOYEES;
 
 --�ֱٿ� �Ի��� ����� ���� �������� �Ի��� ������ �Ի��� ����ϱ�(MAX/MIN �Լ�)
 SELECT TO_CHAR(MAX(HIRE_DATE),'YYYY-MM-DD'), TO_CHAR(MIN(HIRE_DATE),'YYYY-MM-DD')
 FROM EMPLOYEES;
 
 --NULL�� ������ �÷��� ������ ����� NULL�̴� �׷��� �׷��Լ��� �ٸ� �����ڿʹ� �޸�, 
 --�ش� �÷����� NULL�� ���� �����ϰ� ����ϱ� ������ ����� NULL�� ��ȯ���� �ʴ´�. 
 --�׷��� �ο�(���ڵ�)���� ���ϴ� COUNT�Լ��� NULL���� ���ؼ��� ���� �ʴ´�
 
 --��ü ����� ���� Ŀ�̼����޴� ����� ��
 
SELECT COUNT(*), COUNT(COMMISSION_PCT)
FROM EMPLOYEES;

--JOB�� ������ ����� ��, �ߺ����� ���� ������ ������ ���غ��� 
SELECT FIRST_NAME, MIN(SALARY) 
FROM EMPLOYEES;
-->SQL ����: ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
--������ �߻��ϴ� ������ ���� �׸�ó�� �׷��Լ��� ������� �ϳ��ε� ���� �׷��Լ��� ��������
--���� �ܼ� Į���� �ο� ������ 107���� ���� ����Ǵ� �ο찡 �޶� ���� ��ġ��ų���� ���� 
--�����̴�

--GROUP BY ���� ����� Ư�� �������� �������� �׷�ȭ �ϱ� 
--Ư�� �׷����� ���� ������ ���� �� ���
--WHERE �� ORDER BY �� ���̿� ��ġ
--����(�׷�)�Լ��� �Բ� ���
--SELECT ����Ʈ���� ���� (�׷�)�Լ��� ������ ��� �÷��� ǥ������ GROUP BY���� ����ؾ� ��

--������� �μ� ��ȣ�� �������� 

SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

--�μ��� �ִ� �޿��� �ּ� �޿� ���ϱ�
SELECT DEPARTMENT_ID, MAX(SALARY)"�ִ� �޿�",MIN(SALARY)"�ּ� �޿�"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--�Ҽ� �μ��� �޿��� �հ� �޿��� ��� ���ϱ�
SELECT DEPARTMENT_ID, SUM(SALARY), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

--�μ����� ������ ���� Ŀ�̼��� �޴� ������ ���� ī��Ʈ �غ���

--HAVING ���� 
--SELECT ���� ������ ����Ͽ� ����� ���� �Ҷ��� WHERE ���� ���������, �׷��� �����
--������ ���� HAVING���� ����Ѵ�
--GROUP BY �� ������ ��ġ�� GROUP BY �� ����� ������� �ٽ� ���͸� �Ŵ� ����
--HAVING �������� SELECT����Ʈ�� ����ߴ� �����Լ��� �̿��� ������ ���

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, FLOOR(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING FLOOR(AVG(SALARY))>= 5000
ORDER BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, MAX(SALARY) , MIN(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY)> 5000
ORDER BY DEPARTMENT_ID;


--�� ���غ� �Ұ踦 ����ؼ� �����ִ� ROLLUP�Լ� (�ڵ����� �Ұ���հ踦 �����ִ� �Լ�)
--ROLLUP()�� ������ �÷����� �Ұ�(��ü�� �ƴ� ��� �Ѻκи��� ���� �հ�)�� ������ �Ǵ� 
-- �÷����̴�

--���ڷ� ���޹��� �׷� �� ���� ���� ������ �׷캰�� �߰��� ���� ��� ��ȯ 
--�μ��� ���� ������ ����ϴ� ����� �޿��� �հ� �����, �μ��� �޿��� �հ� �����, ��ü
--�����, ��ü ����� �޿��� �հ� ������� ���ϰ��� �Ѵ�. �̶� ������ �����ϸ� 
--�μ������� ���� ����(����)�� ����ϴ� ������� �޿��� �հ� �����
--�μ��� �޿��� �հ� ����� 

--�μ��� ���� ������ ����ϴ� ����� �޿��� �� �� ����� 
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*),SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;

--�μ��� �޿��� �հ� �����
SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY) --�μ��� �޿��� �հ� �����
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--��ü ����� �޿��� �հ� �����
SELECT NULL DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY) -- ��ü ����� �޿��� �հ� �����
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, JOB_ID;

--���� �������� UNION ALL�� �ۼ��� �������Դϴ�
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY) AS TOTAL --
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
UNION ALL
SELECT DEPARTMENT_ID, NULL AS JOB_ID, COUNT(*), SUM(SALARY) AS TOTAL --
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
UNION ALL
SELECT NULL AS DEPARTMENT_ID, NULL AS JOB_ID, COUNT(*), SUM(SALARY) AS TOTAL--
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, JOB_ID;


--�������� ��� ������ ���� ������ ����� ����� �Ҷ� ROLLUP(�÷�)�Լ��� ����ϸ�ȴ�
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;

SELECT JOB_ID, DEPARTMENT_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP(JOB_ID, DEPARTMENT_ID)
ORDER BY JOB_ID;

--CUBE �Ұ�� ��ü �հ���� ����ϴ� �Լ�
--CUBE �� ����� ǥ���� ������ ���� ������ ��� ���պ��� ������ ����� ��ȯ�Ѵ�

SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY CUBE(DEPARTMENT_ID, JOB_ID);

--���� ������
--������ ������ ����̹Ƿ� ���� ������(UNION, UNION ALL, INTERSECT, MINUS)�� 
--����Ҷ� ������ ������ ���� �Ѱ� �̻��� ����Ҽ��ִ�. �� �������� SELECT���� 
--������ �� �ٸ� �ϳ��� ������ ����� ������ �ϴ� ���� ���� �������̴�

CREATE TABLE exp_goods_asia ( -- �ѱ��� �Ϻ��� 10�� ����ǰ ���̺�
COUNTRY VARCHAR2(10), --�����
SEQ NUMBER, -- ��ȣ
GOODS VARCHAR2(80) --��ǰ��
);
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 1, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 2, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 5,  'LCD');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 6,  '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 7,  '�޴���ȭ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 8,  'ȯ��źȭ����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 9,  '�����۽ű� ���÷��� �μ�ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 10,  'ö �Ǵ� ���ձݰ�');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 1, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 2, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 5, '�ݵ�ü������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 6, 'ȭ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 7, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 8, '�Ǽ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 9, '���̿���, Ʈ��������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 10, '����');

SELECT*FROM EXP_GOODS_ASIA;

--UNION ALL �� ������ ��� ������ �� �����̴� . �ߺ��� �൵ �״�� ��µȴ�
--UNION �� ������ ��� ������ �������̴�. �ߺ��� ���� ���ٷ� ��µȴ�
--INTERSECT �� ������ ��� ������ �������̴�. �ߺ��� ���� ���ٷ� ��µȴ�
--MINUS �տ� �ִ� ������ ��� ���տ��� �ڿ� �ִ������� ��� ������ �� �������̴�
--�ߺ��� ���� ���ٷ� ��µȴ�

SELECT* 
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�ѱ�';

SELECT*
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�Ϻ�';

SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�ѱ�'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�Ϻ�';

--HR ��Ű���� �ִ� JOB_HISTORY ���̺��� ������� ���� �����̷��� ��Ÿ���� ���̺��̴�
--�� ������ �̿��Ͽ� ��� ����� ���� �� ������ ���� �̷� ������ ����ϰ��� �Ѵ�
--�ߺ��� ��������� ���� ��� �ѹ��� ǥ���Ͽ� ����Ͻÿ�

SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY;


--�� ����� �̿��Ͽ� ��µ� 176�� ����� ���� �̷��� ���� ��¥ �̷��� ��ȸ�Ͻÿ�
SELECT EMPLOYEE_ID, JOB_ID, NULL AS "START DATE", NULL AS "END DATE"
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 176
UNION 
SELECT EMPLOYEE_ID, JOB_ID, START_DATE, END_DATE
FROM JOB_HISTORY
WHERE EMPLOYEE_ID = 176;

--UNION ALL
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�ѱ�'
UNION ALL
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�Ϻ�';

--INTERSECT
--������

SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�ѱ�'
INTERSECT
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�Ϻ�';

--MINUS ������
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�ѱ�'
MINUS
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�Ϻ�'


--���� �������� ���ѻ���
--���� �����ڷ� ����Ǵ� �� SELECT���� SELECT����Ʈ ������ ������Ÿ���� ��ġ�ؾ��Ѵ�

--ORA-01789 : ���� ����� ����Ȯ�� ���� ��� ���� ������ �ֽ��ϴ�
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�ѱ�'
UNION
SELECT SEQ, GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�Ϻ�';

--ORA-01790 : �����ϴ� �İ� ���� ������ �����̾�� �մϴ�
SELECT SEQ
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�ѱ�'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�Ϻ�';


--���տ����ڷ�  SELECT ���� ������ �� ORDER BY���� �� ������ ���忡���� ����Ҽ��ִ�
--ORA-0093SQL��ɾ �ùٸ��� ������� �ʾҴ�
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�ѱ�'
ORDER BY GOODS
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�Ϻ�';

SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�ѱ�'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�Ϻ�'
ORDER BY GOODS;
