--저장 프로시저(STORED PROCEDURE : 스토어드 프로시저)
--프로시저는 지정된 특정처리를 실행하는 서브 프로그램의 한 유형이다
--저장 프로시저는 자주 사용되는 쿼리문을 모듈화시켜서 필요할 때마다 호출하여 사용하는 것을 말한다

--프로시저의 생성 구문
--CREATE [OR REPLACE] PROCEDURE PRCEDURE_NAME
--(매개 변수 1 [MODE] 자료형,
--매개 변수 2 [MODE] 자료형...)
--IS
--LOCAL_VARIABLE DECLARATION
--BEGIN
--STATEMENT1;
--END [PRCEDURE_NAME];

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

