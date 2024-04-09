CREATE TABLE public.Host
AS (SELECT DISTINCT host_id, host_url, host_name, host_since, host_location, host_about,
host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost,
host_thumbnail_url, host_picture_url, host_neighbourhood, host_listings_count,
host_total_listings_count, host_verifications, host_has_profile_pic, host_identity_verified,
calculated_host_listings_count 
   FROM listings_copy);

ALTER TABLE public.Host 
RENAME COLUMN host_id to id,
RENAME COLUMN host_url to url,
RENAME COLUMN host_name to name,
RENAME COLUMN host_since to since,
RENAME COLUMN host_location to location,
RENAME COLUMN host_about to about,
RENAME COLUMN host_response_time to response_time,
RENAME COLUMN host_response_rate to response_rate,
RENAME COLUMN host_accepatance_rate to acceptance_rate,
RENAME COLUMN host_is_superhost to is_superhost,
RENAME COLUMN host_thumbnail_url to thumbnail_url,
RENAME COLUMN host_picture_url to picture_url,
RENAME COLUMN host_neighbourhood to neighbourhood,
RENAME COLUMN host_listings_count to listings_count,
RENAME COLUMN host_total_listings_count to total_listings_count,
RENAME COLUMN host_verifications to verifications,
RENAME COLUMN host_has_profile_pic to has_profile_pic,
RENAME COLUMN host_identity_verified to indentity_verified,
RENAME COLUMN calculated_host_listings_count to calculated_listings_count;

ALTER TABLE public.listings_copy 
DROP COLUMN host_url,
DROP COLUMN host_name,
DROP COLUMN host_since,
DROP COLUMN host_location,
DROP COLUMN host_about,
DROP COLUMN host_response_time,
DROP COLUMN host_response_rate,
DROP COLUMN host_acceptance_rate,
DROP COLUMN host_is_superhost,
DROP COLUMN host_thumbnail_url,
DROP COLUMN host_picture_url,
DROP COLUMN host_neighbourhood,
DROP COLUMN host_listings_count,
DROP COLUMN host_total_listings_count,
DROP COLUMN host_verifications,
DROP COLUMN host_has_profile_pic,
DROP COLUMN host_identity_verified,
DROP COLUMN calculated_host_listings_count;

ALTER TABLE public.Host
ADD PRIMARY KEY (id);

ALTER TABLE public.listings_copy
ADD FOREIGN KEY(host_id)
REFERENCES host(id);

