-- 데이터베이스에 전달된 SQL문은 아래와 같은 과정을 거처서 처리된다.
-- SQL 파싱 : SQL 구문에 오류가 있는지 SQL을 실행해야 하는 대상가 존재하는지를 검사한다.
-- SQL 최적화 : SQL이 실행되는데 필요한 비용(COST)을 계산하게 되며 이 계산된 값을 기초로 
--                     어떤 방식으로 실행하는 것이 가장 좋다는 것을 판단하는 실행계획을 세운다
-- SQL 실행 : 세워진 실행 계획을 통해서 메모리상에 데이터를 읽거나 물리적인 공간에서 
--데이터를 로딩하는 등의 작업을 하게 된다.
    
-- 인덱스(색인) 
-- CREATE [UNIQUE] INDEX 인덱스명 ON 테이블명( 컬럼1, 컬럼2.... );


--페이징 처리를 위한 데이터 입력 처리
CREATE OR REPLACE PROCEDURE BOARD_PAGING_INSERT
IS
BEGIN
    FOR cnt IN 1..120 LOOP
        INSERT INTO spring_board(b_num, b_name, b_title, b_content, b_pwd)
        VALUES(spring_board_seq.nextval,
        '홍길동'||cnt,
        '힘들때 힘이 되는 명언'||cnt,
        '조급해 하지 말고 조바심 내지말고, 할수 있는 만큼 최선을 다하자.',
        '1234');
    END LOOP;
    COMMIT;
END;
/
SHOW ERROR;

EXECUTE BOARD_PAGING_INSERT;

SELECT COUNT(*) FROM SPRING_BOARD;

--데이터가 많은 경우 order by가 문제가 된다면 이를 해결하기 위한 방법이 index를 이용해서
--정렬을 생략하는 방법이다 왜냐면 인덱스라는 존재가 이미 정렬된 구조이므로 이를 이용해서 별도의 
--정렬을 하지 않는 방법이다

select /*+INDEX_DESC(spring_board spring_board_pk)*/
* 
from spring_board where b_num >0;

--인덱스와 오라클 힌트 
--오라클은 select문을 전달할 때 힌트 라는 것을 사용할수 있다 힌트는 개발자가 데이터 베이스에
--어떤 방식으로 실행해줘야 하는지를 명시하기 때문에 조금 강제성이 부여되는 방식이다
--select문을 작성할 때 힌트는 잘못 작성되어도 실행할때는 무시되기만 하고 별도의 에러는 발생하지 않는다
--우선 힌트를 사용할 때에는 다음과 같은 문법을 사용한다

select /*+INDEX_DESC(spring_board spring_board_pk)*/
    b_num, b_name, b_title, b_date
    from spring_board;

--힌트 
--개발자가 테이터베이스에 어떤 방식으로 실행해줘야 하는지를 명시하기 때문에 강제성을 부여한다
--구문 : /*+로 시작하고 */로 종료 된다
--INDEX_DESC(테이블 명 인덱스 명): /+INDEX_DESC(spring_board spring_board_pk)*/

--rowid: 데이터 베이스 내의 주소에 해당하는데 모든 데이터는 자신만의 주소를 가진다
select rowid, board.*from spring_board board order by b_num desc;

select /*+INDEX_DESC(spring_board spring_board_pk)*/
b_num, b_name, b_title, b_date
from spring_board where b_num > 0;

--rownum: SQL이 실행된 결과에 넘버링 해준다
select rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from spring_board;

--10개의 레코드 얻기 (1~10까지)
select /*+INDEX_DESC(spring_board spring_board_pk)*/
rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD')as b_date
from spring_board where rownum <= 10;

--10개의 레코드 얻기 (11 ~ 20까지) 결과? => 출력 레코드가 존재하지 않는다
select /*+INDEX_DESC(spring_board spring_board_pk)*/
rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD')as b_date
from spring_board where rownum > 10 and rownum <= 20;

--인라인 뷰를 이용하여 원하는 레코드 얻기
select
    rnum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD')as b_date
    from (
    select /*+INDEX_DESC(spring_board spring_board_pk)*/
    rownum as rnum, b_num, b_name, b_title, b_date
    from spring_board
    where rownum <= 20
    ) boardlist
    where rnum > 10; --페이지 번호
    
--이 과정을 정리하면 다음과 같은 순서이다
--필요한 순서로 정렬된 데이터에 rownum을 붙인다
--처음부터 해당 페이지의 데이터를 rownum<=20과 같은 조건을 이용해서 구한다
--구해놓은 데이터를 하나의 테이블처럼 간주하고 인라인뷰로 처리한다
--인라인 뷰에서 필요한 데이터만을 남긴다
