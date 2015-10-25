# IMDb-Database-Exploration
Create and explore a network from IMDb data

In this project, we will create and explore a network from the IMDb movie data. The data is available at IMDb Interface. We are going to study the properties of actor/actress network and movies. You can also
also find a cleaned up version of the data at this Box link.
1. Download actors.list.gz, actresses.list.gz (or use the
actor_movies.txt and actress_movies.txt files from the
cleaned up data), merge those 2 lists into one file, and remove
all actors/actressess with less than 5 (so actors who have acted in
four or fewer number of movies) movies; Note that you will have
to parse the data in these lists as accurately as possible to extract
the entities consistently and create the network. So plan on
spending some time in cleaning the data set.
2. Construct a weighted directed graph G(V;E) from the list, while
V = fall actors/actressess in listg
Si = fmji 2 V;m is a movie in which i has actedg
E = f(i; j)ji; j 2 V; Si \ Sj 6= g
and for each directed Edge i ! j, a weight is assigned as jSi\Sj j
jSij .
3. Run pagerank algorithm on the actor/actress network, look into
those who are among top 10, do you know their names? List the
top 10 famous movie celebrities in your opinion, what are their
pagerank scores? Do you see any siginificant pairings amongst
actors? Any major surprises, in the sense that well-known actors
do not show up in the high pagerank list?
1
4. Similarly, remove all movies with less than 5 actors/actresses on
list, construct a movie network according to the set of actors/actresses,
with weight assigned as the jaccard index of the actor sets of 2
movies. Now we have an undirected network instead.
5. Do a community finding on the movie network; use the Fast Greedy
Newman algorithm. Tag each community with the genres that
appear in 20% or more of the movies in the community. Are these
tags meaningful?
6. Add the following nodes into the network, For each of them, return
the top 5 nearest neighbors. Which communities does each
of them belong to?
Batman v Superman: Dawn of Justice (2016)
Mission: Impossible - Rogue Nation (2015)
Minions (2015)
7. Download the ratings list, derive a function to predict the ratings
of the above 3 movies using the movie network. (hint: try to use
the ratings of neighbor movies and movies in the same community.)
8. Using a set of features that include the following:
 top 5 pageranks of the actors (five floating point values) in
each movie.
 if the director is one of the top 100 directors or not (101
boolean values). These are directors of the top 100 movies
from the "IMDb top 250". You can also find a list of these
movies in the ratings.list.gz file.
train a regression model and predict the ratings of the 3 movies
mentioned above. Specify the exact feature set you use and how
you compute the numerical values for these features. Compute
and state the goodness of fit for your regression model.
2
