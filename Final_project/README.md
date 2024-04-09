Purpose
In the project we will deal with setting up a database consisting of data
movies as well as with a little analysis and visualization on the data.

Part A
Data:
The data can be found https://drive.google.com/drive/folders/13pdfFN9g1STUbkQoltkSmLkrs4VWLeEi . According to these data you should
create the base schema, the relationships between the tables as well as import
the data in the tables by setting the correct (in your opinion) data types to
all attributes.
Data Preprocessing:
For the needs of the work you should delete all duplicates from the tables
(except “ratings”) as well as delete movie data that does not exist in the
table “movies_metadata” but exist in one of the other tables.
Data pre-processing should be done in an automated way with any
programming language you want.
Deliverable Part A:
For part A you should deliver in a folder named “partA” a sql file
which contains the commands to create the tables and commands to create keys and
restrictions. Also, a file containing the data preprocessing commands,
with whatever language or system you chose. Also, write a short report (.pdf file) about the
steps you took in processing your data to store it
on the basis. Finally, you should deliver the ER diagram as an image file.
Bonus:
Add data from an external source to your database. These could be for
example movie stills, summaries, etc.

Part B
In this part you should calculate and visualize the following statistics with
using SQL and Python (by connecting to your database);
1
● Number of films per year
● Number of films per genre
● Number of films per genre and per year
● Average rating (rating) per genre (film)
● Number of ratings per user
● Average rating per user
Finally, create a view table and save for each user the number of ratings
he has done as well as the average score he has put and visualize it using
scatter plot. Do we get any insight from this relationship?
Deliverable Part B:
For part B you should deliver in a folder named “partB” a sql file
containing the commands you used to calculate all of the above as well
and the command to create the view_table. Inside the folder also put the Python file
which makes the connection to your database and visualizes the data. Add
also image files with the visualizations inside the folder.


