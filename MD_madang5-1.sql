-- 로또번호 가장 많이 나온 숫자 : 34
select * from lotto_detail
order by seq_no;

select * from lotto_detail;

select * from lotto_main;

select num1 lotto_num, count(*) CNT
from lotto_main
group by num1
order by 2 desc;

select lotto_num, sum(CNT) as CNT
from (select num1 lotto_num, count(*) CNT
    from lotto_main
    group by num1
    union all
    select num2 lotto_num, count(*) CNT
    from lotto_main
    group by num2
    union all
    select num3 lotto_num, count(*) CNT
    from lotto_main
    group by num3
    union all
    select num4 lotto_num, count(*) CNT
    from lotto_main
    group by num4
    union all
    select num5 lotto_num, count(*) CNT
    from lotto_main
    group by num5
    union all
    select num6 lotto_num, count(*) CNT
    from lotto_main
    group by num6
    )
group by lotto_num
order by 2 desc;


--상금이 많은 순으로 나열
select a.seq_no
    ,a.lottery_date
    ,b.win_person_no
    ,b.win_money
    ,a.num1, a.num2, a.num3
    ,a.num4, a.num5, a.num6, a.bonus
    
    from lotto_main a
    ,lotto_detail b
    where a.seq_no = b.seq_no
    and b.rank_no = 1
    order by b.win_money desc;