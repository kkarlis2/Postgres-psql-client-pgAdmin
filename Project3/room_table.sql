CREATE TABLE public.Room
AS(SELECT id, accommodates, bathrooms, bedrooms, beds, bed_type,
amenities, square_feet, price, weekly_price, monthly_price, security_deposit
  FROM listings_copy);
  

ALTER TABLE public.listings_copy
DROP COLUMN accommodates,
DROP COLUMN bathrooms,
DROP COLUMN bedrooms,
DROP COLUMN beds,
DROP COLUMN bed_type,
DROP COLUMN amenities,
DROP COLUMN square_feet;

ALTER TABLE public.room
ADD PRIMARY KEY(id);

ALTER TABLE public.room
ADD FOREIGN KEY(id)
REFERENCES listings_copy(id);
