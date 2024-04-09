create table Amenity(
	amenity_name text,
	amenity_id int
);

update room
set amenities = regexp_replace(amenities,'[{}]','','g');

insert into Amenity
select distinct regexp_split_to_table(amenities,',') as amenity_name
from room
where amenities != '';

update Amenity
set amenity_name= regexp_replace(amenity_name,'"','','g');

ALTER TABLE Amenity DROP COLUMN amenity_id;
ALTER TABLE Amenity ADD amenity_id SERIAL PRIMARY KEY;

CREATE TABLE Amenities_room(
	listing_id int,
	amenity_id int,
	primary key(listing_id,amenity_id)
);

insert into Amenities_room
select r.id,a.amenity_id
from room r,amenity a
where r.amenities like '%' || a.amenity_name || '%';


ALTER TABLE Amenities_room
ADD FOREIGN KEY (amenity_id) references Amenity(amenity_id);

ALTER TABLE Amenities_room
ADD FOREIGN KEY(listing_id) references room(id);

ALTER TABLE room
DROP COLUMN amenities;