ALTER TABLE public.calendar
ADD PRIMARY KEY(listing_id,date,available);

ALTER TABLE public.geolocation
ADD foreign key(properties_neighbourhood)
references neighbourhoods(neighbourhood); 

ALTER TABLE public.calendar
ADD FOREIGN KEY(listing_id)
references listings(id);

ALTER TABLE public.reviews
ADD FOREIGN KEY(listing_id)
references listings(id);

ALTER TABLE public.reviews_summary
ADD FOREIGN KEY(listing_id)
references listings(id);

ALTER TABLE public.listings
ADD FOREIGN KEY(neighbourhood_cleansed)
references neighbourhoods(neighbourhood);

ALTER TABLE public.listings_summary
ADD FOREIGN KEY(id)
references listings(id);
