--무결성 제약 조건의 개념과 종류
--데이터 무결성이란 데이터 베이스 내의 데이터에 대한 정확성, 일관성, 유효성,
--신뢰성을 보장하기 위해 데이터 변경 혹은 수정시 여러가지 제한을 두어 데이터의 
--정확성을 보증하는 것을 말한다.
--관계형 데이터베이스 관리 시스템에서는 데이터 베이스 설계시 무결성을 고려한 설계로 
--데이터를 보호할 필요가 있다. 제약 조건이란 바람직하지 않은 데이터가 저장되는 것을 방지
--하기위해 테이블을 생성할 때 각 칼럼에대해서 정의하는 여러가지 규칙을 말한다

--무결성 제약조건 

--NOT NULL NULL을 허용하지 않는다
--UNUQUE 중복된 값을 허용하지 않는다 . 항상 유일한 값을 갖도록 한다
--PRIMARY KEY NULL을 허용하지 않고 중복된 값을 허용하지 않는다
--NOT NULL조건과 UNIQUE조건을 결합한 형태이다
--FOREIGN KEY 참조되는 테이블의 칼럼의 값이 존재하면 허용한다
--CHECK 저장 가능한 데이터 값의 범위나 조건을 지정하여 설정한 값만을 허용한다


--NOT NULL 제약 조건
--사원 번호, 사원명, 직급, 부서번호 4개의 칼럼으로 구성된 아무런 제약 조건없이 EMP01생성

DROP TABLE EMP01;

CREATE TABLE EMP01 (
EMPNO NUMBER(4),
ENANME VARCHAR2(10),
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
);

INSERT INTO EMP01
VALUES(NULL, NULL, 'SALESMAN',30);

SELECT*FROM EMP01;

--NOT NULL 제약조건을 지정하지 않았기 때문에 NULL값이 저장된다
--사원 테이블에 사원의 정보를 저장할 때 사원번호와 사원 이름이 반드시 저장되도록 하기 위해서
--테이블을 생성할 때 사원번호와 사운이름을 NOT NULL조건으로 지정해야 한다
--NOT NULL 제한 조건은 해당 칼럼에 NULL값을 추가하거나 NULL값으로 변경하는 것을 막는다
--제약 조건은 칼럼명과 자료형을 기술한 후에 연이어서 NOT NULL을 기술하면 된다
--사원번호, 사원명, 직급, 부서번호 4개의 칼럼으로 구성하되 사원번호와 사원명에 NOT NULL조건
--을 지정하여 EMP01 테이블 생성

DROP TABLE EMP01 PURGE;

CREATE TABLE EMP01(
EMPNO NUMBER(4) NOT NULL,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
);

INSERT INTO EMP01
VALUES(NULL, NULL, 'SALESMAN',30);

--NOT NULL제약조건을 지정하였기에 사원번호와 사원명은 필수 입력란으로 NULL값은 저장되지 
--못하고 오류가 발생하므로 반드시 입력해야한다
INSERT INTO EMP01
VALUES(7499, 'ALLEN','SALESMAN',30);

SELECT*FROM EMP01;


--UNIQUE 제약 조건
--UNIQUE 제약 조건이란 특정 칼럼에 대해 자료가 중복되지 않게 하는 것이다
--즉 지정된 칼럼에는 유일한 값이 수록되게 하는 것이다
--사원번호가 사원들을 구분하기 위한 칼럼인데도 불구하고 동일한 사번을 갖게 되면 문제가 생긴다 
--이와 같은 결과를 막고자 할때는 UNIQUE KEY 제한 조건을 사용한다

--사원 테이블의 사원번호를 유일키로 지정하기 위해 제약 조건은 칼럼명과 자료형 을 기술한
--후에 연이어서 UNIQUE를 기술하면 된다

DROP TABLE EMP02;
CREATE TABLE EMP02(
EMPNO NUMBER(4) UNIQUE,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
);

INSERT INTO EMP02(EMPNO, ENAME, JOB, DEPTNO)
VALUES(7499, 'ALLEN', 'SALESMAN',30);

--동일한 사원번호 7499번으로 입력해본다

INSERT INTO EMP02(EMPNO, ENAME, JOB, DEPTNO)
VALUES (7499,'ALLEN','SALESMAN',30);

--오류 보고 -
--ORA-00001: 무결성 제약 조건(HR.SYS_C008487)에 위배됩니다

--NULL은 값에서 제외되므로 유일한 조건인지를 체크하는 값에서 제외된다

INSERT INTO EMP02 (EMPNO, ENAME, JOB, DEPTNO)
VALUES(NULL, 'JONES','MANAGER',20);

INSERT INTO EMP02(EMPNO, ENAME, JOB, DEPTNO)
VALUES (NULL, 'JONES', 'MANAGER',20);

--UNIQUE와 NULL의 관계
--UNIQUE는 NULL값을 예외로 간주한다. 만약 NULL값마저도 입력되지 않게 제한 하려면 
--테이블 생성시 EMPNO NUMBER(4) NOT NULL UNIQUE처럼 두가지 제약 조건을 기술해야한다

--데이터 딕셔너리

--데이터베이스 자원을 효율적으로 관리하기 위한 다양한 정보를 저장하는 시스템 테이블을 데이터
--딕셔너리라고 한다. 데이터 딕셔너리는 사용자가 테이블을 생성하거나 사용자를 변경하는 등의
--작업을 할 때 데이터 베이스 서버에 의해 자동으로 갱신되는 테이블로 사용자는 데 딕셔너리 
--의 내용을 직접 수정하거나 삭제할수 없다 이러한 데이터 딕셔너리를 사용자가 조회해보면
--시스템이 직접 관리하는 테이블이기에 암호같은 기호만 보여질 뿐 내용을 알수없다. 
--데이터 딕셔너리 원 테이블은 직접 조회 하기란 거의 불가능한 일이다 (오라클 데이터 베이스의
--메모리 구조와 파일에 대한 구조 정보, 각 오브젝트들이 사용하고 있는 공간들의 정보, 제약
--조건 정보, 사용자에 대한 정보, 권한이나 프로파일/ 틀에 대한 정보)

--의미있는 자료 조회가 불가능하기에 오라클은 사용자가 이해할수 있는 데이터를 산출해 줄수 있
--도록 하기 위해서 데이터 딕셔너리에서 파생한 데이터 딕셔너리 뷰를 제공한다

--데이터 딕셔너리 3종류
--DBA_XXX 데이터베이스 관리자만 접근 가능한 객체 등의 정보 조회
--ALL_XXXX 자신 계정 소유 또는 권한을 부여받은 객체등에 관한 정보 조회
--USER_XXXX 자신의 계정이 소유한 객체 등에 관한 정보 조회

SELECT TABLE_NAME FROM USER_TABLES
ORDER BY TABLE_NAME DESC;

--제약 조건 확인하기
--제약 조건의 에러 메시지에 대한 정확한 원인을 알기 위해 오라클에서 제공해 주는
--USER_CONSTRAINTS 데이터 딕셔너리가 있다 USER_CONSTRAINTS 데이터 딕셔너리는 제약조건의 
--정보를 위해서 많은 칼럼으로 구성되어 있지만 제약 조건명 (CONSTRAINT_NAME),
--제약조건유형(CONSTRAINT_TYPE), 제약조건이 속한 테이블명(TABLE_NAME)만을 알아본다

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP02';

--CONSTRAINT_TYPE은 P, R, U, C 4가지가 있다

--P PRIMARY KEY
--R FOREIGN KEY
--U UNIQUE
--C CHECK NOT NULL

--USER_CONS_COLUMNS 데이터 딕셔너리는 제약조건이 지정된 칼럼명도 저장한다
SELECT OWNER, CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME FROM USER_CONS_COLUMNS
WHERE TABLE_NAME='EMP02';

--데이터 구분을 위한 PRIMARY KEY 제약 조건
--식별 기능을 갖는 칼럼은 유일하면서도  NULL값을 허용하지 말아야 한다
--즉, UNIQUE 제약 조건과 NOT NULL 제약 조건을 모두 갖고 있어야 하는데 이러한 두가지
--제약 조건을 모두 갖는 것이 기본키 (PRIMARY KEY)제약 조건이다

--사원 테이블의 사원번호를 기본키로 지정

DROP TABLE EMP03;

CREATE TABLE EMP03(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
);

INSERT INTO EMP03
VALUES(7499, 'ALLEN','SALESMAN',30);

INSERT INTO EMP03
VALUES(7499,'JONES','MANAGER',20);
--ORA-00001: 무결성 제약 조건(HR.SYS_C008521)에 위배됩니다

--사원번호에 NULL로 지정하고 저장해도 오류가 발생한다

INSERT INTO EMP03
VALUES(NULL,'JONES','MANAGER',20);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP03';

--참조 무결성을 위한 FOREIGN KEY 제약조건
--참조의 무결성은 두 테이블 사이 (사원 테이블, 부서 테이블)의 주종관계에서 설정된다

--먼저 존재해야하는 테이블이 주체가 되는 테이블이므로 부서 테이블이 부모 테이블이 되고, 
--이를 참조하는 테이블인 사원 테이블이 자식 테이블이 된다
--소속이란 관계되는 두 테이블 간의 참조 무결성이란 개념을 포함한 외래 키 제약 조건을
-- 명시해야만 설정된다
--외래 키 제약 조건은 자식 테이블인 사원 테이블의 부서번호(DEPTNO) 칼럼에 부모 테이블인
--부서 테이블의 부서번호를 보모키로 설정하는 것이다

--부모키가 되기 위한 칼럼은 반드시 부모테이블의 기본키나 유일키로 설정되어있어야 한다


-----------------------------------------------------------------------------




CREATE TABLE DEPT01 (
DEPTNO NUMBER(2) PRIMARY KEY,
DNAME VARCHAR2(14) NOT NULL,
LOC VARCHAR2(13)
);

insert into DEPT01 (DEPTNO, DNAME, LOC) values (10, 'ACCOUNTING','NEW YORK');
insert into DEPT01 (DEPTNO, DNAME, LOC) values (20, 'RESEARCH','DALLAS');
insert into DEPT01 (DEPTNO, DNAME, LOC) values (30, 'SALES','CHICAGO');
insert into DEPT01 (DEPTNO, DNAME, LOC) values (40, 'OPERATIONS','BOSTON');

--외래 키 제약 조건에 지정하지 않은 EMP03 테이블에 부서 테이블에 존재하지 않은 50번
--부서번호를 저장해보도록 하자

INSERT INTO EMP03
VALUES(7566, 'JONES','MANAGER',50);

--외래키 제약 조건은 EMP04 테이블 생성시 칼럼명과 자료형을 기술한 후에 REFERENCES를 
--기술하면 된다. DEPTNO칼럼을 참조하게 외래키 제약조건을 설정한다

CREATE TABLE EMP04(
EMPNO NUMBER(2) PRIMARY KEY,
ENMAE VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO)
);

ALTER TABLE EMP04
MODIFY EMPNO NUMBER(4);

INSERT INTO EMP04
VALUES(7499,'ALLEN','SALESMAN',30);

INSERT INTO EMP04
VALUES(7566,'JONES','MANAGER',50);
--ORA-02291: 무결성 제약조건(HR.SYS_C008550)이 위배되었습니다- 부모 키가 없습니다
--50번이 존재하지 않기 때문에 사원 정보가 추가되지 못하고 오류가 발생

--오류메시지에 제약 조건명 SYS_C005899에 위배되었다고 나타나므로 확인하기 위해 
--USER_CONSTRANTS 데이터 딕셔너리로 살펴본다

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP04';

--CHECK 제약 조건
--CHECK 제약 조건은 입력되는 값을 체크하여 설정된 값이외의 값이 들어오면 오류 메시지와 함께
--명령이 수행되지 못하게 하는 것이다

--EMP05 사원 테이블에 GENDER(성별) 칼럼을 추가하되 GENDER칼럼에는 'M'또는 'F'의 두 값만 
--저장할 수 있는 CHECK 제약 조건을 설정한다

CREATE TABLE EMP05(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL,
GENDER VARCHAR2(1) CHECK(GENDER IN('M','F'))
);

INSERT INTO EMP05(EMPNO, ENAME, GENDER)
VALUES(7566,'JONES','M');

SELECT*FROM EMP05;

INSERT INTO EMP05(EMPNO, ENAME, GENDER) VALUES(7566,'JONES','A');
------ORA-02290: 체크 제약조건(HR.SYS_C008582)이 위배되었습니다
--SEARCH_CONDITION 칼럼값으로 제약 조건을 알아본다

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP05';

--제약 조건명 지정하기
--사용자가 의미있게 제약 조건명을 명시하여 제약 조건명만으로도 어떤 제약 조건을 위배했는지
--알수있게 지정하는 방법이다 

--[테이블명]_[칼럼명]_[제약조건유형]

CREATE TABLE EMP06(
EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL,
JOB VARCHAR2(9) CONSTRAINT EMP06_JOB_UK UNIQUE,
DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT01(DEPTNO)
);

INSERT INTO EMP06
VALUES(7499, 'ALLEN','SALESMAN',30);

SELECT*FROM EMP06;

--지정된 사용자 제약 조건명을 확인한다
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP06';

--다음은 어떤 제약조건에 위배되는지 확인해 보자

INSERT INTO EMP06 VALUES(7499,'ALLEN','SALESMAN',30);
--ORA-00001: 무결성 제약 조건(HR.EMP06_EMPNO_PK)에 위배됩니다

INSERT INTO EMP06 VALUES(7499, NULL, 'SALESMAN',50);
--SQL 오류: ORA-01400: NULL을 ("HR"."EMP06"."ENAME") 안에 삽입할 수 없습니다

INSERT INTO EMP06 VALUES(7499, 'ALLEN','SALESMAN',50);
--ORA-00001: 무결성 제약 조건(HR.EMP06_EMPNO_PK)에 위배됩니다

INSERT INTO EMP06 VALUES(7500,'ALLEN','SALESMAN',50);
--ORA-00001: 무결성 제약 조건(HR.EMP06_JOB_UK)에 위배됩니다

INSERT INTO EMP06 VALUES(7500,'ALLEN','MANAGER',50);
--ORA-02291: 무결성 제약조건(HR.EMP06_DEPTNO_FK)이 위배되었습니다- 부모 키가 없습니다

--테이블 레벨 방식으로 제약 조건 지정하기

--복합키로 기본키를 지정할 경우
--복합키 형태로 제약 조건을 지정할 경우에는 칼럼 레벨 형식으로는 불가능하고 반드시 
--테이블 레벨 방식을 사용해야한다. 테이블 레벨의 제약 조건 지정은 컬럼을 모두 정의하고 나서
--테이블 정의를 마무리 짓기 전에 따로 생성된 칼럼들에 대한 제약 조건을 한꺼번에 지정하는 
--것이다

--ALTER TABLE 제약 조건을 추가할 때 
--테이블의 정의가 완료되어서 이미 테이블의 구조가 결정된 후에 나중에 테이블에 제약 조건을
--추가하고자 할때에는 테이블 레벨 방식으로 제약 조건을 지정해야 한다

--칼럼 레벨로 제약 조건을 지정하는 방식
CREATE TABLE EMP07(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9) UNIQUE,
DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO)
);

--테이블 레벨로 제약 조건을 지정하는 방식 

CREATE TABLE EMP08(
EMPNO NUMBER(4),
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2),
PRIMARY KEY(EMPNO),
UNIQUE(JOB),
FOREIGN KEY(DEPTNO) REFERENCES DEPT01(DEPTNO)
);

--제약 조건 변경하기
--제약 조건 추가하기
--테이블 생성이 끝난후에 제약 조건을 추가하기 위해서는 ALTER TABLE로 추가해 주어야한다
--아무런 제약 조건도 지정하지 않고 EMP09 테이블을 생성한다

CREATE TABLE EMP09(
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
);

--제약조건을 확인해보자
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP09';

--EMP09 테이블의 EMPNO칼럼에 기본키를 설정하고 DEPTNO 칼럼에 외래키를 설정한다

ALTER TABLE EMP09
ADD PRIMARY KEY(EMPNO);

ALTER TABLE EMP09
ADD CONSTRAINT EMP09_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT01(DEPTNO);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP09';

--제약 조건 제거하기
--제약 조건을 제거하기 위해서는 
--DROP CONSTRAINT 다음에 제거하고자 하는 제약 조건명을 명시한다

--EMP06 제약조건 확인
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP06';
--동일한 사원 번호 7499를 추가하면 오류 발생
INSERT INTO EMP06
VALUES(7499, 'ALLEN','MANAGER',50);

--기본키의 제약조건을 제거하고자 한다면 다음과 같잉 작성하면 된다
--그리고 제약 조건 확인하는 쿼리문을 실행하면
--다음과 같은 결과를 얻을 수있다
ALTER TABLE EMP06
DROP CONSTRAINT EMP06_EMPNO_PK;

ALTER TABLE EMP06
DROP CONSTRAINT EMP06_DEPTNO_FK;

--외래키가 설정된 데이터 삭제 
--우선 예제를 실행하기 위해 2개의 테이블을 생성한다
CREATE TABLE DEPT02(
DEPTNO NUMBER(2),
DNAME VARCHAR2(14),
LOC VARCHAR2(13),
CONSTRAINT DEPT02_DEPTNO_PK PRIMARY KEY(DEPTNO)
);
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='DEPT02';
--샘플 데이터를 추가
INSERT INTO DEPT02 VALUES(10,'ACCOUNTING','NEWYORK');
INSERT INTO DEPT02 VALUES(20,'RESEARCH','DALLAS');

--사원 테이블의 부서 번호가 부서 테이블의 부서 번호를 참조할수 있도록 외래키를 설정한다
DROP TABLE EMP02;

CREATE TABLE EMP02(
EMPNO NUMBER(4),
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2),
CONSTRAINT EMP02_EMPNO_PK PRIMARY KEY(EMPNO),
CONSTRAINT EMP02_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT02(DEPTNO)
);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP02';

--샘플 데이터 추가 

INSERT INTO EMP02 VALUES(7499,'ALLEN','SALESMAN',10);
INSERT INTO EMP02 VALUES(7369,'SMITH','CLERK',20);

DELETE FROM DEPT02 WHERE DEPTNO=10;
--ORA-02292: 무결성 제약조건(HR.EMP02_DEPTNO_FK)이 위배되었습니다- 
--자식 레코드가 발견되었습니다
--자식테이블인 EMP02은 부모 테이블인 DEPT02의 기본키인 부서번호를 참조하고있어 
--삭제할수없다

--부서번호가 10번인 자료가 삭제되도록 하기 위해서는 아래와 같이 해야한다
--부서테이블 (EMP02)의 10번 부서에서 근무하는 사원을 삭제한 후 부서 테이블(DEPT02)에서
--10번부서를 삭제한다
--참조 무결성 때문에 삭제가 불가능하므로 EMP02 테이블의 외래키 제약 조건을 제거한후에 10번
--부서를 삭제한다

--ON DELETE CASCADE 와 ON DELETE SET NULL 옵셔으로 삭제가 가능하다. 제약조건 다음에 
--아래의 옵션을 명시해주면 된다

---ON DELETE CASCADE 부모 테이블의 데이터가 삭제하면 자식 테이블의 데이터도 함께 삭제된다
--ON DELETE SET NULL 부모 테이블의 데이터가 삭제되면 자식 테이블의 값을 NULL로 설정된다

CREATE TABLE TREATMENT(
T_NO NUMBER(4) NOT NULL,
T_COURSE_ABBR VARCHAR2(3) NOT NULL,
T_COURSE VARCHAR2(30) NOT NULL,
T_TEL VARCHAR2(15) NOT NULL,
CONSTRAINT TREATMENT_NO_PK PRIMARY KEY(T_NO),
CONSTRAINT TREATMENT_COURSE_ABBR_UK UNIQUE(T_COURSE_ABBR)
);
INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1001,'NS','신경외과','02-3452-1009');

INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1002,'OS','정형외과','02-3452-2009');

INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1003,'C','순환기내과','02-3452-3009');

SELECT*FROM TREATMENT;

CREATE TABLE DOCTOR(
D_NO NUMBER(4) NOT NULL,
D_NAME VARCHAR2(20) NOT NULL,
D_SSN CHAR(14) NOT NULL,
D_EMAIL VARCHAR2(80) NOT NULL,
D_MAJOR VARCHAR2(50) NOT NULL,
T_NO NUMBER(4),
CONSTRAINT DOCTOR_D_NO_PK PRIMARY KEY(D_NO)
);

ALTER TABLE DOCTOR
ADD CONSTRAINT DOCTOR_T_NO FOREIGN KEY(T_NO) REFERENCES TREATMENT(T_NO)
ON DELETE CASCADE;

INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN,D_EMAIL,D_MAJOR,T_NO)
VALUES(1, '홍길동','660606-1234561','JAVAUSER@NAVER.COM','척추신경외과','1001');

INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN,D_EMAIL,D_MAJOR,T_NO)
VALUES(2, '이재환','690724-1674536','JAEHWAN@NAVER.COM','뇌졸중,뇌혈관외과','1003');

INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN,D_EMAIL,D_MAJOR,T_NO)
VALUES(3, '양익환','700129-1328962','SHEEP1209@NAVER.COM','인공관절, 관절염','1002');

INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN,D_EMAIL,D_MAJOR,T_NO)
VALUES(4, '김승현','720901-1348940','SEUNGHYEON@NAVER.COM','종양외과,외상전문','1002');

SELECT*FROM TREATMENT;
SELECT*FROM DOCTOR;

ROLLBACK;
ALTER TABLE DOCTOR 
DROP CONSTRAINT DOCTOR_T_NO;

ALTER TABLE DOCTOR
ADD CONSTRAINT DOCTOR_T_NO FOREIGN KEY(T_NO) REFERENCES TREATMENT(T_NO)
ON DELETE SET NULL;

DELETE FROM TREATMENT WHERE T_NO = 1002;

SELECT*FROM TREATMENT;
SELECT*FROM DOCTOR;
