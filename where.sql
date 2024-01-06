--1. 급여가 3000 이상인 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력하라
SELECT EMPLOYEE_ID , FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 3000;

--2. 담당 업무가 ST_MAN인 사원의 정보를 사원번호, 이름, 담당업무, 급여, 부서번호를 출력하라
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'ST_MAN';

---------3. 입사일자가 2006년 1월1일 이후에 입사한 사원의 정보를 사원번호, 이름, 담당업무, 급여,
--입사일자, 부서번호를 출력하라
SELECT EMPLOYEE_ID , FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('2006/01/01', 'YYYY-MM-DD');

--4. 급여가 3000에서 5000사이의 정보를 이름, 담당업무, 급여 , 부서번호를 출력하라
SELECT FIRST_NAME, JOB_ID, SALARY , DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 5000;

---------5. 입사일자가 05년도에 입사한 사원의 정보를 사원번호, 이름, 담당업무, 급여, 입사일자, 부서번호를 출력하라
SELECT EMPLOYEE_ID, FIRST_NAME , JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EXTRACT(YEAR FROM HIRE_DATE) = 2005;

--6. 사원정보(EMPLOYEES)테이블에서 사원번호, 이름, 급여, 업무번호, 입사일, 상사의 사원번호를 출력하시오
--이때 이름은 성과 이름을 연결하여 NAME이라는 별칭으로 출력하시오
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME, SALARY, JOB_ID, HIRE_DATE, MANAGER_ID
FROM EMPLOYEES;

--7.  사원의 성과 이름은 NAME, 업무번호는 JOB, 급여는 SALARY, 연봉에 $100보너스를 추가하여 계산한 값은 
--INCREASED Ann_Salary, 급여에 $100보너스를 추가하여 계산한 연봉은 increased Salary라는 별칭으로 출력하시오
select  FIRST_NAME || ' ' || LAST_NAME AS NAME, JOB_ID AS JOB, SALARY, 
NVL(SALARY+(SALARY*COMMISSION_PCT),0) AS INCREASED_Ann_Salary, SALARY+100 AS INCREASED_SALARY
FROM EMPLOYEES;


--------8.모든 사원의 이름과 연봉을 이름 1YEAR SALARY=$연봉 형식으로 출력하고 1 YEAR SALARY라는 별칭을 붙여 출력하시오
SELECT 
    LAST_NAME || ' ' || FIRST_NAME || ' 1YEAR SALARY=$' || SALARY AS "1 YEAR SALARY"
FROM EMPLOYEES;

-------9. 부서별로 담당하는 업무 ID를 한번씩 출력하시오
SELECT DISTINCT DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES;

--10. 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다. 사원정보 테이블에서 급여가 $7000
--위 이외인 사람의 성과 이름 및 급여를 급여가 작은 순서로 출력하시오
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY <= 7000
ORDER BY SALARY;

------11.2006년 05월 20일부터 2007년 05월 20일 사이에 고용된 사원들의 성과 이름 (NAME 별칭),
--사원번호, 입사일자를 단, 입사일이 빠른 순으로 정렬하시오
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME , EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2006/05/20' AND '2007/05/20'
ORDER BY HIRE_DATE;

------12.부서에서는 급여와 수당율에 대한 지출 보고서를 작성하려고 한다
--이에 수당을 받는 모든 사원의 성과 이름(NAME 별칭), 급여, 업무, 수당율을 출력하시오 
--이때 급여가 큰 순서대로 정렬하되, 급여가 같으면 수당율이 큰 순서대로 정렬하시오 
SELECT 
    LAST_NAME || ' ' || FIRST_NAME AS NAME,
    SALARY,
    JOB_ID,
    COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC;

------추가1 이름, 급여, 커미션 금액, 총액(급여+커미션)을 구하여 총액이 많은 순서대로 출력하라 
--단, 커미션이 NULL인 사람은 제외 한다
SELECT FIRST_NAME , SALARY , SALARY*NVL(COMMISSION_PCT, 0) AS 커미션금액, 
SALARY+SALARY*NVL(COMMISSION_PCT, 0) AS 총액
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY 총액 DESC;

--추가 2 이번분기에 60번 IT부서에서는 신규프로그램을 개발하고 보급하여 회사에 공헌하였다
--이에 해당 부서의 사원급여를 12.3% 인상하기로 하였다
--60번 IT부서 사원의 급여를 12.3% 인상하여 정수만 (반올림) 표시하는 보고서를 작성하시오
--출력형식은 사번, 이름과 성(NAME 으로 별칭) 급여 인상된 급여 (INCREASED SALARY로 별칭)순으로 출력한다
SELECT 
    EMPLOYEE_ID,
    LAST_NAME || ' ' || FIRST_NAME AS NAME,
    SALARY,
    ROUND(SALARY*1.123) AS "INCREASED SALARY"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY "INCREASED SALARY" DESC;

--추가 3. 급여가 1500부터 3000 사이의 사람은 급여의 15%를 회비로 지불하기로 하였다
--이를 이름, 급여, 회비(소수점 이하 반올림)를 출력하라
SELECT FIRST_NAME , SALARY, ROUND(SALARY*0.15) AS 회비
FROM EMPLOYEES
WHERE SALARY BETWEEN 1500 AND 3000;

--추가 4 모든 사원의 실수령액을 계산하여 출력하라. 단, 급여가 많은 순으로 이름, 급여, 실수령액을 출력하라
SELECT 
    LAST_NAME || ' ' || FIRST_NAME AS NAME,
    SALARY,
    SALARY - ROUND(SALARY * 0.1) AS NET_SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;

