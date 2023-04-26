create tablespace md_tbs
datafile 'C:\madang\oradata\md_tbs_data01.dbf'
size 10M;

create tablespace md_test
datafile 'C:\madang\oradata\md_test_data01.dbf'
size 10M;

drop tablespace md_test
including contents and datafiles;

create user mdguest
identified by mdguest;

create user mdguest2
identified by mdguest2
default tablespace md_tbs;

grant connect, resource, unlimited tablespace to mdguest;
grant connect, resource, unlimited tablespace to mdguest2;

select *
from book;




