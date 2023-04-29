use domestic_tourists;
select * from foreign_visitors;

select district,round(avg(visitors),0) as avg_tourists from foreign_visitors
group by district;

update foreign_visitors f join avg_foreign_tourists a
on f.district  = a.district
set f.visitors = a.avg_tourists
where f.visitors is NULL;
select * from foreign_visitors;
