--SUM , AVG, MIN, MAX, COUNT 그룹함수를 학습한다
--칼럼의 값 별로 그룹 함수의 결과 값을 구하는 GROUP BY 절을 학습한다
 --그룹의 결과를 제한 할때는 HAVING절을 학습한다
 
 --직원의 총 급여 구하기 
 SELECT SUM(SALARY)
 FROM EMPLOYEES;
 SELECT TO_CHAR(SUM(SALARY), '$999,999') AS TOTAL
 FROM EMPLOYEES;
 
 --직원의 평균 급여 구하기 (AVG함수)
 SELECT AVG(SALARY)
 FROM EMPLOYEES;
 
 SELECT ROUND(AVG(SALARY),1)
 FROM EMPLOYEES;
 
 --최근에 입사한 사원과 가장 오래전에 입사한 직원의 입사일 출력하기(MAX/MIN 함수)
 SELECT TO_CHAR(MAX(HIRE_DATE),'YYYY-MM-DD'), TO_CHAR(MIN(HIRE_DATE),'YYYY-MM-DD')
 FROM EMPLOYEES;
 
 --NULL을 저장한 컬럼과 연산한 결과는 NULL이다 그러나 그룹함수는 다른 연산자와는 달리, 
 --해당 컬럼값이 NULL인 것을 제외하고 계산하기 때문에 결과는 NULL로 반환하지 않는다. 
 --그래서 로우(레코드)개수 구하는 COUNT함수는 NULL값에 대해서는 세지 않는다
 
 --전체 사원의 수와 커미션을받는 사원의 수
 
SELECT COUNT(*), COUNT(COMMISSION_PCT)
FROM EMPLOYEES;

--JOB의 종류가 몇개인지 즉, 중복되지 않은 직업의 개수를 구해보자 
SELECT FIRST_NAME, MIN(SALARY) 
FROM EMPLOYEES;
-->SQL 오류: ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
--에러가 발생하는 이유는 위의 그림처럼 그룹함수의 결과값은 하나인데 비해 그룹함수를 적용하지
--않은 단순 칼럼의 로우 개수는 107개로 각각 산출되는 로우가 달라 둘을 매치시킬수가 없기 
--때문이다

--GROUP BY 절을 사용해 특정 조건으로 세부적인 그룹화 하기 
--특정 그룹으로 묶어 데이터 집계 시 사용
--WHERE 와 ORDER BY 절 사이에 위치
--집계(그룹)함수와 함께 사용
--SELECT 리스트에서 집계 (그룹)함수를 제외한 모든 컬럼과 표현힉은 GROUP BY절에 명시해야 함

--사원들을 부서 번호를 기준으로 

SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

--부서별 최대 급여와 최소 급여 구하기
SELECT DEPARTMENT_ID, MAX(SALARY)"최대 급여",MIN(SALARY)"최소 급여"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--소속 부서별 급여의 합과 급여의 평균 구하기
SELECT DEPARTMENT_ID, SUM(SALARY), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

--부서별로 직원의 수와 커미션을 받는 직원의 수를 카운트 해보자

--HAVING 조건 
--SELECT 절에 조건을 사용하여 결과를 제한 할때는 WHERE 절을 사용하지만, 그룹의 결과를
--제한할 때는 HAVING절을 사용한다
--GROUP BY 절 다음에 위치해 GROUP BY 한 결과를 대상으로 다시 필터를 거는 역할
--HAVING 다음에는 SELECT리스트에 사용했던 집계함수를 이용한 조건을 명시

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


--각 기준별 소계를 요약해서 보여주는 ROLLUP함수 (자동으로 소계와합계를 구해주는 함수)
--ROLLUP()에 지정된 컬럼들은 소계(전체가 아닌 어느 한부분만을 셈한 합계)의 기준이 되는 
-- 컬럼들이다

--인자로 전달받은 그룹 중 가장 먼저 지정한 그룹별로 추가적 집계 결과 반환 
--부서별 같은 직무를 담당하는 사원의 급여의 합과 사원수, 부서별 급여의 합과 사원수, 전체
--사원수, 전체 사원의 급여의 합과 사원수를 구하고자 한다. 이때 내용을 정리하면 
--부서내에서 같은 업무(직무)를 담당하는 사워원의 급여의 합과 사원수
--부서별 급여의 합과 사원수 

--부서내 같은 직무를 담당하는 사원의 급여의 합 및 사원수 
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*),SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;

--부서별 급여의 합과 사원수
SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY) --부서별 급여의 합과 사원수
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--전체 사원의 급여의 합과 사원수
SELECT NULL DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY) -- 전체 사원의 급여의 합과 사원수
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, JOB_ID;

--집합 연산자인 UNION ALL로 작성한 쿼리문입니다
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


--위에꺼는 계속 오류남 위와 동일한 결과를 얻고자 할때 ROLLUP(컬럼)함수를 사용하면된다
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;

SELECT JOB_ID, DEPARTMENT_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP(JOB_ID, DEPARTMENT_ID)
ORDER BY JOB_ID;

--CUBE 소계와 전체 합계까지 출력하는 함수
--CUBE 는 명시한 표현식 개수에 따라 가능한 모든 조합별로 집계한 결과를 반환한다

SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY CUBE(DEPARTMENT_ID, JOB_ID);

--집합 연산자
--데이터 집합이 대상이므로 집합 연산자(UNION, UNION ALL, INTERSECT, MINUS)를 
--사용할때 데이터 집합의 수는 한개 이상을 사용할수있다. 즉 여러개의 SELECT문을 
--연결해 또 다른 하나의 쿼리를 만드는 역할을 하는 것이 집합 연산자이다

CREATE TABLE exp_goods_asia ( -- 한국과 일본의 10대 수출품 테이블
COUNTRY VARCHAR2(10), --나라명
SEQ NUMBER, -- 번호
GOODS VARCHAR2(80) --상품명
);
INSERT INTO exp_goods_asia VALUES ('한국', 1, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('한국', 2, '자동차');
INSERT INTO exp_goods_asia VALUES ('한국', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('한국', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('한국', 5,  'LCD');
INSERT INTO exp_goods_asia VALUES ('한국', 6,  '자동차부품');
INSERT INTO exp_goods_asia VALUES ('한국', 7,  '휴대전화');
INSERT INTO exp_goods_asia VALUES ('한국', 8,  '환식탄화수소');
INSERT INTO exp_goods_asia VALUES ('한국', 9,  '무선송신기 디스플레이 부속품');
INSERT INTO exp_goods_asia VALUES ('한국', 10,  '철 또는 비합금강');
INSERT INTO exp_goods_asia VALUES ('일본', 1, '자동차');
INSERT INTO exp_goods_asia VALUES ('일본', 2, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('일본', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('일본', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods_asia VALUES ('일본', 6, '화물차');
INSERT INTO exp_goods_asia VALUES ('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('일본', 8, '건설기계');
INSERT INTO exp_goods_asia VALUES ('일본', 9, '다이오드, 트랜지스터');
INSERT INTO exp_goods_asia VALUES ('일본', 10, '기계류');

SELECT*FROM EXP_GOODS_ASIA;

--UNION ALL 각 쿼리의 결과 집합의 합 집합이다 . 중복된 행도 그대로 출력된다
--UNION 각 쿼리의 결과 집합의 합집합이다. 중복된 행은 한줄로 출력된다
--INTERSECT 각 쿼리의 결과 집합의 교집합이다. 중복된 행은 한줄로 출력된다
--MINUS 앞에 있는 쿼리의 결과 집합에서 뒤에 있는쿼리의 결과 집합을 뺀 차집합이다
--중복된 행은 한줄로 출력된다

SELECT* 
FROM EXP_GOODS_ASIA
WHERE COUNTRY='한국';

SELECT*
FROM EXP_GOODS_ASIA
WHERE COUNTRY='일본';

SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='한국'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='일본';

--HR 스키마에 있는 JOB_HISTORY 테이블은 사원들의 업무 변경이력을 나타내는 테이블이다
--이 정보를 이용하여 모든 사원의 현재 및 이전의 업무 이력 정보를 출력하고자 한다
--중복된 사원정보가 있을 경우 한번만 표시하여 출력하시오

SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY;


--위 결과를 이용하여 출력된 176번 사원의 업무 이력의 변경 날짜 이력을 조회하시오
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
WHERE COUNTRY='한국'
UNION ALL
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='일본';

--INTERSECT
--교집합

SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='한국'
INTERSECT
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='일본';

--MINUS 차집합
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='한국'
MINUS
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='일본'


--집합 연산자의 제한사항
--집합 연산자로 연결되는 각 SELECT문의 SELECT리스트 개수와 데이터타입은 일치해야한다

--ORA-01789 : 질의 블록은 부정확한 수의 결과 열을 가지고 있습니다
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='한국'
UNION
SELECT SEQ, GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='일본';

--ORA-01790 : 대응하는 식과 같은 데이터 유형이어야 합니다
SELECT SEQ
FROM EXP_GOODS_ASIA
WHERE COUNTRY='한국'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='일본';


--집합연산자로  SELECT 문을 연결할 때 ORDER BY절은 맨 마지막 문장에서만 사용할수있다
--ORA-0093SQL명령어가 올바르게 종료되지 않았다
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='한국'
ORDER BY GOODS
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='일본';

SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='한국'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY='일본'
ORDER BY GOODS;
