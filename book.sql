-- Java 연동하여 사용할 테이블 생성
-- books 테이블 생성
create table BOOKS (
	book_id number,                  --책번호
	title varchar2(80) not null,     --책제목
	publisher varchar2(60) not null, --출판사
	year varchar2(4) not null,       --출간년도
	price number not null,           --책가격
	constraint books_pk primary key(book_id)
);

-- books_seq 시퀀스 생성
create sequence BOOK_SEQ
start with 1
increment by 1
maxvalue 999999999
minvalue 1
nocycle
nocache;

insert into BOOKS 
values (1, '일과 영성','두란노','2021', 200000);
insert into BOOKS
values (2, '내가 만든 신','두란노','2021', 200000);
insert into BOOKS 
values (3, '용서를 배우다','두란노','2021', 200000);
insert into BOOKS
values (4, '기도','두란노','2021', 200000);
insert into BOOKS 
values (5, '집사를 말하다','두란노','2021', 200000);



select*from BOOKS;