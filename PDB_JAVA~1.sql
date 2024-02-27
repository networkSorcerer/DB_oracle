/
DECLRAE 
--%ROWTYPE 속성으로 로우를 저장할수있는 레퍼런스 변수 선언
vemployees employees%ROWTYPE;
VSALARY NUMBER(8,2);
BEGIN
DBMS_OUTPUT.PUT_LINE('사번/이름/급여');
DBMS_OUTPUT.PUT_LINE('--------------');
--Pat사원의 전체 정보를 로우단위로 얻어와 VEMPLOYEE에 저장한다
SELECT * INTO vemployees
FROM EMPLOYEES
WHERE FIRST_NAME='Pat';
--커미션이 NULL일 경우 이를 0으로 변경해야 올바른 급여 계산이 가능하다
IF(vemployees.COMMISSION_PCT IS NULL) THEN
vemployees.COMMISSION_PCT := 0;
END IF;

--스칼라 변수에 급여를 계산할 결과를 저장한다
vsalary := vemployees.salary + (vemployees.salary*vemployees.commission_pct);
--레퍼런스 변수와 스칼라 변수에 저장된 값을 출력한다
DBMS_OUTPUT.PUT_LINE('사원번호 : ' || vemployees.salary*employees_id||
'/사원명 : ' || vemployees.first_name||
'/급여 :' || TO_CHAR(vsalary,'$999,999'));
END;
/

select *from employees;