create table Imdb_Movies(
   title varchar(200),
   original_title varchar(200),
   year varchar(20),
   date_published varchar(20),
   genre varchar(40),
   duration int,
   country varchar(230),
   language varchar(170),
   director varchar(70),
   writer varchar(70),
   production_company varchar(110),
   actors varchar(420),
   description varchar(410),
   avg_vote varchar(10),
   votes int,
   budget varchar(20),
   usa_gross_income varchar(20),
   worlwide_gross_income varchar(20),
   metascore varchar(10),
   reviews_from_users varchar(10),
   reviews_from_critics int,
   id int
);

delete from imdb_movies
where id is null;

alter table imdb_movies
add primary key(id);

alter table imdb_movies
add foreign key(id)
references movies_metadata(id);