--�Խ��� ��ȸ �� �߰� (readcnt)
--alter table spring_board
--add(readcnt number default 0);

--comment on column spring_board.readcnt is '�Խ��� ��ȸ��';

--���ϸ��� ���� �ʵ�
alter table spring_board
add(b_file varchar2(500));

comment on column spring_board.b_file is '�Խ��� �̹��� ��� �� ���ϸ�';

--������� ���� �ʵ�
--alter table spring_board
--add(b_thumb varchar2(500));

--comment on column spring_board.b_thumb is '�Խ��� ����� �̹��� ��� �� ���ϸ�';

select * from spring_board;