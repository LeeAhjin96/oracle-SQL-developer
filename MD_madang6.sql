set transaction name 'T1';

select *
from book
where bookid=1;

update book
set price=7100
where bookid=1;

select *
from book
where bookid=1;

commit;

select sys_context('userenv', 'sessionid') from dual;

--데드락 
set transaction name 'T1';

update book
set price=price+100
where bookid=1;

update book
set price=price+100
where bookid=2;

commit;

--오손읽기
create table users
( id number,
name varchar2(20),
age number);
insert into users values (1, 'hong gildong', 30);
select *
from users;
commit;
--
set transaction isolation
level read UNCOMMITTED;

select *
from users
where id=1;

select *
from users
where id=1;

commit;

--반복불가능 읽기
set transaction isolation level
read committed;

select *
from users
where id=1;

--유령데이터 읽기
set transaction isolation level
repeatable read;

--현재 repeatable, uncommitted 명령은 실행이 불가능한 상태이다. 제외하고 진행함

select *
from users
where age between 10 and 30;

commit;

--트랜잭션 고립 수준 실습
set transaction isolation level
read committed;

select sum(price) 총액
from book;

select sum(price) 총액
from book;
--앞의 결과와 다른것 확인하기

commit;


--유령데이터 읽기 문제와 방지를 위한 명령어
set transaction isolation level
repeatable read;

select sum(price) 총액
from book;
--재확인
select sum(price) 총액
from book;

commit;


--문제방지:serializable 모드
set transaction isolation level
serializable;

select sum(price) 총액
from book;

--확인 위의 결과와 같은것 확인!
select sum(price) 총액
from book;

commit;













