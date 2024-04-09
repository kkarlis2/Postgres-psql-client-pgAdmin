CREATE TABLE public.Location
AS(SELECT id, street, neighbourhood, neighbourhood_cleansed, city, state,
zipcode, market, smart_location, country_code, country, latitude, longitude,
is_location_exact
  FROM listings_copy);
  
  
ALTER TABLE listings_copy
DROP COLUMN street,
DROP COLUMN neighbourhood,
DROP COLUMN neighbourhood_cleansed,
DROP COLUMN city,
DROP COLUMN state,
DROP COLUMN zipcode,
DROP COLUMN market,
DROP COLUMN smart_location,
DROP COLUMN country_code,
DROP COLUMN country,
DROP COLUMN latitude,
DROP COLUMN longitude,
DROP COLUMN is_location_exact;

ALTER TABLE public.location
ADD PRIMARY KEY(id);

ALTER TABLE public.Location
ADD FOREIGN KEY(id)
REFERENCES listings_copy(id);

ALTER TABLE public.listings_copy
DROP CONSTRAINT listings_copy_neighbourhood_cleansed_fkey;

ALTER TABLE public.location
ADD FOREIGN KEY(neighbourhood_cleansed)
references neighbourhoods_copy(neighbourhood);