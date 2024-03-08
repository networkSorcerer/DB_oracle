-- �����ͺ��̽��� ���޵� SQL���� �Ʒ��� ���� ������ ��ó�� ó���ȴ�.
-- SQL �Ľ� : SQL ������ ������ �ִ��� SQL�� �����ؾ� �ϴ� ��� �����ϴ����� �˻��Ѵ�.
-- SQL ����ȭ : SQL�� ����Ǵµ� �ʿ��� ���(COST)�� ����ϰ� �Ǹ� �� ���� ���� ���ʷ� 
--                     � ������� �����ϴ� ���� ���� ���ٴ� ���� �Ǵ��ϴ� �����ȹ�� �����
-- SQL ���� : ������ ���� ��ȹ�� ���ؼ� �޸𸮻� �����͸� �аų� �������� �������� 
--�����͸� �ε��ϴ� ���� �۾��� �ϰ� �ȴ�.
    
-- �ε���(����) 
-- CREATE [UNIQUE] INDEX �ε����� ON ���̺��( �÷�1, �÷�2.... );


--����¡ ó���� ���� ������ �Է� ó��
CREATE OR REPLACE PROCEDURE BOARD_PAGING_INSERT
IS
BEGIN
    FOR cnt IN 1..120 LOOP
        INSERT INTO spring_board(b_num, b_name, b_title, b_content, b_pwd)
        VALUES(spring_board_seq.nextval,
        'ȫ�浿'||cnt,
        '���鶧 ���� �Ǵ� ���'||cnt,
        '������ ���� ���� ���ٽ� ��������, �Ҽ� �ִ� ��ŭ �ּ��� ������.',
        '1234');
    END LOOP;
    COMMIT;
END;
/
SHOW ERROR;

EXECUTE BOARD_PAGING_INSERT;

SELECT COUNT(*) FROM SPRING_BOARD;

--�����Ͱ� ���� ��� order by�� ������ �ȴٸ� �̸� �ذ��ϱ� ���� ����� index�� �̿��ؼ�
--������ �����ϴ� ����̴� �ֳĸ� �ε������ ���簡 �̹� ���ĵ� �����̹Ƿ� �̸� �̿��ؼ� ������ 
--������ ���� �ʴ� ����̴�

select /*+INDEX_DESC(spring_board spring_board_pk)*/
* 
from spring_board where b_num >0;

--�ε����� ����Ŭ ��Ʈ 
--����Ŭ�� select���� ������ �� ��Ʈ ��� ���� ����Ҽ� �ִ� ��Ʈ�� �����ڰ� ������ ���̽���
--� ������� ��������� �ϴ����� ����ϱ� ������ ���� �������� �ο��Ǵ� ����̴�
--select���� �ۼ��� �� ��Ʈ�� �߸� �ۼ��Ǿ �����Ҷ��� ���õǱ⸸ �ϰ� ������ ������ �߻����� �ʴ´�
--�켱 ��Ʈ�� ����� ������ ������ ���� ������ ����Ѵ�

select /*+INDEX_DESC(spring_board spring_board_pk)*/
    b_num, b_name, b_title, b_date
    from spring_board;

--��Ʈ 
--�����ڰ� �����ͺ��̽��� � ������� ��������� �ϴ����� ����ϱ� ������ �������� �ο��Ѵ�
--���� : /*+�� �����ϰ� */�� ���� �ȴ�
--INDEX_DESC(���̺� �� �ε��� ��): /+INDEX_DESC(spring_board spring_board_pk)*/

--rowid: ������ ���̽� ���� �ּҿ� �ش��ϴµ� ��� �����ʹ� �ڽŸ��� �ּҸ� ������
select rowid, board.*from spring_board board order by b_num desc;

select /*+INDEX_DESC(spring_board spring_board_pk)*/
b_num, b_name, b_title, b_date
from spring_board where b_num > 0;

--rownum: SQL�� ����� ����� �ѹ��� ���ش�
select rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from spring_board;

--10���� ���ڵ� ��� (1~10����)
select /*+INDEX_DESC(spring_board spring_board_pk)*/
rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD')as b_date
from spring_board where rownum <= 10;

--10���� ���ڵ� ��� (11 ~ 20����) ���? => ��� ���ڵ尡 �������� �ʴ´�
select /*+INDEX_DESC(spring_board spring_board_pk)*/
rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD')as b_date
from spring_board where rownum > 10 and rownum <= 20;

--�ζ��� �並 �̿��Ͽ� ���ϴ� ���ڵ� ���
select
    rnum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD')as b_date
    from (
    select /*+INDEX_DESC(spring_board spring_board_pk)*/
    rownum as rnum, b_num, b_name, b_title, b_date
    from spring_board
    where rownum <= 20
    ) boardlist
    where rnum > 10; --������ ��ȣ
    
--�� ������ �����ϸ� ������ ���� �����̴�
--�ʿ��� ������ ���ĵ� �����Ϳ� rownum�� ���δ�
--ó������ �ش� �������� �����͸� rownum<=20�� ���� ������ �̿��ؼ� ���Ѵ�
--���س��� �����͸� �ϳ��� ���̺�ó�� �����ϰ� �ζ��κ�� ó���Ѵ�
--�ζ��� �信�� �ʿ��� �����͸��� �����
