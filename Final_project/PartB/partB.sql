/* Number of movies per time */
select count(runtime) as movies,runtime 
from movies_metadata
group by runtime;

/*Number of movies by genre */

create table example AS 
SELECT genres,id
from movies_metadata;

update example set genres = regexp_replace(genres,'[\[|\]{}:]','','g');
update example set genres = regexp_replace(genres,'name','','g');
update example set genres = regexp_replace(genres,'id','','g');
update example set genres = regexp_replace(genres,'[":[:digit:],"]','','g');


select count(genres) as number_of_movies,genres
from example
where genres is not null and genres!=''
group by genres;

/* Number of movies per genre and per time */.
alter table example
add column runtime int;

update example
set runtime=movies_metadata.runtime
from movies_metadata
where example.id=movies_metadata.id;

alter table example
add column genres_and_runtime text;

UPDATE example 
SET genres_and_runtime = CONCAT(genres, '   Runtime  ', runtime)
where genres!='' and genres is not null;

select count(genres_and_runtime) as number_of_movies,genres_and_runtime
from example
where genres!='' and genres is not null
group by genres_and_runtime;

/* Average rating per genre */
alter table ratings_small
add column genres text;

update ratings_small
set genres=example.genres
from example
where ratings_small.movieid=example.id;

select avg(rating) as average_rating,genres
from ratings_small
where genres!='' and genres is not null
group by genres;

/* Number of ratings per user */

select count(userid) as number_of_ratings,userid
from ratings_small
group by userid;

/* Average rating per user */

select avg(rating) as average_rating,userid
from ratings_small
group by userid;

/* View table */

create table view(
	userid int,
	ratings int,
	average_ratings double precision
);

insert into view(userid,ratings,average_ratings)
select userid,count(userid),avg(rating)
from ratings_small
group by userid;