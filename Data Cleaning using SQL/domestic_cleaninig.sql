use domestic_tourists;
select * from domestic_visitors;

select district,round(avg(visitors),0) as avg_tourists from domestic_visitors
group by district;

update domestic_visitors d join avg_tourists a
on d.district  = a.district
set d.visitors = a.avg_tourists
where d.visitors = '';

select * from domestic_visitors;
