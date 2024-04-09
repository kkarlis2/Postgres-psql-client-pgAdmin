/* 
Find all the apartments that has weekly_cost lower than 200$ and 2 or more bedrooms
Output: 17 rows
*/
select price.id,price.weekly_price
from price
inner join room
on price.id=room.id
where price.weekly_price<200 AND room.bedrooms>=2;

/*
Find all the apartments included in geolocation that are located in the area with zipcode= 11143
Output: 3 rows.
*/
select location.id,location.neighbourhood,location.neighbourhood_cleansed
from location
inner join geolocation
on geolocation.properties_neighbourhood = location.neighbourhood_cleansed
where zipcode= '11143';

/*
Find where are the most friendly hostes
Output: 21 rows.
*/
select host.neighbourhood,count(host.id) as num_of_apartments
from host
full outer join price
on host.id=price.id
where host.host_acceptance_rate='100%' and host.neighbourhood!= '' 
group by neighbourhood 
having count(host.id) >50
order by num_of_apartments desc;

/*
Find the neighbourhoods with apartments that allows at least 2 accommodates and maximum 5.
Output: 32 rows.
*/
select location.neighbourhood,cast(avg(room.accommodates) as integer)
from room
full outer join location
on room.id=location.id
where location.neighbourhood!=''
group by location.neighbourhood
having avg(room.accommodates) between 2 and 5;

/*
Select all the information about the most seemingly valid hostes.
Output:1157 rows.
*/
select host.*
from host
left join location
on host.id=location.id
where host.has_profile_pic= 'true' and  host.indentity_verified='true';