use tourists;

#Query6
select d.district , sum(visitors) / t.pop_2019 as ratio
from `combined_visitors.csv` d left join telangana_pop t
on d.district = t.District 
group by d.district
order by ratio desc
limit 5;

select d.district , sum(visitors) / t.pop_2019 as ratio
from `combined_visitors.csv` d left join telangana_pop t
on d.district = t.District 
group by d.district
order by ratio asc
limit 5;

#Query7
with cte as(
select Source,year,sum(visitors) as curr , lag(sum(visitors),1) over(partition by Source) as prev
from `combined_visitors.csv`
where district = 'Hyderabad'
group by Source,year)
select * , (curr-prev)/prev as rate from cte



