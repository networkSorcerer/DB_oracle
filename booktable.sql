-- Java 연동하여 사용할 테이블 생성
-- books 테이블 생성
create table books (
	book_id number,                  --책번호
	title varchar2(80) not null,     --책제목
	publisher varchar2(60) not null, --출판사
	year varchar2(4) not null,       --출간년도
	price number not null,           --책가격
	constraint books_pk primary key(book_id)
);

-- books_seq 시퀀스 생성
create sequence books_seq
start with 1
increment by 1
maxvalue 999999999
minvalue 1
nocycle
nocache;

insert into books 
values (books_seq.nextval, '일과 영성','두란노','2021', 200000);
insert into books 
values (books_seq.nextval, '내가 만든 신','두란노','2021', 200000);
insert into books 
values (books_seq.nextval, '용서를 배우다','두란노','2021', 200000);
insert into books 
values (books_seq.nextval, '기도','두란노','2021', 200000);
insert into books 
values (books_seq.nextval, '집사를 말하다','두란노','2021', 200000);

select*from books;

SELECT*FROM BOOKS;

select books_seq.nextval from  dual;

--1.사원번호와 사원명과 부서명과 부서의 위치를 출력하는 뷰(VIEW_LOC)를 작성하라

CREATE VIEW VIEW_LOC AS
SELECT e.employee_id AS 사원번호,
       e.first_name AS 사원명,
       d.department_name AS 부서명,
       l.city AS 부서의_위치
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

--2.30번 부서 소속 사원의이름과 입사일과 부서명을 출력하는 뷰(VIEW_DEPT30)를 작성하라
CREATE VIEW VIEW_DEPT30 AS
SELECT e.first_name AS 사원이름,
       e.hire_date AS 입사일,
       d.department_name AS 부서명
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id = 30;

--3.부서별 최대 급여정보를 가지는 뷰(VIEW_DEPT_MAXSAL)를 생성하라
CREATE VIEW VIEW_DEPT_MAXSAL AS
SELECT d.department_id AS 부서번호,
       d.department_name AS 부서명,
       MAX(e.salary) AS 최대급여
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

--4. 급여를 많이 받는 순서대로 3명만 출력하는 뷰(VIEW_SAL_TOP3)와 인라인뷰로 작성하라.

CREATE VIEW VIEW_SAL_TOP3 AS
SELECT employee_id AS 사원번호,
       first_name AS 사원이름,
       salary AS 급여
FROM employees
ORDER BY salary DESC
FETCH FIRST 3 ROWS ONLY;

SELECT *
FROM (
    SELECT employee_id AS 사원번호,
           first_name AS 사원이름,
           salary AS 급여
    FROM employees
    ORDER BY salary DESC
)
WHERE ROWNUM <= 3;



SELECT * FROM VIEW_SAL_TOP3 ;


select*from locations;
select*from departments;
