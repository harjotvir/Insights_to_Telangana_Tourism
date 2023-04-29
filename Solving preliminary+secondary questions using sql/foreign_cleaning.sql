use tourists;
select * from `foreign_visitors.csv`;

select district,round(avg(visitors),0) as avg_tourists from `foreign_visitors.csv`
group by district;

update `foreign_visitors.csv` f join avg_foreign_tourists a
on f.district  = a.district
set f.visitors = a.avg_tourists
where f.visitors is NULL;
select * from foreign_visitors;
