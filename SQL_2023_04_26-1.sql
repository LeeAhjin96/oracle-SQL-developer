set transaction name 'T2';

select *
from book
where bookid=1;

update book
set price=price+100
where bookid=1;

select *
from book
where bookid=1;

commit;

select sys_context('userenv', 'sessionid') from dual;

--데드락
set transaction name 'T2';

update book
set price=price*1.1
where bookid=2;

update book
set price=price*1.1
where bookid=1;

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
level read committed;

update users
set age=21
where id=1;

select *
from users
where id=1;

rollback;

--반복불가능 읽기
set transaction isolation level
read committed;

update users
set age=21
where id=1;

commit;

select *
from users
where id=1;

--유령데이터 읽기
set transaction isolation level
read committed;

insert into users values (3, 'Bob', 27);

commit;

select *
from users
where age between 10 and 30;

--트랜잭션 고립 수준 실습
set transaction isolation level
read committed;

select sum(price) 총액
from book;

update book
set price=price+500
where bookid=1;

select sum(price) 총액
from book;

commit;

--유령데이터 읽기 문제와 방지를 위한 명령어
set transaction isolation level
read committed;

select sum(price) 총액
from book;

insert into book values (11, '테스트', '테스트출판사',5500);
--재확인
select sum(price) 총액
from book;

commit;

--문제방지:serializable 모드
set transaction isolation level
read committed;

select sum(price) 총액
from book;

--여기까지 실행하고 진행
insert into book values (12, '테스트','테스트 출판사', 5500);

select sum(price) 총액
from book;

commit;











