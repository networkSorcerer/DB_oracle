
create or replace view subjectselect(no, s_num, s_name, deleteable)
as
select no , s_num, s_name
,decode ((select count(sd_num) from student where s_num = sb.s_num), 0, '삭제가능','삭제불가능')
from subject sb
order by no;

select no, s_num, s_name, deleteable from subjectselect ;



