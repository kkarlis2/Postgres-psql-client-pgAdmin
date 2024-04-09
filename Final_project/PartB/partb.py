import psycopg2
import pandas as pd
import matplotlib.pyplot as plt
import plotly.express as px
from mpl_toolkits.mplot3d import Axes3D

# Update connection string information
host = "kostaskarlis2001.postgres.database.azure.com"
dbname = "postgres"
user = "p3190077@kostaskarlis2001"
password = "Kostaskarlis2001"
sslmode = "require"

# Construct connection string
conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
conn = psycopg2.connect(conn_string)
print("Connection established")

cursor = conn.cursor()

#Number of movies per time
q1 = (
      'select count(runtime) as number_of_movies,runtime '
      'from movies_metadata '
      'group by runtime; '
      )

r1=pd.read_sql(q1,conn)


fig1 = px.bar(r1, x="runtime", y="number_of_movies", orientation='v', title='Number of movies per time')
print("Number of movies per time completed")
fig1.show()

#Number of movies per genre

q2= (
    'select count(genres) as number_of_movies,genres '
    'from example '
    'group by genres;'
    )
r2=pd.read_sql(q2,conn)


fig2 = px.bar(r2, x="genres", y="number_of_movies", orientation='v', title='Number of movies per genres')
print("Number of movies per genre completed")
fig2.show()

#Number of movies per genre and per time
q3=(
    'select count(genres) as number_of_movies,genres_and_runtime '
    'from example '
    'where genres!=\'\' and genres is not null '
    'group by genres_and_runtime;'
    )

r3=pd.read_sql(q3,conn)


fig3=px.bar(r3,x="genres_and_runtime",y="number_of_movies",orientation='v',title='Number of movies per genres and time')
print("Number of movies per genre and time completed")
fig3.show()

#Average rating per genre

q4=(
    'select avg(rating) as average_rating,genres '
    'from ratings_small '
    'where genres!=\'\' and genres is not null '
    'group by genres;'
    )
r4=pd.read_sql(q4,conn)

fig4=px.bar(r4,x='genres',y='average_rating',orientation='v',title='Average rating per genre')
print('Average rating per genre completed')
fig4.show()

#Number of ratings per user

q5=(
    'select count(userid) as number_of_ratings,userid '
    'from ratings_small '
    'group by userid;'
    )
r5=pd.read_sql(q5,conn)

fig5=px.bar(r5,x='userid',y='number_of_ratings',orientation='v',title='Number of ratings per user')
print('Number of ratings per user completed')
fig5.show()
#Average rating per user

q6=(
    'select avg(rating) as average_rating,userid '
    'from ratings_small '
    'group by userid;'
    )
r6=pd.read_sql(q6,conn)

fig6=px.bar(r6,x='userid',y='average_rating',orientation='v',title='Average rating per user')
print('Average rating per user completed')
fig6.show()

#3d schema view table
q7=(
    'select * from view;'
    )
r7=pd.read_sql(q7,conn)
fig7=plt.figure()
ax=fig7.add_subplot(111,projection='3d')

x=r7['userid']
y=r7['ratings']
z=r7['average_ratings']

ax.scatter(x,y,z)
ax.set_xlabel("User id")
ax.set_ylabel("Ratings")
ax.set_zlabel("Average Ratings")

print('View table schema completed')
plt.show()

# Clean up
conn.commit()
cursor.close()
conn.close()
