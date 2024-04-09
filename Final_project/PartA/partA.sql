create table Credits(
   cast1 text,
   crew text,
   id int
);

create table Keywords(
   id int,
   keywords text
);

create table Links(
   movieId int,
   imdbId int,
   tmdbId int
);

create table Movies_Metadata(
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   id int,
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date varchar(10),
   revenue bigint,
   runtime int,
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);

create table Ratings_Small(
   userId int,
   movieId int,
   rating float,
   timestamp int
);

alter table credits
add primary key(id);

alter table keywords
add primary key(id);

alter table links
add primary key(movieId,imdbid,tmdbid);

alter table movies_metadata
add primary key(id);

alter table ratings_small
add primary key(userId,movieId);

alter table credits
add foreign key(id) references movies_metadata(id);

alter table keywords
add foreign key(id) references movies_metadata(id);

alter table links
add foreign key(tmdbid) references movies_metadata(id);

alter table ratings_small
add foreign key(movieid) references movies_metadata(id);
