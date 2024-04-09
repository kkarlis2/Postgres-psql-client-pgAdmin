vacuum(analyze) amenities_room;
vacuum(analyze) amenity;
vacuum(analyze) calendar;
vacuum(analyze) calendar_copy;
vacuum(analyze) geolocation;
vacuum(analyze) geolocation_copy;
vacuum(analyze) host;
vacuum(analyze) listing_copy;
vacuum(analyze) listing_summary_copy;
vacuum(analyze) listings;
vacuum(analyze) listings_summary;
vacuum(analyze) location;
vacuum(analyze) neighbourhood_copy;
vacuum(analyze) neighbourhoods;
vacuum(analyze) price;
vacuum(analyze) review_copy;
vacuum(analyze) review_summary_copy;
vacuum(analyze) reviews;
vacuum(analyze) reviews_summary;
vacuum(analyze) room;

/* Query 1 */
set enable_seqscan=off;
CREATE INDEX listing_copy_index ON listing_copy(host_id);

/* Query 2 */
set enable_seqscan=off;
create index listings_index on listings(guests_included,id)
where listings.guests_included>5;

/* Query 3 */
set enable_seqscan=off;
create index price_index2 on price(weekly_price)
where weekly_price<200;

/* Query 4 */
set enable_seqscan=off;
create index price_index1 on price(id);

/* Query 5 */
set enable_seqscan=off;
create index geolocation_index on geolocation(properties_neighbourhood);

/* Query 6 */
set enable_seqscan=off;
create index location_index on location(neighbourhood);

/* Query 7 */
set enable_seqscan=off;
create index location_index2 on location(id);