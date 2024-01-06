
--PL/SQL
--SQL문장에서 변수정의, 조건처리, 반복처리 등을 지원한다
--DECLARE
--선언부(DECLARE SECTION)
--변수나 상수 선언
--BEGIN
--실행부(EXECUTABLE SECTION)
--SQL 문
--제어문, 반복문
--커서
--EXCEPTION
--예외 처리부(EXCEPTION SECTION)
--END;
--/

--프로그램의 모듈화
--특정 프로그램을 PROCEDURE, FUNCTION, PACKAGE등의 프로그램으로 만들어 여러 응용프로그램
--을 들 시에 공통으롤 이용 및 관리 할 수 있다
--관리의 용이
--네트워크 입출력 감소
--PL/SQL문을 사용하게 되면 모든 SQL문 및 논리적 프로그램을 프로시저등으로 작성하며 클라이언는
--네트워크 연결을 통한 SQL문 및 프로그램언어를 보내는 것이 아니라 프로시저등을 실행하는
--구문만 데이터 베이스에 보낼수 있어 네트워크 입출력을 현격하게 줄일 수 있다

--PL/SQL 블록내에서는 한 문장이 종료할때마다 세미콜론을 사용하낟
--END뒤에 ;을 사용하여 하나의 블록이 끝났다는 것을 명시한다
--DELCLARE나 BEGIN이라는 키워드로 PL/SQL 블록이 시작하는 것을 알수있다
--단일 행 주석은 - 이고 여러행 주석/**/이다
--PL/SQL 블록은 행에 /가있으면 종료된다

--모든 문장의 종결 기호는 세미콜론으로 명시해야한다 대입연산자로는 :=을 사용한다
--대입 연산자는 변수의 선언시 및 변수의 대입에 이용된다
--SELECT문에 의해 추출된는 DATA는 INTO절의 변수에 저장해서 처리한다

BEGIN
DBMS_OUTPUT.PUT_LINE('HELLO WORLD!');
END;
/

--IDENTIFIER 변수이름
--CONSTANT 변수의 값을 변경할수 없도록 제약한다
--DATATYPE 자료형 (데이터 타입)을 기술한다
--자료형(데이터 타입)을 기술한다
--변수 데이터 타입 : SQL타입과 PL/SQL타입
--PL/SQL데이터 타입 : BOOLEAN, BINARY_INTRGER
--NOT NULL 값을 반드시 포함하도록 하기 위해 변수를 제약한다
--EXPRESSION LITERAL 다른 변수, 연산자나 함수를 포함하는 표현식

--VEMPNO NUMBER(4);
--PL/SQL에서 변수를 선언할때 사용되는 자료형은 SQL에서 사용하던 자료형과 거의 유사하다
--숫자를 저장하려면  NUMBER를 사용하고 문자를 저장하려면 VARCHAR2를 사용해서 선언한다
--상수는 다음과 같이 선언된다. 변수와는 달리 한번 값을 할당하면 변하지 않는다

--상수명 CONSTANT 데이터 타입 :=상수값;

--변수의 값 대입
--변수의 값을 지정하거나 재지정하기 위해 PL/SQL의 지정 문자를사용한다
--대입(지정)연산자(:=)는 좌측에 존재하는 변수에 우측 값을 대입한다는의미이다
--IDENTIFIER := EXPRESSION;
DECLARE
VAL_NUM NUMBER; --선언
BEGIN
VAL_NUM := 100;
DBMS_OUTPUT.PUT_LINE(VAL_NUM);
END;
/

DECLARE
NUM NUMBER :=24*60*60;--선언
BEGIN
DBMS_OUTPUT.PUT_LINE('NUM='||TO_CHAR(NUM));
END;
/

DECLARE
VEMPLOYEE_ID NUMBER(6);--선언
VFIRST_NAME VARCHAR2(20) --선언
BEGIN
VEMPLOYEE_ID :=105;
VFIRST_NAME:='David';

DBMS_OUTPUT.PUT_LINE('사번 / 이름');
DBMS_OUTPUT.PUT_LINE('------------');
DBMS_OUTPUT.PUT_LINE(VEMPLOYEE_ID||'/'||VFIRST_NAME);
END;
/

--스칼라 변수/레퍼런스 변수
--PL/SQL에서 변수를 선언하기 위해 사용할수 있는 데이터형은 크게 스칼라와 레퍼런스로 나눈다

--스칼라
--SQL에서의 자료형 지정과 거의 동일하다

--VEMPLOYEE_ID NUMBER(6);
--VFIRST_NAME VARCHAR2(20);

--레퍼런스 : %TYPE 속성과 %ROWTYPE속성 사용한다
--이전에 선언된 다른 변수 또는 데이터 베이스의 칼럼에 맞추어 변수를 선언하기 위해 
--%TYPE속성을 사용한다

--VEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID5TYPE;
--VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;

--%TYPE 속성을 사용하여 선언한 VEMPLOYEE_ID변수는 EMPLOYEES 테이블의 EMPLOYEE_ID칼럼의 
--자료형과 크기를 그대로 참조해서 정의한다
--%ROWTYPE은 로우 단위로 참조한다
--VEMPLOYEES EMPLOYEES%ROWTYPE;

--%ROWTYPE을 사용시 장점은 특정 테이블의 칼럼 개수와 데이터 형싱을 모르더라도 지정할수있다
--SELECT 문장으로 로우를 검색할 때 유리하다

--PL/SQL에서 SQL문장
--PL/SQL의 SELECT문은 INTO절이 필요한데, INTO절에는 데이터를 저장할 변수를 기술한다
--SELECT절에있는 칼럼은 INTO절에 있는 변수와 1대1대응을 하기에 개수와 데이터의 형,
--길이가 일치하여야한다

--SELECT_LIST 열의 목록이며 행 함수, 그룹 함수, 표현식을 기술할수 있다
--VARIABLE_NAME 읽어들인 값을 저장하기 위한 스칼라 변수

--RECORD_NAME 읽어들인 값을 저장하기 위한 PL/SQL RECORD 변수
--CONDITION PL/SQL변수와 상수를 포함하여 열명, 표현식, 상수, 비교 연산자로 구성되며 오직
--하나의 값을 RETURN할수있는 조건이어야 한다

--조회된 칼럼의 결과를 변수에 대입시 INTO절을 사용하면 된다
--SELECT EMPLOYEE_ID, FIRST_NAME INTO VEMPLOYEE_ID, VFIRST_NAME FROM EMPLOYEES
--WHERE FIRST_NAME = 'David';

--VEMPLOYEE_ID, VFIRST_NAME 변수는 칼럼(EMPLOYEE_ID, FIRST_NAME)과 동일한 데이터 형을
--갖도록 하기 위해서 %TYPE속성을 사용한다. INTO절의 변수는 SELECT에서 기술한 칼럼의 
--데이터 형뿐만 아니라 칼럼의수와도 일치해야 한다

DECLARE 
--%TYPE 속성으롤 칼럼 단위로 데이터를 저장할수있는 레퍼런스 변수선언
VEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN 
DBMS_OUTPUT.PUT_LINE('사번 /이름');
DBMS_OUTPUT.PUT_LINE('---------');
--SELECT 문을 수행한 결과 값이 INTO 뒤에 기술한 변수에 저장된다
SELECT EMPLOYEE_ID, FIRST_NAME INTO VEMPLOYEE_ID, VFIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME = 'Susan';

--레퍼런스 변수에 저장된 값을 출력한다
DBMS_OUTPUT.PUT_LINE(VEMPLOYEE_ID||'/'||VFIRST_NAME);
END;
/

--전체 레코드를 참조하기 위해서는 %ROWTYPE으로 선언하면 된다

DECLARE
--레코드로 변수 선언
VEMPLOYEES EMPLOYEES%ROWTYPE;
BEGIN
--JONES 사원의 정보를 레코드 변수에 저장
SELECT *
INTO VEMPLOYEES
FROM EMPLOYEES
WHERE FIRST_NAME = 'Lisa';

--레코드 변수에 저장된 사원정보를 출력
DBMS_OUTPUT.PUT_LINE('사원번호 :' || TO_CHAR(VEMPLOYEES.EMPLOYEE_ID));
DBMS_OUTPUT.PUT_LINE('이름  :' || VEMPLOYEES.FIRST_NAME);
DBMS_OUTPUT.PUT_LINE('급여 :'|| VEMPLOYEES.SALARY);
DBMS_OUTPUT.PUT_LINE('입사일자 :'|| TO_CHAR(VEMPLOYEES.HIRE_DATE,'YYYY-MM-DD'));
END;
/

--EMPLOYEES 테이블에 등록된 총사원의 수와 급여의 합, 급여의 평균을 변수에 대입하여 출력하여 보자

DECLARE
V_TOTAL_EMPLOYEE NUMBER;
V_TOTAL_SALARY NUMBER;
V_AVG_SALARY NUMBER;

BEGIN

SELECT COUNT(*) INTO V_TOTAL_EMPLOYEE
FROM EMPLOYEES;

SELECT SUM(SALARY) INTO V_TOTAL_SALARY
FROM EMPLOYEES;

SELECT AVG(SALARY) INTO V_AVG_SALARY
FROM EMPLOYEES;

DBMS_OUTPUT.PUT_LINE('총 사원수' || V_TOTAL_EMPLOYEE);
DBMS_OUTPUT.PUT_LINE('총 급여' || V_TOTAL_SALARY);
DBMS_OUTPUT.PUT_LINE('평균 급여'||V_AVG_SALARY);
END;
/
--JACK 사원의 직무, 급여, 입사일자, 부서명을 변수에 대입하여 출력하여 보자
DECLARE
V_JOB_ID EMPLOYEES.JOB_ID%TYPE;
V_SALARY EMPLOYEES.SALARY%TYPE;
V_HIRE_DATE EMPLOYEES.HIRE_DATE%TYPE;
V_DEPARTMENT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;

BEGIN
SELECT JOB_ID, SALARY,HIRE_DATE  
INTO V_JOB_ID ,V_SALARY,V_HIRE_DATE
FROM EMPLOYEES
WHERE FIRST_NAME ='Jack';

SELECT D.DEPARTMENT_NAME INTO V_DEPARTMENT_NAME
FROM DEPARTMENTS D JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.FIRST_NAME ='Jack';

DBMS_OUTPUT.PUT_LINE(V_JOB_ID);
DBMS_OUTPUT.PUT_LINE(V_SALARY);
DBMS_OUTPUT.PUT_LINE(V_HIRE_DATE);
DBMS_OUTPUT.PUT_LINE(V_DEPARTMENT_NAME);
END;
/

CREATE TABLE EMP10
AS SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEES;
--사원테이블에서 사원번호가 제일 큰 사원을 찾아낸뒤 이번호 +3번으로 아래의 사원을 
--사원테이블에 신규 입력하는 PL/SQL을 만들어보자 
DECLARE 
V_MAX_EMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
V_NEW_EMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;

BEGIN
SELECT MAX(EMPLOYEE_ID) INTO V_MAX_EMPLOYEE_ID
FROM EMPLOYEES;

V_NEW_EMPLOYEE_ID := V_MAX_EMPLOYEE_ID+5;

DBMS_OUTPUT.PUT_LINE('직번'|| V_NEW_EMPLOYEE_ID);
END;
/

--제어문
--PL/SQL은 여러가지 제어구조를 이용하여 문장들의 논리적 흐름을 변경할수 있다
--조건에 의해 분기하는 선택문과 반복된 문장을 한번 기술하고도 여러번 수행하도록하는
--반복문이 있다

--IF~THEN~END IF
--급여를 구하는 예제를 작성한다



