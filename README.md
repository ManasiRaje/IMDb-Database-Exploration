# IMDb-Database-Exploration
Create and explore a network from IMDb data

In this project, we will create and explore a network from the IMDb movie data.

(1) Run pagerank algorithm on the actor/actress network, look into those who are among top 10, do you know their names? List the top 10 famous movie celebrities in your opinion, what are their pagerank scores? Do you see any siginificant pairings amongst actors? Any major surprises, in the sense that well-known actors do not show up in the high pagerank list?

(2) Remove all movies with less than 5 actors/actresses on list, construct a movie network according to the set of actors/actresses, with weight assigned as the jaccard index of the actor sets of 2 movies. Now we have an undirected network instead. Do a community finding on the movie network; use the Fast Greedy Newman algorithm. Tag each community with the genres that appear in 20% or more of the movies in the community. Are these tags meaningful?

(3) Add the following nodes into the network, For each of them, return the top 5 nearest neighbors. Which communities does each of them belong to?
Batman v Superman: Dawn of Justice (2016)
Mission: Impossible - Rogue Nation (2015)
Minions (2015)

(4) From the ratings list, derive a function to predict the ratings of the above 3 movies using the movie network. (Hint: try to use the ratings of neighbor movies and movies in the same community.)

(5) Using a set of features train a regression model and predict the ratings of the 3 movies mentioned above. Specify the exact feature set you use and how you compute the numerical values for these features. Compute and state the goodness of fit for your regression model.
