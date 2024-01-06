--하나의 테이블에 대해서 SQL 명령어를 사용하였다. 하지만 관계형 데이터 베이스에서는
--테이블간의 관계가 중요하기 때문에 하나 이상의 테이블이 빈번히 결합되어 사용된다.
--한 개 이상의 테이블에서 데이터를 조회하기 위해서 사용되는 것이 조인이다
--다시 말해 SQL에서는 두개 이상의 테이블을 결합해야만 원하는 결과를 얻을수 있을 때 
--한번의 질의로 원하는 결과를 얻을수 있는 조인 기능을 제공한다
--EUQI JOIN 동일 칼럼을 기준으로 조인한다 (INNER JOIN, SIMPLE JOIN)
--NONEQUI JOIN 동일 칼럼이 없이 다른 조건을 사용하여 조인한다
--OUTER JOIN 조인 조건에 만족하지 않는 행도 나타낸다
--SELF JOIN 한테이블 내에서 조인한다

--WHERE 절에 명시하는 조건이 FROM절에 명시한 여러 TABLE을 묶는 JOIN조건이 된다
--이러한 JOIN조건은 반드시 묶어야할 TABLE수보다 하나가 적다
-- TABLE 수가 N가라면 JOIN조건은 N-1이 된다

--CARTITION PRODUCT(카티션 곱) 또는 CROSS JOIN
--CROSS JOIN이란 2개 이상의 테이블이 조인될때 WHERE 절에의해 공통되는 칼럼에 의한 결합이
--발생되지 않는 경우를 말한다. 그렇게 때문에 테이블에 존재하는 모든 데이터가 검색 결과로 
--나타난다

--다음은 CROSS JOIN으로 특별한 키워드 없이 SELECT문의 FROM절에 EMPLOYEES 테이블과 
--DEPARTMENTS 테이블을 동시에 기술한다

SELECT*FROM EMPLOYEES, DEPARTMENTS;
--조인 대상 테이블들의 조건이 누락되었을 경우 발생하는 현상으로 해당 조인에 참여하는 
--모든 대상 행을 다 출력한다

--기본적으로 조인은 다음과 같은 규칙을 준수해야 한다
--PRIMARY KEY 와 FOREIGN KEY컬럼을 통한 다른 테이블의 행과 연결한다
--연결 KEY사용으로 테이블과 테이블이 결합한다
--WHERE 절에서 조인 조건을 사용한다(조인 조건 개수=연결 테이블수 -1)
--명확성을 위해 칼럼 이름 앞에 테이블명 또는 테이블 별칭을 붙인다

--조인이 수행될대는 두개 이상의 테이블이 사용되는데 이때 둘 중
--하나의 테이블을 먼저 읽고 조인 조건 절을 확인하여 나머지 테이블에 가서 테이터를 
--가져오게 된다 이 때 먼저 읽는 테이블을 선행 테이블 이라고 하고 뒤에 읽는 
--테이블을 후행 테이블이라고 한다. 그리고 선행 테이블은 조회할 데이터가 적은 테이블로
--선택해야 속도면에서 유리하다

--EQUI JOIN
--EQUI JOIN은 가장 많이 사용하는 조인 방법으로서 조인 대상이 되는 두 테이블에서 공통적으로
--존재하는 칼럼의 값이 일치되는 행을 연결하여 결과를 생성하는 조인 방법이다

--EMPLOYEES 테이블과 DEPARTMENTS 테이블의 공통 칼럼인 DEPARTMENT_ID의 값이 일치(=)되는
--조건을 WHERE 절에 사용한다. 두테이블을 조인하려면 일치되는 공통 칼럼을 사용해야 한다
--칼럼며이 같게되면 혼동이 오기 때문에 칼럼명 앞에 테이블 명을 점(.)과 함께 기술한다

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES;

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;

SELECT FIRST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID;

--조인한 결과를 살펴보면 부서번호를 기준으로 같은 값을 가진 사원 테이블과 부서 테이블이 
--결합되어 있다 조인은 PRIMARY KEY와 FOREIGN KEY를 통한 다른 테이블 행과 연결한다
--부서 테이블의 PRIMARY KEY 인 부서  번호가 사원 테이블의 FOREIGN KEY로 
--설정되어있다

--이 연결 KEY를 WHERE 절에서 조인 조건에 사용하였다. 비교 연산자로 "="를 사용하였으므로
--이를 EQUI JOIN이라고 한다

--테이블명이 너무 긴 경우에는 테이블명에 간단하게 별칭을 부여해서 문장을 간단하게 기술할수 
--있다 테이블명의별칭은 FROM 절 다음에 테이블 이름을 명시하고 공백을 둔 다음에 별칭을
--지정한다

SELECT E.FIRST_NAME, D.DEPARTMENT_NAME, E.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--EQUI JOIN에 AND 연산하기
--SUSAN인 직원의 정보만을 출력하기 위해서는 WHERE 절에서 AND 연산자를 추가한다
SELECT E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID AND E.FIRST_NAME='Susan';


--NON-EQUI JOIN
--NON-EQUI 조인은 조인할 테이블 사이에 칼럼의 값이 직접적으로 일치하지 않을시 사용하는
--조인으로 '='을제외한 연산자를 사용한다
--예제를 수행하기 위해 급여 등급 테이블 (SALARYGRADE)을 생성하여 레코드를 입력한다

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

--급여 등급을 8개로나누어 놓은 SALARYGRADE 테이블에서 정보르 얻어 와서 각 사원의
--급여등급을 지정한다
--이를 위해서는 EMPLOYEES 테이블과 SALARYGRADE테이블을 조인해야 한다

SELECT E.FIRST_NAME, E.SALARY, S.GRADE
FROM EMPLOYEES E, SALARYGRADE S
WHERE E.SALARY BETWEEN S.MINSALARY AND S.MAXSALARY;

SELECT E.FIRST_NAME, E.SALARY, S.GRADE
FROM EMPLOYEES E, SALARYGRADE S
WHERE E.SALARY >=S.MINSALARY AND E.SALARY <=S.MAXSALARY;

--OUTER JOIN
--행이 조인 조건에 만족하지 않을 경우 그 행은 결과에 나타나지 않게 된다. 이때 조인 조건에 
--만족하지 않는 행들도 나타내기 위해 OUTER JOIN이 사용된다
--사원 테이블과 부서 테이블을 조인하여 사원 이름과 부서번호와 부서명을 출력한다

SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_ID;
--부서테이블을 조회하면 번호가 110번이상 부서가 존재한다. 하지만 조인 결과를 보면 10번부터
--110번 부서 번호만 출력되고 120번 부터는 출력되지 않는다. 이는 직원 테이블의 부서번호에는
--110번 보다 큰 번호가 존재하지 않기 때문이다
--부서 테이블의 120번 부서와 조인할 직원 테이블의 부서번호가 없지만 , 120번 이상 부서도 
--출력되도록 하려면 OUTER JOIN을 사용해야한다 OUTER JOIN을 하기 위해서 사용하는 
--기호는 +이며 조인 조건에서 정보가 부족한 칼럼명 뒤에 위치하게 하면 된다
--즉, 사원 테이블에 부서번호 120번 이상의 부서번호가 없기 때문에 E.DEPARTMENT_ID(+)쪽에
--+ 기호를 덧붙이면 된다

SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID(+)=D.DEPARTMENT_ID;

--2007년도 상반기에 입사한 사원을 구해보자
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE<='2007/06/30';

--2007년도 상반기에 입사한 사원번호, 사원명, 입사일, 부서명을 구한다
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, D.DEPARTMENT_NAME
FROM EMPLOYEES E , DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
AND HIRE_DATE>='2007/01/01' AND HIRE_DATE<='2007/06/30';

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID(+)
AND HIRE_DATE>='2007/01/01' AND HIRE_DATE<='2007/06/30';

--SELF JOIN
--SELF JOIN 이란 말 그대로 자기 자신과 조인을 맺는 것을 말한다. FROM 절 다음에 
--동일한 테이블 명을 2번 기술하고 WHERE 절에도 조인조건을 주어야 하는데
--이때 서로 다른 테이블인것처럼 인식할수 있도록 하기 위해서 별칭을 사용한다

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
FROM EMPLOYEES;

--EMPLOYEES 테이블에 별칭을 사용하여 하나의 테이블을 두개의 테이블인것처럼 사용하려면 WORK
--와 MANAGER로 별칭을 부여한다

SELECT WORK.FIRST_NAME 사원명, MANAGER.FIRST_NAME 매니저명
FROM EMPLOYEES WORK, EMPLOYEES MANAGER
WHERE WORK.MANAGER_ID=MANAGER.EMPLOYEE_ID;

SELECT RPAD(WORK.FIRST_NAME,11,'')||'의 매니저는'||MANAGER.FIRST_NAME||'이다.'
AS"그 사원의 매니저"
FROM EMPLOYEES WORK, EMPLOYEES MANAGER
WHERE WORK.MANAGER_ID=MANAGER.EMPLOYEE_ID;

--ANSI JOIN
--ANSI SQL은 대부분의 상용테이터 베이스 시스템에서 표준언어이다
--다른 DBMS와의 호환성을 위해서는 ANSI조인을 사용하는 것이 좋다
--ANSI 표준 SQL 조인 구문은 몇가지 새로운 키워드와 절을 제공하며 , SELECT문의
--FROM 절에서 조인을 완벽하게 지정할수 있다
--ANSI CROSS JOIN
--이전에는 쉼표로 테이블명을 구분하였으나 쉼표대신 CROSS JOIN이라고 명확하게 지정한다

SELECT*FROM EMPLOYEES CROSS JOIN DEPARTMENTS;


SELECT FIRST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID
WHERE FIRST_NAME='Susan';

--USING을 이용한 조인 조건 지정
--두 테이블 간의 조인 조건에 사용되는 칼럼이 같다면 ON 대신 USING을 사용할 수 있다

SELECT EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES INNER JOIN DEPARTMENTS
USING(DEPARTMENT_ID)
WHERE FIRST_NAME='Susan';

--기본적으로 JOIN은 INNER JOIN이다
--두개 이상의 테이블을 조인할때 일치하는 값이 없는 행은 조인에서 제외된다
--OUTER JOIN은 일치하지 않은 값도 포함이 되며 반드시 OUTER JOIN 명시해주어야 한다

--ANSI OUTER JOIN
--ANSI 구문의 OUTER JOIN에서는 전체 데이터를 가져올 테이블을 기준으로 LEFT, RIGHT를 
--설정해 주면 된다
--그리고 이전에 지원하지 않았던 FULL까지 지원한다

SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
WHERE HIRE_DATE >='2007/01/01' AND HIRE_DATE<='2007/06/30';
