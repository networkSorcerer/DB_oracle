-- 부서 테이블
CREATE TABLE DEPARTMENT(
    DEPT_ID CHAR(2) NOT NULL,
    DEPT_TITLE  NVARCHAR2(20) NOT NULL,
    LOCATION_ID VARCHAR2(2),
    CONSTRAINT DEPARTMENT_PK PRIMARY KEY(DEPT_ID)
);

INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D1','인사관리부','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D2','회계관리부','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D3','마케팅부','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D4','국내영업부','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D5','해외영업1부','L2');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D6','해외영업2부','L3');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D7','해외영업3부','L4');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D8','기술지원부','L5');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D9','총무부','L1');
-- 사원 테이블

SELECT * FROM DEPARTMENT;

CREATE TABLE EMPLOYEE(
    EMP_ID NUMBER(3) NOT NULL,
    EMP_NAME NVARCHAR2(5) NOT NULL,
    EMP_NO CHAR(14) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL,
    PHONE CHAR(11),
    HIRE_DATE DATE DEFAULT SYSDATE,
    JOB_CODE CHAR(2),
    SALARY NUMBER NOT NULL,
    SAL_LEVEL CHAR(2) NOT NULL,
    BONUS NUMBER(4,2),
    MANAGER_ID NUMBER(3),
    DEPT_CODE CHAR(2),
    ENT_DATE DATE,
    ENT_YN CHAR(1) DEFAULT 'N',
    CONSTRAINT EMPLOYEE_PK PRIMARY KEY(EMP_ID),
    CONSTRAINT EMPLOYEE_UK UNIQUE(EMP_NO),
    CONSTRAINT EMPLOYEE_FK FOREIGN KEY(DEPT_CODE) REFERENCES DEPARTMENT(DEPT_ID)
);

--최선영 수신자 모두 9:10 AM
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(200,'선동일','621212-1985634','sun_hi@kh.or.kr','01099546325', 'D9', 'J1', 'S1', 8000000, 0.3, NULL, TO_DATE('1990/02/06', 'YYYY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(201,'송중기','631126-1548654','song_jk@kh.or.kr','01045686656', 'D9', 'J2', 'S1', 6000000, NULL, 200, TO_DATE('2001/09/01', 'YYYY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(202,'노웅철','861015-1356452','no_hc@kh.or.kr','01066656263', 'D9', 'J2', 'S4', 3700000, NULL, 201, TO_DATE('2001/01/01', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(203,'송은희','631010-2653546','song_eh@kh.or.kr','01077607879', 'D6', 'J4', 'S5', 2800000, NULL, 204, TO_DATE('1996/05/31', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(204,'유재석','660508-1342154','yoo_js@kh.or.kr','01099999129', 'D6', 'J3', 'S4', 3400000, 0.2, 200, TO_DATE('2000/12/29', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(205,'정중화','770102-1357951','jung_jh@kh.or.kr','01036654875', 'D6', 'J3', 'S4', 3900000, NULL, 204, TO_DATE('1999/09/09', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(206,'박나라','660709-2054321','pack_nr@kh.or.kr','01096935222', 'D5', 'J7', 'S6', 1800000, NULL, 207, TO_DATE('2008/04/02', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(207,'하이유','690402-2040612','ha_iy@kh.or.kr','01036654488', 'D5', 'J5', 'S5', 2200000, 0.1, 200, TO_DATE('1994/07/07', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(208,'김해술','870927-1313564','kim_hs@kh.or.kr','01078634444', 'D5', 'J5', 'S5', 2500000, NULL, 207, TO_DATE('2004/04/30', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(209,'심봉선','750206-1325546','sim_bs@kh.or.kr','01013654485', 'D5', 'J3', 'S4', 3500000, 0.15, 207, TO_DATE('2011/11/11', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(210,'윤은혜','650505-2356985','youn_eh@kh.or.kr','01079964233', 'D5', 'J7', 'S5', 2000000, NULL, 207, TO_DATE('2001/02/03', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(211,'전형돈','830807-1121321','jun_hd@kh.or.kr','01044432222', 'D6', 'J6', 'S5', 2000000, NULL, 200, TO_DATE('2012/12/12', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(212,'김철수','780923-2234542','kim_cs@kh.or.kr','01066682224', 'D8', 'J6', 'S5', 2550000, 0.25, 211, TO_DATE('2015/06/17', 'YY/MM/DD'));

SELECT * FROM EMPLOYEE;

--DEPT_CODE가 D9이거나 D6이고
--SALARY 300만원이상이고
--BONUS가 있고
--남자이고
--이메일 주소가 _앞에 3글자 있는 사원의 EMP_NAME, EMP_NO, DEPT_CODE, SALARY를 조회




SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE='9' OR DEPT_CODE='D6') AND SALARY >= 3000000
AND EMAIL LIKE '___\_%'  ESCAPE'\'
AND BONUS IS NOT NULL
AND SUBSTR (EMP_NO,8,1) = 1;

--사원테이블에서 직무 ID에 3번째 _를 포함하고 4번째 자리의 값이 P인 레코드를 조회하고자 한다

SELECT * FROM EMPLOYEES
WHERE JOB_ID LIKE '___P%';

--ESCAPE
--LIKE 연산으로 '%'나'_'가 포함된 문자를 검색하고자 할때 사용된다
--'%'나'_' 앞에 ESCAPE로 특수문자를 지정하면 검색할수 있다

CREATE TABLE EMPLOYEES
AS SELECT *FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;

--EMPLOYEES테이블에서 부서코드, 그룹별 급여의 합계, 그룹별 급여의 평균 점수처리
--인원수를 조회하고 부서 코드 순으로 정렬
SELECT DEPT_CODE, SUM(SALARY), AVG(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
ORDER BY DEPT_CODE ASC;



--EMPLOYEE 테이블에서 부서코드와 보너스 받는 사원수 조회 하고 부서코드 순으로 정렬

SELECT DEPT_ID, COUNT(*)
FROM EMPLOYEE E JOIN DEPARTMENT D ON DEPT_ID = DEPT_CODE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_ID;

--EMPLOYEE테이블에서 성별과 성별 별 (성별을 기준으로 ) 급여 평균 (정수처리), 급여 합계,
--인원수 조회하고 인원수로 내림차순 정렬
SELECT DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남', 2, '여') 성별,
FLOOR (AVG(SALARY)) 평균,
SUM(SALARY) 합계,
COUNT(*) 인원수
FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1), 1,'남',2,'여')
ORDER BY 인원수 DESC;

--부서코드별로 같은 직급인 사원의 급여 합계를 조회하고 
--부서 코드 순으로 정렬
SELECT DEPT_CODE,JOB_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE, DEPT_CODE
ORDER BY DEPT_CODE;

--부서코드와 급여 3000000 이상인 직원의 그룹별 평균 조회
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
WHERE SALARY >= 3000000
GROUP BY DEPT_CODE
ORDER BY 1;

--부서코드와 급여 평균이 3000000 이상인 그룹 조회
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) 평균
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING FLOOR(AVG(SALARY)) >= 3000000
ORDER BY DEPT_CODE;

--사원번호, 사원명, 부서번호, 부서명 조회하고 부서번호 순으로 정렬
SELECT DEPT_CODE, EMP_NAME, EMP_ID,  DEPT_TITLE 
FROM EMPLOYEE E JOIN DEPARTMENT D 
ON E.DEPT_CODE = D.DEPT_ID
ORDER BY DEPT_CODE;


--전체 부서별로 사원수 조회, 부서번호, 부서명, 인원수를 조회하고 부서번호 순으로 정렬
SELECT DEPT_ID, DEPT_TITLE, COUNT(EMP_NO)
FROM DEPARTMENT LEFT OUTER JOIN EMPLOYEE
ON DEPT_ID = DEPT_CODE
GROUP BY DEPT_TITLE, DEPT_ID
ORDER BY DEPT_ID;

--사원테이블에서 급여 가장 많이 받는 사원 3명만 출력, 사원번호, 사원명, 급여, 입사일을 조회
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY, ENT_DATE
FROM (SELECT EMP_ID, EMP_NAME, SALARY, ENT_DATE
FROM EMPLOYEE
ORDER BY SALARY DESC)
WHERE ROWNUM <=3;

--보너스 포함한 연봉이 높은 5명의 사원번호, 사원명, 부서명, 입사일, 순위를 조회
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, HIRE_DATE, 연봉, 순위
FROM (SELECT EMP_ID, EMP_NAME, DEPT_TITLE, HIRE_DATE, SALARY,
(SALARY + (SALARY *NVL(BONUS,0))) * 12연봉,
RANK() OVER(ORDER BY ((SALARY + (SALARY*NVL(BONUS, 0))) * 12 ) DESC)순위
FROM EMPLOYEE JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID) )
WHERE 순위 <=5;

--프로시져(EMP_DEPT_PROC) 실행시 사용자에게 부서 또는 직무를 나타내는 문자를 입력 받아
--DEPTID_JOBID 매개 변수에 이때 'DEPTID'라고 입력하면 부서별 급여 총합..등을
--이 때 'JOBID'라고 입력하면 직무별 급여 총합.. 등을
--커서변수에 저장하여 외부로 반환하는 프로시저를 작성해 주세요
SELECT * FROM BOOKS;



--프로시져 생성 (예외처리)
CREATE OR REPLACE PROCEDURE BOOKS_INPROC
(P_BOOK_ID IN BOOKS.BOOK_ID%TYPE, R_TITLE OUT BOOKS.TITLE%TYPE)
IS
BEGIN
SELECT TITLE INTO R_TITLE FROM BOOKS WHERE BOOK_ID = P_BOOK_ID;
EXCEPTION
WHEN OTHERS THEN
R_TITLE :='해당하는 책이 존재하지 않습니다.';
END BOOKS_INPROC;
/


------------------------------------------------------------------------------

