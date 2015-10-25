library('igraph')

# Create a weighted undirected graph
table <- read.table(file.choose(), header = FALSE)
edgelist <- cbind(table[,1], table[,2])
undirected_graph <- graph.edgelist(el=edgelist, directed=FALSE)
E(undirected_graph)$weight <- table[,3]

# community structure
is.simple(undirected_graph) # TRUE
cs_fg <- fastgreedy.community(undirected_graph)
mean(cs_fg$modularity)
table(cs_fg$membership)
png(filename = "cs_fg.png")
plot(cs_fg, undirected_graph, vertex.size=2, vertex.label=NA, edge.color="gray", edge.width=1)
title(main="Community Structure using Fast Greedy Newman Algorithm", sub=paste("Modularity", modularity(cs_fg)))

