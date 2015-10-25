library('igraph')

# Create a weighted directed graph
table <- read.table(file.choose(), header=FALSE)
edgelist <- cbind(table[,1], table[,2])
directed_graph <- graph.edgelist(el=edgelist, directed=TRUE)
E(directed_graph)$weight <- table[,3]

# PageRank
page_rank <- page.rank(directed_graph, algo="prpack", vids=V(directed_graph), damping=0.85, directed=TRUE)

# Sort these to find the top 10
sorted_page_rank <- sort(page_rank$vector, decreasing=TRUE, index.return=TRUE)

# Top 10 PageRanks and their indices
top10.list <- sorted_page_rank$x[1:10]
top10.list.indices <- sorted_page_rank$ix[1:10]

# Map these indices to actors' names
actor.names = scan(file.choose(), what="", sep="\n")
length(V(directed_graph))
length(actor.names)
actor.names[1:10]

# Top 10 names
top10.names = actor.names[top10.list.indices]
top10.names

# Our own choice of top 10 actors
our.top10 = c(35093, 37718, 26673, 35921, 110498, 23562, 23899, 28318, 72132, 175756, 6803, 193580, 165849, 241728, 113624, 130679, 157594, 30250, 105447, 46607, 232139, 181489, 969, 72183, 119707, 204771, 17284)
actor.names[our.top10]
page_rank$vector[our.top10]

# Find the top 10 pairings according to edge weigts
edge_weights = E(directed_graph)$weight
sorted_weights = sort(edge_weights, decreasing=TRUE, index.return = TRUE)
top10.weights = sorted_weights$x[1:10]
length(unique(top10.weights))

cat("Top 10 pairings :-")
temp_row <- c()
actor_list <- c()
top10.weights.unique <- unique(top10.weights)
for (i in 1:length(top10.weights.unique))
{
  row_index_list = which(table[,3] == top10.weights.unique[i])
  for (j in 1:length(row_index_list))
  {
    temp_row <- c(table[row_index_list[j],])
    cat(actor.names[temp_row[[1]]], "\t", actor.names[temp_row[[2]]], "\t", temp_row[[3]])
    cat("\n")
    actor_list <- c(actor_list, temp_row[[1]], temp_row[[2]])
    temp_row <- c()
  }
}

# PageRank scores of the actors in top 10 pairings 
cat("\n")
cat("PageRank scores of the actors in top 10 pairings :-")
for (i in 1:length(actor_list))
{
  cat(actor.names[actor_list[[i]]], "\t", page_rank$vector[actor_list[[i]]])
  cat("\n")
}