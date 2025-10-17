#created the table dataset2
create table dataset2()

copy dataset2(district,state,area_km2,population)
from 'C:\Program Files\PostgreSQL\18\data\SQL Projects\1\dataset2.csv'
delimiter ','
csv header

alter table dataset2
add column
district varchar,
add column state varchar,
add column area_km3 int,
add column population int;

select * from dataset2

alter table dataset2 rename column area_km3  to area_km2


