drop table dbo.tt
create table dbo.tt (id int, col1 int, col2 int, col3 int, col4 int)
insert into dbo.tt (id, col1, col2, col3) values ( 1,1, 3,0),(2,5,6,88)


update a
set col4 = Z.col
from dbo.tt a
inner join (
select t.id, max(t.col) as col from dbo.tt
cross apply ( values (id,col1), (id,col2), (id,col3)) as t(id,col)
group by t.id ) Z on Z.id =  a.id

select * From dbo.tt

use adventureworks2014

update dbo.tt
set col4  = null

select * From dbo.tt


drop table dbo.tt
create table dbo.tt (id int, col1 int, col2 int, col3 int, col4 int default (case when col1 > Col2 and Col1 > col3 then col1 
                when  col2 > col3 and col2 > col1 then col2
				when col3 > col1 and col3 > col2 then col3 else 0
			end)
