/*
Find all apartments that will be available between 21st and 26st of May 2020 and include exactly 5 beds.
Output: 293 rows
*/

SELECT l.id,l.neighbourhood_cleansed,l.price
FROM listings l
INNER JOIN calendar 
ON l.id = calendar.listing_id
WHERE calendar.available AND l.beds=5 AND calendar.date >='5/21/2020' AND calendar.date<='5/26/2020';

/*
Find the most recently reviews for apartments in 'ΑΜΠΕΛΟΚΗΠΟΙ' neighbourhood. 
Output: 11337 rows
*/
SELECT reviews.listing_id,reviews.comments,reviews.date
FROM reviews
INNER JOIN listings
ON listings.id = reviews.listing_id
WHERE listings.neighbourhood_cleansed='ΑΜΠΕΛΟΚΗΠΟΙ'
ORDER BY reviews.date DESC;

/*
Find the id of 1000 available apartments which prices are between 52-80 dollars in 21st of May 2020.
Output: 1000 rows
*/

SELECT listing_id,price,date
FROM calendar
INNER JOIN listings
ON listings.id=calendar.listing_id
where calendar.price between '$52.00'AND '$80.00' AND calendar.available AND calendar.date='5/21/2020'
ORDER BY calendar.price
limit 1000;

/*
Find how much is the lowest price per neighbourhood. 
Output: 43 rows
*/

select min(price),listings.neighbourhood_cleansed
from listings
inner join calendar
on listings.id=calendar.listing_id
where calendar.available and date='5/19/2020'
group by listings.neighbourhood_cleansed;

/*
Select all geometry coordinates and infromations about apartments in the neighbourhood which begins with 'ΑΓΙΟΣ ΕΛΕΥΘΕΡΙΟΣ'
Output: 29 rows
*/

select *
from geolocation 
left join listings
on geolocation.properties_neighbourhood=listings.neighbourhood_cleansed
where geolocation.properties_neighbourhood like 'ΑΓΙΟΣ_ΕΛΕΥΘΕΡΙΟΣ%';

/*
Find all the informations about private rooms at all the areas.
Output: 1121 rows
*/

select *
from listings
left join neighbourhoods
on listings.neighbourhood_cleansed=neighbourhoods.neighbourhood
where listings.room_type='Private room';

/*
Find all the aprtments and their addresses where the daily price is bigger than 100 dollars.
Output: 1249 rows
*/

select listings.id,listings_summary.neighbourhood
from listings
inner join listings_summary
on listings.id=listings_summary.id
where listings_summary.price>100;

/*
Find how much is the biggest number of reviews per neighbourhood.
Output: 44 rows
*/

select max(number_of_reviews),listings_summary.neighbourhood
from listings_summary
join calendar
on listings_summary.id=calendar.listing_id
where calendar.available
group by listings_summary.neighbourhood;

/*
Find the average price per neighbourhood only for the hostes who have a profile pic.
Output: 45 rows
*/

select avg(price),listings_summary.neighbourhood
from listings_summary
join listings
on listings_summary.id=listings.id
where listings.host_has_profile_pic
group by listings_summary.neighbourhood;

/*
Find all the comments from reviewers about cottages apartments in airbnb database.
Output: 40 rows
*/
SELECT listings.id,reviews.comments
from listings 
join reviews
on listings.id=reviews.listing_id
where listings.property_type='Cottage'


/*
Find the last review and comment of 2.300 available apartments.
Output:2300 rows
*/
select distinct id,reviews.date,reviews.comments
from reviews
join calendar 
on reviews.listing_id=calendar.listing_id
where calendar.available
order by reviews.date 
limit 2300



/*
Find the entire homes with less than 100 dollars in 4st of January 2020.
Output: 1 row
*/

SELECT COUNT(*) as number_of_apartments
FROM listings
inner join calendar 
on listings.id=calendar.listing_id
WHERE listings.room_type = 'Entire home/apt' and calendar.price>='$100.00' and calendar.price<='$200.00' and calendar.date='4/1/2020';






