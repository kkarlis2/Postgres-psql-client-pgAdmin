import pandas as pd

print("Reading movies_metadata file....")
data3= pd.read_csv("movies_metadata.csv")
print("Dropping duplicates...")
data3.drop_duplicates(subset="id",keep='first',inplace=True)
print("Return new file new_movies_metadata!")
data3.to_csv('new_movies_metadata.csv')



print("Reading credits file....")
data= pd.read_csv("credits.csv")
print("Dropping duplicates...")
data.drop_duplicates(subset="id",keep='first',inplace=True)
print("Check for non matched data on credits with movies_metadata and delete them...")
data=data[data.id.isin(data3.id)]
print("Return new file new_credits!")
data.to_csv('new_credits.csv')


print("Reading keywords file....")
data1= pd.read_csv("keywords.csv")
print("Dropping duplicates...")
data1.drop_duplicates(subset="id",keep='first',inplace=True)
print("Check for non matched data on keywords with movies_metadata and delete them...")
data1=data1[data1.id.isin(data3.id)]
print("Return new file new_keywords!")
data1.to_csv('new_keywords.csv')


print("Reading links file....")
data2= pd.read_csv("links.csv")
print("Dropping duplicates...")
data2.drop_duplicates(subset="tmdbId",keep='first',inplace=True)
print("Check for non matched data on links with movies_metadata and delete them...")
data2=data2[data2.tmdbId.isin(data3.id)]
print("Return new file new_links!")
data2.to_csv('new_links.csv')

print("Reading ratings_small file....")
data4=pd.read_csv("ratings_small.csv")
print("Check for non matched data on ratings_small with movies_metadata and delete them...")
data4=data4[data4.movieId.isin(data3.id)]
print("Return new file new_ratings_small!")
data4.to_csv("new_ratings_small.csv")

print("Reading ratings file....")
data5=pd.read_csv("ratings.csv")
print("Check for non matched data on ratings with movies_metadata and delete them...")
data5=data5[data5.movieId.isin(data3.id)]
print("Return new file new_ratings!")
data5.to_csv('new_ratings.csv')



