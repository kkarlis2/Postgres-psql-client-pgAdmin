Job Requirements:
In this Task we make changes to our base starting from the state
which had as we defined it in Task 1. For all these changes, deliverable will be 6
sql files and an image file.
1. Host Table - host_table.sql file
● Create a new Host table that will have the following Listings fields:
table Host: host_id, host_url, host_name, host_since, host_location, host_about,
host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost,
host_thumbnail_url, host_picture_url, host_neighborhood, host_listings_count,
host_total_listings_count, host_verifications, host_has_profile_pic, host_identity_verified,
calculated_host_listings_count. That is, these fields should take the values of Listings.
● Make Host fields have names without the 'host_' prefix.
● Delete the duplicated host fields from Listings except host_id.
● Declare an appropriate Primary Key on the Host.
● Declare appropriate Foreign Key in Listings with reference to Host.
2. Room table - room_table.sql file
● Create a new Room table that will have the following Listings fields:
table Room: listing_id, accommodates, bathrooms, bedrooms, beds, bed_type,
1
amenities, square_feet, price, weekly_price, monthly_price, security_deposit. That is, the
these fields to take the values of Listings.
● Delete duplicated room fields from Listings.
● Declare appropriate Foreign Key on Room with reference to Listings.
● Delete the copied fields from Listings except listing_id.
3. Price table - price_table.sql file
● Create a new Price table that will have the following Listings fields:
table Price: listing_id, price, weekly_price, monthly_price, security_deposit, cleaning_fee,
guests_included, extra_people, minimum_nights, maximum_nights,
minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights,
maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm.
That is, these fields should take the values of Listings.
● Change decimal and money field types to new appropriate
type (you may need to remove some hint:replace() symbol).
● Delete the duplicated price fields from Listings.
● Declare appropriate Foreign Key in Price with reference to Listings.
● Delete the copied fields from Listings except listing_id.
4. Location table - location_table.sql file
● Create a new Location table that will have the following Listings fields:
table Location: listing_id, street, neighborhood, neighborhood_cleansed, city, state,
zipcode, market, smart_location, country_code, country, latitude, longitude,
is_location_exact. That is, these fields should take the values of Listings.
● Delete the duplicated location fields from Listings.
● Declare an appropriate Foreign Key in the location with reference to Listings.
● Delete the copied fields from Listings except listing_id.
● Unlink the listing table with the neighborhood table and associate
match the location table with the neighborhood table.
5. Calendar table - calendar.sql file
● Similarly to the corresponding Price fields, remove the symbols needed to
allow ALTER to decimal field type for price fields,
adjustable_price, as well as convert the available field to a boolean field.
For all Tables
● Rename all tables from plural to singular. That is, Listing,
Review, etc. (do not change the names of the original tables you had in tasks 1
and 2 Submit these orders on file
all_tables.sql
● Change the ER diagram to match the changes you made. Of course
not all changes will be displayed in the ER and we also remind in tables with
2
very large number of fields just draw some indicative and not all.
Deliver the ER as an image file
