--게시판 조회 수 추가 (readcnt)
--alter table spring_board
--add(readcnt number default 0);

--comment on column spring_board.readcnt is '게시판 조회수';

--파일명을 위한 필드
alter table spring_board
add(b_file varchar2(500));

comment on column spring_board.b_file is '게시판 이미지 경로 및 파일명';

--썸네일을 위한 필드
--alter table spring_board
--add(b_thumb varchar2(500));

--comment on column spring_board.b_thumb is '게시판 썸네일 이미지 경로 및 파일명';

select * from spring_board;