--뷰활용하기 
--사원중에서 최근에 입사한 사원 5명만을 얻어 오는 질의문을 작성한다  rownum칼럼을 이용한다
--rownum칼럼은 오라클 내부적으로 부여되는데 insert문에 의해 입력한 순서에 따라 1씩 증가되면서 값이 지정된다

select rownum, employee_id, first_name, hire_date
from employees;

select rownum, employee_id, first_name, hire_date
from employees
order by hire_date desc;

--입사일을 기준으로 내림차순으로 정렬을 했는데도 해당 행의 rownum은 바뀌지 않는다
--데이터가 입력된 시점에서 결정되면 다시는 값이 바뀌지 않기 때문이다
--새로운 테이블에 입사일을 기준으로 내림차순 정렬한 쿼리문의 결과를저장하면 최근에 입사한 사원순으로 
--rownum 칼럼값이 1부터 부여된다

create or replace view view_hire
as select employee_id, first_name, hire_date
from employees
order by hire_date desc;

select rownum, employee_id, first_name, hire_date
from view_hire;

select rownum, employee_id, first_name, hire_date
from view_hire
where rownum <= 5;

--인라인 뷰로 top_n구하기
--인라인 뷰로 sql문장에서 사용하는 서브쿼리의 일종으로 보통 from 절에 위치해서 테이블 처럼 사용하는 것이다
--인라인 뷰란 메인 쿼리의 select문의 from 절 내부에 사용된 서브쿼리문을 말한다
--create view로 생성하는 것이 아니라 인라인 뷰는 sql문 내부에 뷰를 정의하고 이를 테이블처럼 사용한다
select rownum, employee_id, first_name, hire_date
from (select employee_id, first_name, hire_date
from employees
order by hire_date desc)
where rownum <= 5;

--employee 테이블과 department 테이블을 조회하여 부서번호와 부서별 최대 급여 및 부서명을 출력하세요 

select e.department_id, d.department_name, e.salary
from (select department_id, max(salary)salary
from employees group by department_id)
e inner join departments d
on e.department_id = d.department_id;

--with
--서브쿼리에 이름을 붙여주고 인라인뷰로 사용시 서브쿼리의 이름으로 from 절에 기술 가능하다
--같은 서브쿼리가 여러번 사용될 경우 중복 작성을 피할수 있고 실행속도도 빨라진다는 장점이 있다
--최근에 입사한 사원 5명을 출력해주세요 이때 rownum컬럼을 이용한 예제로 변경

with topn_hire
as
(select employee_id, first_name, hire_date
from employees
order by hire_date desc)

select rownum, employee_id, first_name, hire_date
from topn_hire
where rownum <=5;

--employees 테이블에서 급여가 자신이 속한 부서의 평균 급여보다 많이 받는 사원의 부서번호, 이름, 급여를 출력하는 
--select문을 작성하시오

select e.department_id, e.first_name, e.salary
from employees e inner join (select department_id, avg(salary) d_salary
from employees
group by department_id)d
on e.department_id = d.department_id
where e.salary > d.d_salary
order by e.department_id;

with dept_sal
as
(select department_id, avg(salary) d_salary
from employees
group by department_id)

select e.department_id, e.first_name, e.salary
from employees e inner join dept_sal d on e.department_id=d.department_id
where e.salary > d.d_salary
order by e.department_id;

--rank() over()
--순위부여시 중복값(같은값)이 발생되면 중복값의 갯수만큼 건너뛰고 다음 순위 부여한다
--예를 들어 90, 80, 80, 80, 70이면 순위는 1,2,2,2,5로 부여한

--사원테이블에서 60번 부서에 소속된 사원중에서 입사년도가 가장 빠른 순부터 사원번호, 사원명, 입사일자, 순위를 부여하여 
--출력해주세요

select employee_id as 사원번호, first_name as 사원명, hire_date as 입사일자, 
rank() over (order by hire_date desc) as 순위
from employees
where department_id =60;

--사원테이블에서 급여를 가장 많이 받는 순위를 부여하고 상위 5명만 출력해 봅시다

select salary_rank, first_name, salary
from (select first_name, salary,
rank()over(order by salary desc)as salary_rank
from employees
order  by salary desc)
--where rownum <= 5;
where salary_rank <=5;

--dense_rank() over()
--사원테이블 60번 부서에 소속된 사원중에서 급여를가장 많이 받는 순으로 사원번호, 사원명, 급여,
--순위를 부여하세요
select employee_id as 사원번호, first_name as 사원명, salary as 입사일자,
row_number() over(order by salary desc) as 순위
from employees
where department_id = 60;

--partition by
--오라클에서 그룹함수를 사용할때 partition by를 사용하여 그룹으로 묶어서 연산을 할수있다. 
--group by 절을 사용하지 않고 조회된 각 행에 그룹으로 집계된 값을 표시할때 over 절과 함께 
--partition by절을 사용하면 된다

--부서별 급여의 합 출력
select department_id,
sum(salary)
from employees
where department_id between 10 and 30
group by department_id
order by department_id;

--부서번호와 사원명, 부서별 급여의 합을 함께 출력
select department_id,
first_name,
sum(salary) over(partition by department_id)as salary_total
from employees
where department_id between 10 and 30
order by department_id;

-- 위의 예제를 보면 데이털르 조회한 각 행에 그룹함수로 집계한 값을 추가로 각 행에 표시하며,
--조회된 데이터는 group by절을 사용하지 않았기 때문에 데이터가 변형되지 않는다

--그룹함수를 사용할때는 over 절을 함께 사용해야하며, over 절 내부에 
--partition by절을 사용하지 않으면 쿼리전체를 집계하며
--partition by 절을 사용하면 쿼리 결과에서 해당 칼럼을 그룹으로 묶어서 결과를 표시한다

select department_id,
first_name,
salary,
sum(salary) over(partition by department_id) as department_total,
sum(salary) over() as salary_total
from employees
where department_id between 10 and 30
order by department_id;

--각 부서에 소속된 사원 전체가 아니라 각 부서별 한명의 사원만 출력하고자 한다. 이때 사원번호, 사원명,
--직무번호, 급여, 부서번호를 조회해봅시다
--그전에 각 부서별로 번호를 부여해봅시다
select employee_id
,first_name
,job_id
,salary
,department_id
,row_number()over(partition by department_id order by employee_id) as rnum
from employees
order by department_id;

select employee_id, first_name, department_id, hire_date
from (select row_number() over(partition by department_id order by employee_id)
as rnum, employee_id, first_name, department_id, hire_date
from employees) data
where data.rnum = 1;



create table subject (
no number not null,
s_num varchar2(2) not null,
s_name varchar2(80) not null,
constraint subject_no_pk primary key(no),
constraint subject_s_num_uk unique(s_num)
);

insert into subject (no, s_num, s_name) values(1, '01', '컴퓨터학과');
insert into subject (no, s_num, s_name) values(2, '02', '교육학과');
insert into subject (no, s_num, s_name) values(3, '03', '신문방송학과');
insert into subject (no, s_num, s_name) values(4, '04', '인터넷비즈니스학과');
insert into subject (no, s_num, s_name) values(5, '05', '기술경영과');



--학생 테이블 (자식테이블)
create table student(
no number not null,
sd_num varchar2(8) not null,
sd_name varchar2(20) not null,
sd_id varchar2(15) not null,
sd_passwd varchar2(15) not null,
s_num varchar2(2) not null,
sd_birth char(8) not null,
sd_phone varchar2(15) not null,
sd_address varchar2(200) not null,
sd_email varchar2(100) not null,
sd_date date default sysdate,
constraint student_no_pk primary key(no),
constraint student_sd_num_uk unique(sd_num),
constraint student_id_uk unique(sd_id),
constraint student_s_num_fk foreign key(s_num) references subject(s_num)
);

insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(1, '06010001','김정수','javajsp','java1234','01','19860424','01012345678','서울시 서대문구 창전동','java12@naver.com');
insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(2, '95010002','김수현','jdbcmania','mania12','01','19751009','0103452468','서울시 서초구 양재동','jdbmania@naver.com');
insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(3, '98040001','공지영','gonji','mania12','04','19780516','01012657455','부산광역시 해운대구 반송동','gonji@naver.com');
insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(4, '02050001','조수영','water','java1234','05','19820831','0107681499','대전광역시 중구 은행동','water@naver.com');
insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(5, '94040002','최경란','novel','novle2468','04','19741025','0109872455','경기도 수원시 장안구 이목동','novel@naver.com');
insert into student(no, sd_num, sd_name, sd_id, sd_passwd, s_num, sd_birth, sd_phone, sd_address, sd_email)
values(6, '08020001','안익태','korea','korea99','02','19880805','0108452345','서울시 마포구 대흥동','korea@naver.com');
