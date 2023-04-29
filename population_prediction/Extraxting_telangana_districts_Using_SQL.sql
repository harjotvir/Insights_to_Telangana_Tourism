use domestic_tourists;
select t.District as District ,pop_2001,pop_2011 from andhra_data a
right join telangana_census2011 t
on a.District = t.District
group by t.District