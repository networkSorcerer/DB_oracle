--���� ���ν���(STORED PROCEDURE : ������ ���ν���)
--���ν����� ������ Ư��ó���� �����ϴ� ���� ���α׷��� �� �����̴�
--���� ���ν����� ���� ���Ǵ� �������� ���ȭ���Ѽ� �ʿ��� ������ ȣ���Ͽ� ����ϴ� ���� ���Ѵ�

--���ν����� ���� ����
--CREATE [OR REPLACE] PROCEDURE PRCEDURE_NAME
--(�Ű� ���� 1 [MODE] �ڷ���,
--�Ű� ���� 2 [MODE] �ڷ���...)
--IS
--LOCAL_VARIABLE DECLARATION
--BEGIN
--STATEMENT1;
--END [PRCEDURE_NAME];

SELECT * FROM BOOKS;

--���ν��� ���� (����ó��)
CREATE OR REPLACE PROCEDURE BOOKS_INPROC
(P_BOOK_ID IN BOOKS.BOOK_ID%TYPE, R_TITLE OUT BOOKS.TITLE%TYPE)
IS
BEGIN
SELECT TITLE INTO R_TITLE FROM BOOKS WHERE BOOK_ID = P_BOOK_ID;
EXCEPTION
WHEN OTHERS THEN
R_TITLE :='�ش��ϴ� å�� �������� �ʽ��ϴ�.';
END BOOKS_INPROC;
/

