Purpose:
We continue with a few more normalization changes and then run queries
grouping and aggregation.
Prerequisites:
We consider that the basis is in the situation described in the 3rd Task.
Job Requirements:
Part A
● Notice that the values of the amenities field in the room_table Table which
we created in the previous work are not individual. In order to do
normalization, create a new Amenity Table with fields amenity_id and
amenity_name. Store in amenity_name all its unique individual values
amenities field after they have been processed appropriately (You can use the
Postgres string functions regexp_split_to_table(), regexp_replace() and/or any
others you find convenient). Declare amenity_id as an auto field
increment and make the Primary Key.
● Do the actions necessary to connect the Table
room_table with Amenity. These actions may include creation
new fields, definition of Primary/Foreign Keys up to creation of a new Table.
● Delete the amenities field from the room_table.
● Update the base's ER diagram with the changes.
● Question: Is our database in BCNF Normal Form? Make excuses for each
table. If not, identify the “bad” Functional Dependencies.
Write all the database configuration commands of Part A into a part1.sql file and the
last BCNF question in a BCNF.docx or BCNF.pdf file. For the ER hand it over
final image file.
Part B
Make 5 aggregation questions that make sense.
● All must have at least one join
● 2 of the queries should have at least one outer join.
1
● At least 2 of the queries should have a WHERE clause.
● At least 2 of the queries should have a GROUP BY..
● At least 2 of the queries should have a HAVING.
● At least 1 of the queries must use the geolocation table.
● All the tables you made in the previous one should be used
exercise (table Host, table Room, table Price, table Location)
Write all queries in a part2.sql file.
Add short query descriptions and result sets to
same file as comments format. E.g:
/* Find all rentals from all houses that took place in the 31st of
December 2017
Output: 9663 rows
*/
SELECT listings.id, listings.listing_url, calendar.date_attr
FROM listings
INNER JOIN calendar
ON listings.id = calendar.listing_id
WHERE calendar.date_attr = '2017-12-31';
