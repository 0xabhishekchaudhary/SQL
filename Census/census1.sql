--number of rows in each data set

select count(*) from dataset1

select count(*) from dataset2

-- dataset for jharkhand and bihar
select * from dataset1
where state in ('Jharkhand','Bihar')

--population of India
select sum(population) as population from dataset2

--average growth of india
select avg(growth)*100 as Average_Growth from dataset1

--average growth of state
select state,avg(growth)*100 as Average_growth from dataset1
group by state
order by state

--average sex_ratio
select avg(sex_ratio) from dataset1

select state,round(avg(sex_ratio),0) as Sex_ratio from dataset1
group by state
order by Sex_ratio desc

--average literacy rate
select state,round(avg(literacy)) as literacy from dataset1
group by state
having round(avg(literacy)) >90
order by literacy desc

--top 3 state highest average growth percent top 3 works in SSMS
select state,avg(growth)*100 as Average_growth from dataset1
group by state
order by Average_growth desc
limit 3

--bootom 3 states by average growth
select state,round(avg(sex_ratio)) as Average_growth from dataset1
group by state
order by Average_growth 
limit 3

--top and bootom in same table[use temporary table and union]
drop table if exists topstates;
create temporary table topstates(
state varchar,
topstates float
);
insert into topstates
select state,round(avg(literacy)) as top from dataset1
group by state;

select * from topstates

--bottom
drop table if exists bottomstates;
create temporary table bottomstates(
state varchar,
bottomstates float
);
insert into bottomstates
select state,round(avg(literacy)) as bottom from dataset1
group by state;

select * from bottomstates

--combine with union
-- Combine top 3 and bottom 3 literacy average states using UNION ALL
SELECT * FROM (
    SELECT * FROM topstates
    ORDER BY topstates DESC
    LIMIT 3
) AS top3
UNION ALL
SELECT * FROM (
    SELECT * FROM bottomstates
    ORDER BY bottomstates ASC
    LIMIT 3
) AS bottom3;

--states staring with letter a
select state from dataset1
where state like 'A%'

select distinct state from dataset1
where state like '%m' or  state like 'A%'

