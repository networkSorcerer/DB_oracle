--���Ἲ ���� ������ ����� ����
--������ ���Ἲ�̶� ������ ���̽� ���� �����Ϳ� ���� ��Ȯ��, �ϰ���, ��ȿ��,
--�ŷڼ��� �����ϱ� ���� ������ ���� Ȥ�� ������ �������� ������ �ξ� �������� 
--��Ȯ���� �����ϴ� ���� ���Ѵ�.
--������ �����ͺ��̽� ���� �ý��ۿ����� ������ ���̽� ����� ���Ἲ�� ����� ����� 
--�����͸� ��ȣ�� �ʿ䰡 �ִ�. ���� �����̶� �ٶ������� ���� �����Ͱ� ����Ǵ� ���� ����
--�ϱ����� ���̺��� ������ �� �� Į�������ؼ� �����ϴ� �������� ��Ģ�� ���Ѵ�

--���Ἲ �������� 

--NOT NULL NULL�� ������� �ʴ´�
--UNUQUE �ߺ��� ���� ������� �ʴ´� . �׻� ������ ���� ������ �Ѵ�
--PRIMARY KEY NULL�� ������� �ʰ� �ߺ��� ���� ������� �ʴ´�
--NOT NULL���ǰ� UNIQUE������ ������ �����̴�
--FOREIGN KEY �����Ǵ� ���̺��� Į���� ���� �����ϸ� ����Ѵ�
--CHECK ���� ������ ������ ���� ������ ������ �����Ͽ� ������ ������ ����Ѵ�


--NOT NULL ���� ����
--��� ��ȣ, �����, ����, �μ���ȣ 4���� Į������ ������ �ƹ��� ���� ���Ǿ��� EMP01����

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

--NOT NULL ���������� �������� �ʾұ� ������ NULL���� ����ȴ�
--��� ���̺� ����� ������ ������ �� �����ȣ�� ��� �̸��� �ݵ�� ����ǵ��� �ϱ� ���ؼ�
--���̺��� ������ �� �����ȣ�� ����̸��� NOT NULL�������� �����ؾ� �Ѵ�
--NOT NULL ���� ������ �ش� Į���� NULL���� �߰��ϰų� NULL������ �����ϴ� ���� ���´�
--���� ������ Į����� �ڷ����� ����� �Ŀ� ���̾ NOT NULL�� ����ϸ� �ȴ�
--�����ȣ, �����, ����, �μ���ȣ 4���� Į������ �����ϵ� �����ȣ�� ����� NOT NULL����
--�� �����Ͽ� EMP01 ���̺� ����

DROP TABLE EMP01 PURGE;

CREATE TABLE EMP01(
EMPNO NUMBER(4) NOT NULL,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
);

INSERT INTO EMP01
VALUES(NULL, NULL, 'SALESMAN',30);

--NOT NULL���������� �����Ͽ��⿡ �����ȣ�� ������� �ʼ� �Է¶����� NULL���� ������� 
--���ϰ� ������ �߻��ϹǷ� �ݵ�� �Է��ؾ��Ѵ�
INSERT INTO EMP01
VALUES(7499, 'ALLEN','SALESMAN',30);

SELECT*FROM EMP01;


--UNIQUE ���� ����
--UNIQUE ���� �����̶� Ư�� Į���� ���� �ڷᰡ �ߺ����� �ʰ� �ϴ� ���̴�
--�� ������ Į������ ������ ���� ���ϵǰ� �ϴ� ���̴�
--�����ȣ�� ������� �����ϱ� ���� Į���ε��� �ұ��ϰ� ������ ����� ���� �Ǹ� ������ ����� 
--�̿� ���� ����� ������ �Ҷ��� UNIQUE KEY ���� ������ ����Ѵ�

--��� ���̺��� �����ȣ�� ����Ű�� �����ϱ� ���� ���� ������ Į����� �ڷ��� �� �����
--�Ŀ� ���̾ UNIQUE�� ����ϸ� �ȴ�

DROP TABLE EMP02;
CREATE TABLE EMP02(
EMPNO NUMBER(4) UNIQUE,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
);

INSERT INTO EMP02(EMPNO, ENAME, JOB, DEPTNO)
VALUES(7499, 'ALLEN', 'SALESMAN',30);

--������ �����ȣ 7499������ �Է��غ���

INSERT INTO EMP02(EMPNO, ENAME, JOB, DEPTNO)
VALUES (7499,'ALLEN','SALESMAN',30);

--���� ���� -
--ORA-00001: ���Ἲ ���� ����(HR.SYS_C008487)�� ����˴ϴ�

--NULL�� ������ ���ܵǹǷ� ������ ���������� üũ�ϴ� ������ ���ܵȴ�

INSERT INTO EMP02 (EMPNO, ENAME, JOB, DEPTNO)
VALUES(NULL, 'JONES','MANAGER',20);

INSERT INTO EMP02(EMPNO, ENAME, JOB, DEPTNO)
VALUES (NULL, 'JONES', 'MANAGER',20);

--UNIQUE�� NULL�� ����
--UNIQUE�� NULL���� ���ܷ� �����Ѵ�. ���� NULL�������� �Էµ��� �ʰ� ���� �Ϸ��� 
--���̺� ������ EMPNO NUMBER(4) NOT NULL UNIQUEó�� �ΰ��� ���� ������ ����ؾ��Ѵ�

--������ ��ųʸ�

--�����ͺ��̽� �ڿ��� ȿ�������� �����ϱ� ���� �پ��� ������ �����ϴ� �ý��� ���̺��� ������
--��ųʸ���� �Ѵ�. ������ ��ųʸ��� ����ڰ� ���̺��� �����ϰų� ����ڸ� �����ϴ� ����
--�۾��� �� �� ������ ���̽� ������ ���� �ڵ����� ���ŵǴ� ���̺�� ����ڴ� ���� ��ųʸ� 
--�� ������ ���� �����ϰų� �����Ҽ� ���� �̷��� ������ ��ųʸ��� ����ڰ� ��ȸ�غ���
--�ý����� ���� �����ϴ� ���̺��̱⿡ ��ȣ���� ��ȣ�� ������ �� ������ �˼�����. 
--������ ��ųʸ� �� ���̺��� ���� ��ȸ �ϱ�� ���� �Ұ����� ���̴� (����Ŭ ������ ���̽���
--�޸� ������ ���Ͽ� ���� ���� ����, �� ������Ʈ���� ����ϰ� �ִ� �������� ����, ����
--���� ����, ����ڿ� ���� ����, �����̳� ��������/ Ʋ�� ���� ����)

--�ǹ��ִ� �ڷ� ��ȸ�� �Ұ����ϱ⿡ ����Ŭ�� ����ڰ� �����Ҽ� �ִ� �����͸� ������ �ټ� ��
--���� �ϱ� ���ؼ� ������ ��ųʸ����� �Ļ��� ������ ��ųʸ� �並 �����Ѵ�

--������ ��ųʸ� 3����
--DBA_XXX �����ͺ��̽� �����ڸ� ���� ������ ��ü ���� ���� ��ȸ
--ALL_XXXX �ڽ� ���� ���� �Ǵ� ������ �ο����� ��ü� ���� ���� ��ȸ
--USER_XXXX �ڽ��� ������ ������ ��ü � ���� ���� ��ȸ

SELECT TABLE_NAME FROM USER_TABLES
ORDER BY TABLE_NAME DESC;

--���� ���� Ȯ���ϱ�
--���� ������ ���� �޽����� ���� ��Ȯ�� ������ �˱� ���� ����Ŭ���� ������ �ִ�
--USER_CONSTRAINTS ������ ��ųʸ��� �ִ� USER_CONSTRAINTS ������ ��ųʸ��� ���������� 
--������ ���ؼ� ���� Į������ �����Ǿ� ������ ���� ���Ǹ� (CONSTRAINT_NAME),
--������������(CONSTRAINT_TYPE), ���������� ���� ���̺��(TABLE_NAME)���� �˾ƺ���

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP02';

--CONSTRAINT_TYPE�� P, R, U, C 4������ �ִ�

--P PRIMARY KEY
--R FOREIGN KEY
--U UNIQUE
--C CHECK NOT NULL

--USER_CONS_COLUMNS ������ ��ųʸ��� ���������� ������ Į���� �����Ѵ�
SELECT OWNER, CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME FROM USER_CONS_COLUMNS
WHERE TABLE_NAME='EMP02';

--������ ������ ���� PRIMARY KEY ���� ����
--�ĺ� ����� ���� Į���� �����ϸ鼭��  NULL���� ������� ���ƾ� �Ѵ�
--��, UNIQUE ���� ���ǰ� NOT NULL ���� ������ ��� ���� �־�� �ϴµ� �̷��� �ΰ���
--���� ������ ��� ���� ���� �⺻Ű (PRIMARY KEY)���� �����̴�

--��� ���̺��� �����ȣ�� �⺻Ű�� ����

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
--ORA-00001: ���Ἲ ���� ����(HR.SYS_C008521)�� ����˴ϴ�

--�����ȣ�� NULL�� �����ϰ� �����ص� ������ �߻��Ѵ�

INSERT INTO EMP03
VALUES(NULL,'JONES','MANAGER',20);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP03';

--���� ���Ἲ�� ���� FOREIGN KEY ��������
--������ ���Ἲ�� �� ���̺� ���� (��� ���̺�, �μ� ���̺�)�� �������迡�� �����ȴ�

--���� �����ؾ��ϴ� ���̺��� ��ü�� �Ǵ� ���̺��̹Ƿ� �μ� ���̺��� �θ� ���̺��� �ǰ�, 
--�̸� �����ϴ� ���̺��� ��� ���̺��� �ڽ� ���̺��� �ȴ�
--�Ҽ��̶� ����Ǵ� �� ���̺� ���� ���� ���Ἲ�̶� ������ ������ �ܷ� Ű ���� ������
-- ����ؾ߸� �����ȴ�
--�ܷ� Ű ���� ������ �ڽ� ���̺��� ��� ���̺��� �μ���ȣ(DEPTNO) Į���� �θ� ���̺���
--�μ� ���̺��� �μ���ȣ�� ����Ű�� �����ϴ� ���̴�

--�θ�Ű�� �Ǳ� ���� Į���� �ݵ�� �θ����̺��� �⺻Ű�� ����Ű�� �����Ǿ��־�� �Ѵ�


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

--�ܷ� Ű ���� ���ǿ� �������� ���� EMP03 ���̺� �μ� ���̺� �������� ���� 50��
--�μ���ȣ�� �����غ����� ����

INSERT INTO EMP03
VALUES(7566, 'JONES','MANAGER',50);

--�ܷ�Ű ���� ������ EMP04 ���̺� ������ Į����� �ڷ����� ����� �Ŀ� REFERENCES�� 
--����ϸ� �ȴ�. DEPTNOĮ���� �����ϰ� �ܷ�Ű ���������� �����Ѵ�

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
--ORA-02291: ���Ἲ ��������(HR.SYS_C008550)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
--50���� �������� �ʱ� ������ ��� ������ �߰����� ���ϰ� ������ �߻�

--�����޽����� ���� ���Ǹ� SYS_C005899�� ����Ǿ��ٰ� ��Ÿ���Ƿ� Ȯ���ϱ� ���� 
--USER_CONSTRANTS ������ ��ųʸ��� ���캻��

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP04';

--CHECK ���� ����
--CHECK ���� ������ �ԷµǴ� ���� üũ�Ͽ� ������ ���̿��� ���� ������ ���� �޽����� �Բ�
--����� ������� ���ϰ� �ϴ� ���̴�

--EMP05 ��� ���̺� GENDER(����) Į���� �߰��ϵ� GENDERĮ������ 'M'�Ǵ� 'F'�� �� ���� 
--������ �� �ִ� CHECK ���� ������ �����Ѵ�

CREATE TABLE EMP05(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL,
GENDER VARCHAR2(1) CHECK(GENDER IN('M','F'))
);

INSERT INTO EMP05(EMPNO, ENAME, GENDER)
VALUES(7566,'JONES','M');

SELECT*FROM EMP05;

INSERT INTO EMP05(EMPNO, ENAME, GENDER) VALUES(7566,'JONES','A');
------ORA-02290: üũ ��������(HR.SYS_C008582)�� ����Ǿ����ϴ�
--SEARCH_CONDITION Į�������� ���� ������ �˾ƺ���

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP05';

--���� ���Ǹ� �����ϱ�
--����ڰ� �ǹ��ְ� ���� ���Ǹ��� ����Ͽ� ���� ���Ǹ����ε� � ���� ������ �����ߴ���
--�˼��ְ� �����ϴ� ����̴� 

--[���̺��]_[Į����]_[������������]

CREATE TABLE EMP06(
EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL,
JOB VARCHAR2(9) CONSTRAINT EMP06_JOB_UK UNIQUE,
DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT01(DEPTNO)
);

INSERT INTO EMP06
VALUES(7499, 'ALLEN','SALESMAN',30);

SELECT*FROM EMP06;

--������ ����� ���� ���Ǹ��� Ȯ���Ѵ�
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP06';

--������ � �������ǿ� ����Ǵ��� Ȯ���� ����

INSERT INTO EMP06 VALUES(7499,'ALLEN','SALESMAN',30);
--ORA-00001: ���Ἲ ���� ����(HR.EMP06_EMPNO_PK)�� ����˴ϴ�

INSERT INTO EMP06 VALUES(7499, NULL, 'SALESMAN',50);
--SQL ����: ORA-01400: NULL�� ("HR"."EMP06"."ENAME") �ȿ� ������ �� �����ϴ�

INSERT INTO EMP06 VALUES(7499, 'ALLEN','SALESMAN',50);
--ORA-00001: ���Ἲ ���� ����(HR.EMP06_EMPNO_PK)�� ����˴ϴ�

INSERT INTO EMP06 VALUES(7500,'ALLEN','SALESMAN',50);
--ORA-00001: ���Ἲ ���� ����(HR.EMP06_JOB_UK)�� ����˴ϴ�

INSERT INTO EMP06 VALUES(7500,'ALLEN','MANAGER',50);
--ORA-02291: ���Ἲ ��������(HR.EMP06_DEPTNO_FK)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�

--���̺� ���� ������� ���� ���� �����ϱ�

--����Ű�� �⺻Ű�� ������ ���
--����Ű ���·� ���� ������ ������ ��쿡�� Į�� ���� �������δ� �Ұ����ϰ� �ݵ�� 
--���̺� ���� ����� ����ؾ��Ѵ�. ���̺� ������ ���� ���� ������ �÷��� ��� �����ϰ� ����
--���̺� ���Ǹ� ������ ���� ���� ���� ������ Į���鿡 ���� ���� ������ �Ѳ����� �����ϴ� 
--���̴�

--ALTER TABLE ���� ������ �߰��� �� 
--���̺��� ���ǰ� �Ϸ�Ǿ �̹� ���̺��� ������ ������ �Ŀ� ���߿� ���̺� ���� ������
--�߰��ϰ��� �Ҷ����� ���̺� ���� ������� ���� ������ �����ؾ� �Ѵ�

--Į�� ������ ���� ������ �����ϴ� ���
CREATE TABLE EMP07(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9) UNIQUE,
DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO)
);

--���̺� ������ ���� ������ �����ϴ� ��� 

CREATE TABLE EMP08(
EMPNO NUMBER(4),
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2),
PRIMARY KEY(EMPNO),
UNIQUE(JOB),
FOREIGN KEY(DEPTNO) REFERENCES DEPT01(DEPTNO)
);

--���� ���� �����ϱ�
--���� ���� �߰��ϱ�
--���̺� ������ �����Ŀ� ���� ������ �߰��ϱ� ���ؼ��� ALTER TABLE�� �߰��� �־���Ѵ�
--�ƹ��� ���� ���ǵ� �������� �ʰ� EMP09 ���̺��� �����Ѵ�

CREATE TABLE EMP09(
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
);

--���������� Ȯ���غ���
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP09';

--EMP09 ���̺��� EMPNOĮ���� �⺻Ű�� �����ϰ� DEPTNO Į���� �ܷ�Ű�� �����Ѵ�

ALTER TABLE EMP09
ADD PRIMARY KEY(EMPNO);

ALTER TABLE EMP09
ADD CONSTRAINT EMP09_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT01(DEPTNO);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP09';

--���� ���� �����ϱ�
--���� ������ �����ϱ� ���ؼ��� 
--DROP CONSTRAINT ������ �����ϰ��� �ϴ� ���� ���Ǹ��� ����Ѵ�

--EMP06 �������� Ȯ��
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP06';
--������ ��� ��ȣ 7499�� �߰��ϸ� ���� �߻�
INSERT INTO EMP06
VALUES(7499, 'ALLEN','MANAGER',50);

--�⺻Ű�� ���������� �����ϰ��� �Ѵٸ� ������ ���� �ۼ��ϸ� �ȴ�
--�׸��� ���� ���� Ȯ���ϴ� �������� �����ϸ�
--������ ���� ����� ���� ���ִ�
ALTER TABLE EMP06
DROP CONSTRAINT EMP06_EMPNO_PK;

ALTER TABLE EMP06
DROP CONSTRAINT EMP06_DEPTNO_FK;

--�ܷ�Ű�� ������ ������ ���� 
--�켱 ������ �����ϱ� ���� 2���� ���̺��� �����Ѵ�
CREATE TABLE DEPT02(
DEPTNO NUMBER(2),
DNAME VARCHAR2(14),
LOC VARCHAR2(13),
CONSTRAINT DEPT02_DEPTNO_PK PRIMARY KEY(DEPTNO)
);
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='DEPT02';
--���� �����͸� �߰�
INSERT INTO DEPT02 VALUES(10,'ACCOUNTING','NEWYORK');
INSERT INTO DEPT02 VALUES(20,'RESEARCH','DALLAS');

--��� ���̺��� �μ� ��ȣ�� �μ� ���̺��� �μ� ��ȣ�� �����Ҽ� �ֵ��� �ܷ�Ű�� �����Ѵ�
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

--���� ������ �߰� 

INSERT INTO EMP02 VALUES(7499,'ALLEN','SALESMAN',10);
INSERT INTO EMP02 VALUES(7369,'SMITH','CLERK',20);

DELETE FROM DEPT02 WHERE DEPTNO=10;
--ORA-02292: ���Ἲ ��������(HR.EMP02_DEPTNO_FK)�� ����Ǿ����ϴ�- 
--�ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
--�ڽ����̺��� EMP02�� �θ� ���̺��� DEPT02�� �⺻Ű�� �μ���ȣ�� �����ϰ��־� 
--�����Ҽ�����

--�μ���ȣ�� 10���� �ڷᰡ �����ǵ��� �ϱ� ���ؼ��� �Ʒ��� ���� �ؾ��Ѵ�
--�μ����̺� (EMP02)�� 10�� �μ����� �ٹ��ϴ� ����� ������ �� �μ� ���̺�(DEPT02)����
--10���μ��� �����Ѵ�
--���� ���Ἲ ������ ������ �Ұ����ϹǷ� EMP02 ���̺��� �ܷ�Ű ���� ������ �������Ŀ� 10��
--�μ��� �����Ѵ�

--ON DELETE CASCADE �� ON DELETE SET NULL �ɼ����� ������ �����ϴ�. �������� ������ 
--�Ʒ��� �ɼ��� ������ָ� �ȴ�

---ON DELETE CASCADE �θ� ���̺��� �����Ͱ� �����ϸ� �ڽ� ���̺��� �����͵� �Բ� �����ȴ�
--ON DELETE SET NULL �θ� ���̺��� �����Ͱ� �����Ǹ� �ڽ� ���̺��� ���� NULL�� �����ȴ�

CREATE TABLE TREATMENT(
T_NO NUMBER(4) NOT NULL,
T_COURSE_ABBR VARCHAR2(3) NOT NULL,
T_COURSE VARCHAR2(30) NOT NULL,
T_TEL VARCHAR2(15) NOT NULL,
CONSTRAINT TREATMENT_NO_PK PRIMARY KEY(T_NO),
CONSTRAINT TREATMENT_COURSE_ABBR_UK UNIQUE(T_COURSE_ABBR)
);
INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1001,'NS','�Ű�ܰ�','02-3452-1009');

INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1002,'OS','�����ܰ�','02-3452-2009');

INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1003,'C','��ȯ�⳻��','02-3452-3009');

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
VALUES(1, 'ȫ�浿','660606-1234561','JAVAUSER@NAVER.COM','ô�߽Ű�ܰ�','1001');

INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN,D_EMAIL,D_MAJOR,T_NO)
VALUES(2, '����ȯ','690724-1674536','JAEHWAN@NAVER.COM','������,�������ܰ�','1003');

INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN,D_EMAIL,D_MAJOR,T_NO)
VALUES(3, '����ȯ','700129-1328962','SHEEP1209@NAVER.COM','�ΰ�����, ������','1002');

INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN,D_EMAIL,D_MAJOR,T_NO)
VALUES(4, '�����','720901-1348940','SEUNGHYEON@NAVER.COM','����ܰ�,�ܻ�����','1002');

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