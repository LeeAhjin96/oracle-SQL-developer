--SummerPrice table 삽입
create table SummerPrice (
class varchar(20),
price integer
);

insert into summerprice values ('FORTRAN', 20000);
insert into summerprice values ('PASCAL', 15000);
insert into summerprice values ('C', 10000);

select * from summerprice;

--SummerEnroll table 삽입
create table SummerEnroll(
sid INTEGER,
class varchar(20)
);

insert into summerenroll values (100, 'FORTRAN');
insert into summerenroll values (150, 'PASCAL');
insert into summerenroll values (200, 'C');
insert into summerenroll values (250, 'FORTRAN');

select * from summerenroll;

--계절학기를 듣는 학생의 학번과 수강하는 과목은?
select sid,class
from summerenroll;

--C강좌의 수강료는?
select price
from summerprice
where class='C';

--수강료가 가장 비싼 과목은?
select distinct class
from summerprice
where price=(select max(price)
                from summerprice);
                
--계절학기를 듣는 학생수와 수강료 총액은?
select count(*), sum(price)
from summerprice, summerenroll
where summerprice.class=summerenroll.class;

--삭제이상 없음
delete from summerenroll
where sid=200;

select * from summerenroll;

--C강좌의 수강료가 존재하는지 확인
select price "C수강료"
from summerprice
where class='C';

--sid 200 재추가
insert into summerenroll values (200, 'C');

