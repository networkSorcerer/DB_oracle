--1.sales 부서 소속 사원의 이름과 입사일을 출력하라
SELECT FIRST_NAME , HIRE_DATE
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = 'Sales';

--2. 커미션을 받는 사원의 이름, 커미션 비율과 그가 속한 부서명을 출력하라
SELECT E.FIRST_NAME, E.COMMISSION_PCT, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE COMMISSION_PCT IS NOT NULL;

--3. IT부서에서 근무하고 있는 사원번호, 이름, 업무, 부서명을 출력하라
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = 'IT';

----4.Guy과 동일한 부서에서 근무하는 동료들의 이름과 부서번호를 출력하라
SELECT FRIEND.FIRST_NAME , WORK.DEPARTMENT_ID
FROM EMPLOYEES WORK , EMPLOYEES FRIEND 
WHERE WORK.DEPARTMENT_ID=FRIEND.DEPARTMENT_ID
AND  WORK.FIRST_NAME =  'Guy'
AND FRIEND.FIRST_NAME <>  'Guy';

--5. EMPLOYEES, DEPARTMENTS, LOCATIONS 테이블의 구조를 파악한 후 
--OXFORD에 근무하는 사원의 성과 이름, 업무,부서명, 도시명을 출력하시오
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS "NAME", E.JOB_ID, D.DEPARTMENT_NAME,
L.CITY 
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
INNER JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'Oxford';


--6. 각 사원과 직속 상사와의 관계를 이용하여 다음과 같은 형식의 보고서를 작성하고자 한다
--홍길동은 허균에게 보고한다-> Eleni Zlotkey report to Steven King
--어떤 사원이 어떤 사운에게 보고하는지를 위 예를 참고하여 출력하시오
--단, 보고할 상사가 없는 사원이 있다면 그 정보도 포함하여 출력하고, 상사의 이름은 대문자로 출력하시오

SELECT E.FIRST_NAME || ' ' || E.LAST_NAME || 'REPORT TO' || UPPER(M.FIRST_NAME || ' ' || M.LAST_NAME)
AS "EMPLOYEE VS MANAGER"
FROM EMPLOYEES E LEFT OUTER JOIN EMPLOYEES M 
ON (E.MANAGER_ID = M.EMPLOYEE_ID);

--7. EMPLOYEES, DEPARTMENTS 테이블의 구조를 파악한 후 사원 수가 5명 이상인 부서의 부서명과 사원수를 출력하시오
--이때 사원수가 많은 순으로 정렬하시오 
SELECT D.DEPARTMENT_NAME,  COUNT(E.EMPLOYEE_ID)
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
USING(DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_NAME
HAVING COUNT(E.EMPLOYEE_ID) >= 5
ORDER BY 2 DESC;

