/
DECLRAE 
--%ROWTYPE �Ӽ����� �ο츦 �����Ҽ��ִ� ���۷��� ���� ����
vemployees employees%ROWTYPE;
VSALARY NUMBER(8,2);
BEGIN
DBMS_OUTPUT.PUT_LINE('���/�̸�/�޿�');
DBMS_OUTPUT.PUT_LINE('--------------');
--Pat����� ��ü ������ �ο������ ���� VEMPLOYEE�� �����Ѵ�
SELECT * INTO vemployees
FROM EMPLOYEES
WHERE FIRST_NAME='Pat';
--Ŀ�̼��� NULL�� ��� �̸� 0���� �����ؾ� �ùٸ� �޿� ����� �����ϴ�
IF(vemployees.COMMISSION_PCT IS NULL) THEN
vemployees.COMMISSION_PCT := 0;
END IF;

--��Į�� ������ �޿��� ����� ����� �����Ѵ�
vsalary := vemployees.salary + (vemployees.salary*vemployees.commission_pct);
--���۷��� ������ ��Į�� ������ ����� ���� ����Ѵ�
DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || vemployees.salary*employees_id||
'/����� : ' || vemployees.first_name||
'/�޿� :' || TO_CHAR(vsalary,'$999,999'));
END;
/

select *from employees;