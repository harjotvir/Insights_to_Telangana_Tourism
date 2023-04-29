use tourists;
select * from `combined_visitors.csv`;

# Query 1
select district , sum(visitors) as no_of_visitors
from `combined_visitors.csv`
where Source = 'domestic'
group by district
order by no_of_visitors desc
limit 10;

# Query 2
with cte2 as(
with cte as(select district ,year, sum(visitors) as no_of_visitors,
lag(sum(visitors),1) over(partition by district) as prev_tourists
from `combined_visitors.csv`
group by district,year)
select *,
case when year = 2016 then 0
else round(1.0*(no_of_visitors -  prev_tourists)/ prev_tourists,3) end  as growth
from cte
group by district,year)
select district , round(avg(growth),3) as CAGR
from cte2
group by district
order by CAGR desc
limit 3;


#Querty 3
with cte2 as(
with cte as(select district ,year, sum(visitors) as no_of_visitors,
lag(sum(visitors),1) over(partition by district) as prev_tourists
from `combined_visitors.csv`
group by district,year)
select *,
case when year = 2016 then 0
else round(1.0*(no_of_visitors -  prev_tourists)/ prev_tourists,3) end  as growth
from cte
group by district,year)
select district , round(avg(coalesce(growth,0)),3) as CAGR
from cte2
group by district
order by CAGR
limit 3;

#Query4
with cte as(
select month,sum(visitors) as total_visitors
from `combined_visitors.csv`
where district = 'Hyderabad'
group by month)
select month , total_visitors
from cte
where total_visitors in( select max(total_visitors) from cte)
union
select month , total_visitors
from cte
where total_visitors in( select min(total_visitors) from cte);


#Query5
with cte as(
select district,round(1.0*sum(case when Source = 'domestic' then visitors else 0 end)/
sum(case when Source = 'foreign' then visitors else 0 end),2) as ratio
from `combined_visitors.csv`
group by district
)
select district, ratio from cte
where ratio is not null
order by ratio desc
limit 3;

with cte as(
select district,round(1.0*sum(case when Source = 'domestic' then visitors else 0 end)/
sum(case when Source = 'foreign' then visitors else 0 end),2) as ratio
from `combined_visitors.csv`
group by district
)
select district, ratio from cte
where ratio is not null
order by ratio
limit 3;






