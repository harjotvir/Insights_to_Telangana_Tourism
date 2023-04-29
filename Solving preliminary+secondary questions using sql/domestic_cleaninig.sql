use tourists;
select * from `domestic_visitors.csv`;

select district,round(avg(visitors),0) as avg_domestic_tourists from domestic_visitors
group by district;

update `domestic_visitors.csv` d join avg_domestic_tourists a
on d.district  = a.district
set d.visitors = a.avg_tourists
where d.visitors = '';

select * from `domestic_visitors.csv`;
