--테이블에 내용을 추가/ 수정/ 삭제하기 위한 DML

--테이블에 새로운 행을 추가하는 INSERT문

--특정한 컬럼에만 DATA를 입력하는 경우
--INSERT INTO TABLE_NAME(COLUMN_VALUE,...)
--VALUES(COLUMN_VALUE,...)
--모든 컬럼에 DATA를 입력하는 경우
--INSERT INTO TABLE_NAME
--VALUES(COLUMN_VALUE,...)
--새로운 행을 추가하기 위해 INSERT문을 사용하면 한번에 하나의 행만 삽입된다
--기술한 칼럼 목록 순서대로 VALUES에 지정된 값이 삽입된다. 만약 칼럼 목록을 기술하지
--않으면 테이블에 있는 칼럼의 디폴트 순서대로 VALUES이하의 값이 삽입되며 문자와 날짜 값은
--단일 따옴표('')를 사용해야한다
--먼저 부서 테이블 DEPT을 생성한다

CREATE TABLE DEPT(
DEPTNO NUMBER(2),
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);

DESC DEPT;

SELECT*FROM DEPT;

--칼럼 DEPTNO에 10번 부서, DNAME에는 'ACCOUNTING'을, LOC에는 'NEWYORK'을 추가하자

INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING','NEW YORK');

--INSERT 구문에서 오류 발생의 예
--칼럼명에서 기술된 목록의 수보다 VALUES 다음에 나오는 괄호안에 기술한 값의 개수가 적으면
--에러가 발생한다

INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(10,'ACCOUNTING');

--칼럼명에 기술된 목록의 수보다 VALUES 다음에 나오는 괄호에 기술한 값의 개수가 많으면
--에러가 발생한다

INSERT INTO DEPT(DEPTNO, DNAME)
VALUES(10, 'ACCOUNTING','NEW YORK', 20);

--칼럼명이 잘못입력되었을 때에도 에러가 발생한다

INSERT INTO DEPT(NUM, DNAME, LOC)
VALUES(10, 'ACCOUNTING','NEW YORK');

--칼럼과 입력할 값의 데이터 타입이 서로 맞지 않을 경우에도 에러가 발생한다
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES (10, ACCOUNTING, 'NEW YORK');

--칼럼명을 생략한 INSERT 구문
--테이블에 로우를 추가할때 몇몇 특정 칼럼이 아닌모든 칼럼에 자료를 입력하는 경우에는 굳이
--칼럼 목록을 기술하지 않아도 된다 칼럼 목록이 생략되면 VALUES 절 다음의 값들이 테이블의
--기본 칼럼 순서대로 입력된다

--칼럼명을 생략한 채 테이블이 갖는 모든 칼럼에서 데이터를 추가한다

INSERT INTO DEPT
VALUES (20, 'RESEARCH','DALLAS');

SELECT*FROM DEPT;

--NULL값의 삽입
--테이터를 입력하는 시점에서 해당 칼럼값을 모르거나 확정되지 않았을 경우 (선택항목)에는 
--NULL값을 입력해야 한다
--NULL값 삽입에는 암시적인 방법과 명시적인 방법이 있다

DESC DEPT;

--DEPT 테이블을 생성할때 제약조건을 지정하지 않았기에 모든 칼럼에 NULL값을 저장할 수 있도록
--허용하고 있다

--부서 테이블에 칼럼이 NULL값 허용하는지 살펴보면 NULL 값을 입력하지 못하는 칼럼에 대해서는 
--NOT NULL이라고 표시된다

--암시적으로 NULL값 삽입
--암시적인 방법으로 칼럼명 리스트에 칼럼을 생략하는 것이다. 즉, 다른 칼럼은 값을 입력하지만
--이렇게 생략한 칼럼에는 암시적으로 NULL값이 할당된다

--지역명이 결정되지 않은 30부서에 부서명만 입력

INSERT INTO DEPT(DEPTNO, DNAME)
VALUES (30, 'SALES');

--명시적으로 NULL 값의 삽입
--명시적 방법은 VALUES에 NULL이라고 직접 기술하여 입력하는 방법이다

--지역명이 결정되지 않아서 다음과 같이 2개의 칼럼만 입력하면 오류가 발생한다

INSERT INTO DEPT
VALUES(40, 'OPERATIONS');

--쿼리 수정

INSERT INTO DEPT
VALUES (40, 'OPERATIONS',NULL);

SELECT* FROM DEPT;

--NULL값을 갖는 칼럼을 추가하기 위해서 NULL대신 ''를 사용할수 있다

INSERT INTO DEPT
VALUES (50, '', 'CHICAGO');

SELECT*FROM DEPT;

--기존 데이터를 삭제하고 다시 입력 작업을 하자

DELETE FROM DEPT;

--DEPT 테이블 생성시 컬럼들의 자릿수와 DEPARTMENTS 테이블의 컬럼의 자릿수를 일치하도록
--테이블을 수정하자

ALTER TABLE DEPT MODIFY (DEPTNO NUMBER(4), DNAME VARCHAR2(30));

INSERT INTO DEPT
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID FROM DEPARTMENTS;

SELECT*FROM DEPT;

--INSERT ALL
--두개 이상의 테이블에 INSERT ALL 을 이용하여  한번에 삽입 가능
--단, 각 서브쿼리의 조건절이 같아야 함

CREATE TABLE EMP01
AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE 1=0;

CREATE TABLE EMP_MANAGER
AS
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE 1=0;

--EMP01테이블에 EMPLOYEES 테이블에서 부서코드가 30인 직원의 사번, 이름, 소속부서,
--입사일을 삽입
--EMP_MANAGER테이블에 EMPLOYEES 테이블의 부서코드가 30인 직원의 사번, 이름, 
--관리자 사번을 조회하여 삽입하고자 한다

INSERT ALL

INTO EMP01
VALUES(EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE)

INTO EMP_MANAGER
VALUES(EMPLOYEE_ID, FIRST_NAME, MANAGER_ID)

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE, MANAGER_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

SELECT*FROM EMP01;

SELECT*FROM EMP_MANAGER;

--EMPLOYEES 테이블의 구조를 복사하여 사번, 이름, 입사일, 급여를 저장할수 있는 테이블
--EMP_OLD와 EMP_NEW 생성하고자 한다

CREATE TABLE EMP_OLD
AS
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE 1=0;

CREATE TABLE EMP_NEW 
AS 
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE 1=0;

--EMPLOYEES 테이블의 입사일 기준으로 2006년 1월 1일 이전에 입사한 사원의 사번, 이름,
--입사일 , 급여를 조회해서 EMP_OLD 테이블에 삽입하고 그 후에 입사한 사원의 정보는 EMP_NEW 
-- EMP_NEW 테이블에 삽입하고자 한다

INSERT ALL
WHEN HIRE_DATE < '2006,01/01' THEN
INTO EMP_OLD
VALUES (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY)
WHEN HIRE_DATE > = '2006/01/01' THEN
INTO EMP_NEW
VALUES(EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY)

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES;

SELECT*FROM EMP_OLD;

SELECT*FROM EMP_NEW;

--테이블의 내용을 수정하기 위한 UPDATE 문

--UPDATE 문은 기존의 행을 수정하는 것이다. 따라서 어떤 행의 데이터를 수정하는지
--WHERE절을 이용하여 조건을 지정해야 한다 WHERE 절을사용하지 않을 경우에는
--테이블에 있는 모든 행이 수정된다
--테이블의 전체 행을 수정하려고 했던 것이 아니라면 큰문제가 발생하므로 WHERE 절의
--사용 유무를 신중하게 판단해야 한다

--테이블의 모든 행 변경: WHERE 절을 추가하지 않으면 테이블의 모든 행이 변경된다

CREATE TABLE EMP
AS
SELECT*FROM EMPLOYEES;

SELECT*FROM EMP;

--모든 사원의 부서 번호를 30번으로 수정하자

UPDATE EMP
SET DEPARTMENT_ID = 30;


SELECT*FROM EMP;

--모든 사원의 급여를 10%인상한다

UPDATE EMP
SET SALARY = SALARY*1.1;

--입사일을 오늘로 수정한다

UPDATE EMP 
SET HIRE_DATE = SYSDATE;

SELECT*FROM EMP01;

--테이블의 특정 행만 변경
--UPDATE문에 WHERE절을 추가하면 조건을 만족하는 테이블의 특정 행만 변경할수 있다

--새롭게 사원 테이블을 생성한다

DROP TABLE  EMP;
CREATE TABLE EMP
AS
SELECT*FROM EMPLOYEES;

--부서번호가 10번인 사원의 부서번호를 30번으로 수정
UPDATE EMP
SET DEPARTMENT_ID=30
WHERE DEPARTMENT_ID=10;

--급여가 3000이상인 사원만 급여를 10% 인상
UPDATE EMP
SET SALARY = SALARY*1.1
WHERE SALARY >= 3000;

--2007년 입사한 사원의 입사일이 오늘로 수정한다
UPDATE EMP
SET HIRE_DATE = SYSDATE
WHERE SUBSTR(HIRE_DATE, 1,2)='07';

UPDATE EMP
SET HIRE_DATE = SYSDATE
WHERE HIRE_DATE BETWEEN'07/01/01' AND '07/12/31';

--테이블에서 2개 이상의 칼럼 값 변경
-- 테이블 2개 이상의 칼럼 값을 수정하기 위해 새로운 테이블 생성

DROP TABLE EMP;
CREATE TABLE EMP
AS
SELECT*FROM EMPLOYEES;

SELECT*FROM EMP WHERE FIRST_NAME='Susan';

--Susan의 부서번호는 20번으로, 직급은 FI_MGR

UPDATE EMP
SET DEPARTMENT_ID=20, JOB_ID='FI_MGR'
WHERE FIRST_NAME ='Susan';

SELECT*FROM EMP WHERE FIRST_NAME ='Susan';

SELECT*FROM EMP WHERE LAST_NAME='Russell';

--LAST_NAME 이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상된다

UPDATE EMP
SET SALARY =17000,COMMISSION_PCT=0.45
WHERE LAST_NAME='Russell';

--테이블에 불필요한 행(레코드)을 삭제하기 위한 DELETE문
--테이블에 특정 로우(행)의 데이터를 삭제한다
SELECT*FROM DEPT;
--부서 테이블의 데이터를 모두 삭제한다

--30번 부서를 삭제
DELETE FROM DEPT WHERE DEPTNO=30;

--DELETE 와 TRUNCATE 의 차이점
--DELETE 명령어
--DELETE 명령어를 사용하여 TABLE 의 행을 삭제할 경우에 행이 많으면 행이 삭제 될때마다
--많은 자원이 소모된다 왜냐하면 DELETE 명령어는 삭제 이전 상태로 원상 복귀할 경우를 
--생각해 ROLLBACK 정보를 저장하고 있어야 하기 때문이다

--TRUNCATE 명령어
--TRUNCATE 명령어
--ROLLBACK을 만들지 않음

--MERGE문 
--구조가 같은 두개의 테이블을 하나의 테이블로 합치는 기능 제공
-- 두 테이블에서 지정하는 조건의 값이 존재하면 UPDATE되고 조건의값이 없으면 INSERT한다

--MERGE문은 조건을 비교해서 테이블에 해당 조건에 맞는 데이터가 없으면 INSERT문,
--있으면 UPDATE를 수행하는 문장이다

CREATE TABLE TB_ADD_CUSTOMER (
CUSTOMER_CD CHAR(7) NOT NULL, --고객코드
CUSTOMER_NM VARCHAR2(10) NOT NULL,
MW_FLG CHAR(1) NOT NULL,
BIRTH_DAY CHAR(8) NOT NULL,
PHONE_NUMBER VARCHAR2(16),
CONSTRAINT TB_ADD_CUSTROMER_CUSTOMER_CD_PK PRIMARY KEY(CUSTOMER_CD)
);

INSERT INTO TB_ADD_CUSTOMER(customer_cd, customer_nm, mw_flg, birth_day, phone_number)
VALUES ('2017108','박승대','M','19711230','010-2580-9919');
INSERT INTO TB_ADD_CUSTOMER(customer_cd, customer_nm, mw_flg, birth_day, phone_number)
VALUES ('2019302','전미래','W','19740812','010-8864-0232');

SELECT*FROM TB_ADD_CUSTOMER;

MERGE INTO TB_CUSTOMER CU
USING TB_ADD_CUTOMER NC
ON (CU.CUSTOMER_CD=NC.CUSTOMER_CD)
WHEN MATCHED THEN
UPDATE SET CU.CUSTOMER_NM=NC.CUSTOMER_NM,
CU.MW_FLG=NC.MW_FLG,
CU.BIRTH_DAY=NC.BIRTH_DAY,
CU.PHONE_NUMBER=NC.PHONE_NUMBER
WHEN NOT MATCHED THEN
INSERT(CU.CUSTOMER_CD, CU.CUSTOMER_NM, CU.MW_FLG,CU.BIRTH_DAY,
CU.PHONE_NUMBER,CU.EMAIL, CU.TOTAL_POINT, CU.REG_DTTM)
VALUES(NC.CUSTOMER_CD,NC.CUSTOMER_NM,NC.MW_FLG,NC.BIRTH_DAY,
NC.PHONE_NUMBER,'',0,TO_CHAR(SYSDATE,'YYYYMMDDHHMISS'));

SELECT*FROM TB_CUSTOMER;
