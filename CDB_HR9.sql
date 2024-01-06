--1.sales �μ� �Ҽ� ����� �̸��� �Ի����� ����϶�
SELECT FIRST_NAME , HIRE_DATE
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = 'Sales';

--2. Ŀ�̼��� �޴� ����� �̸�, Ŀ�̼� ������ �װ� ���� �μ����� ����϶�
SELECT E.FIRST_NAME, E.COMMISSION_PCT, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE COMMISSION_PCT IS NOT NULL;

--3. IT�μ����� �ٹ��ϰ� �ִ� �����ȣ, �̸�, ����, �μ����� ����϶�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = 'IT';

----4.Guy�� ������ �μ����� �ٹ��ϴ� ������� �̸��� �μ���ȣ�� ����϶�
SELECT FRIEND.FIRST_NAME , WORK.DEPARTMENT_ID
FROM EMPLOYEES WORK , EMPLOYEES FRIEND 
WHERE WORK.DEPARTMENT_ID=FRIEND.DEPARTMENT_ID
AND  WORK.FIRST_NAME =  'Guy'
AND FRIEND.FIRST_NAME <>  'Guy';

--5. EMPLOYEES, DEPARTMENTS, LOCATIONS ���̺��� ������ �ľ��� �� 
--OXFORD�� �ٹ��ϴ� ����� ���� �̸�, ����,�μ���, ���ø��� ����Ͻÿ�
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS "NAME", E.JOB_ID, D.DEPARTMENT_NAME,
L.CITY 
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'Oxford';


--6. �� ����� ���� ������ ���踦 �̿��Ͽ� ������ ���� ������ ������ �ۼ��ϰ��� �Ѵ�
--ȫ�浿�� ��տ��� �����Ѵ�-> Eleni Zlotkey report to Steven King
--� ����� � ���� �����ϴ����� �� ���� �����Ͽ� ����Ͻÿ�
--��, ������ ��簡 ���� ����� �ִٸ� �� ������ �����Ͽ� ����ϰ�, ����� �̸��� �빮�ڷ� ����Ͻÿ�

SELECT E.FIRST_NAME || ' ' || E.LAST_NAME || 'REPORT TO' || UPPER(M.FIRST_NAME || ' ' || M.LAST_NAME)
AS "EMPLOYEE VS MANAGER"
FROM EMPLOYEES E LEFT OUTER JOIN EMPLOYEES M 
ON (E.MANAGER_ID = M.EMPLOYEE_ID);

--7. EMPLOYEES, DEPARTMENTS ���̺��� ������ �ľ��� �� ��� ���� 5�� �̻��� �μ��� �μ���� ������� ����Ͻÿ�
--�̶� ������� ���� ������ �����Ͻÿ� 
SELECT D.DEPARTMENT_NAME,  COUNT(E.EMPLOYEE_ID)
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
USING(DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_NAME
HAVING COUNT(E.EMPLOYEE_ID) >= 5
ORDER BY 2 DESC;

