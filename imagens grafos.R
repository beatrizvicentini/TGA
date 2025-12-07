
arestas <- c(1,2, 2,3, 3,4, 3,5, 4,5)
g <- graph(arestas, directed = FALSE)
comunidades <- c(1,1,2,2,2) 
cores <- c("lightpink", "lightpink", "lightgreen", "lightgreen", "lightgreen")
par(mar = c(0.2, 0.2, 0.2, 0.2))

plot(
  g,
  vertex.color = "white",
  vertex.size = 40,
  vertex.label.color = "black",  
  vertex.label.cex = 1.5,
  edge.color = "black",
  layout = layout_in_circle(g) 
)

# ---------------------------------------------------------------------------- #

plot(
  g,
  vertex.color = cores,
  vertex.size = 40,
  vertex.label.color = "black",  
  vertex.label.cex = 1.5,
  edge.color = "black",
  layout = layout_in_circle(g) 
)

E(g)$weight <- c(0.8, 0.1, 0.8, 0.8, 0.6) 

plot(
  g,
  vertex.color = "white",
  vertex.size = 40,
  vertex.label.color = "black",  
  vertex.label.cex = 1.5,
  edge.color = "black",
  edge.label = E(g)$weight,     
  edge.label.cex = 1.2,         
  edge.label.color = "black",     
  layout = layout_in_circle(g) 
)

shortest_paths(g, from = 1, to = 5, weights = E(g)$weight)
mst(g, weights = E(g)$weight)   

# ---------------------------------------------------------------------------- #
{
arestas1 <- c(1,2, 2,3, 3,4, 3,5, 4,5) 
g1 <- graph(arestas1, directed = FALSE)

arestas2 <- c(1,2, 1,4, 2,3, 2,4, 3,5, 4,5)
g2 <- graph(arestas2, directed = FALSE)

arestas3 <- c(1,4, 2,3, 2,5, 3,4, 3,5)
g3 <- graph(arestas3, directed = FALSE)

# ---------------------------------------------------------------------------- #

comunidades1 <- c(1,1,2,2,2)
comunidades2 <- c(1,1,2,1,2)
comunidades3 <- c(1,2,2,1,2)

cores1 <- c("lightpink", "lightpink", "lightgreen", "lightgreen", "lightgreen")
cores2 <- c("lightpink", "lightpink", "lightgreen", "lightpink", "lightgreen")
cores3 <- c("lightpink", "lightgreen", "lightgreen", "lightpink", "lightgreen")

# ---------------------------------------------------------------------------- #

par(mar = c(3, 3, 3, 3))
par(mfrow = c(1, 3))

plot(
  g1,
  vertex.color = cores1,
  vertex.size = 40,
  vertex.label.color = "black", 
  vertex.label.cex = 1.5,
  edge.color = "black",
  layout = layout_in_circle(g1)
)
title("t = 1", cex.main = 1.8)
box()

plot(
  g2,
  vertex.color = cores2,
  vertex.size = 40,
  vertex.label.color = "black", 
  vertex.label.cex = 1.5,
  edge.color = "black",
  layout = layout_in_circle(g2) 
)
title("t = 2", cex.main = 1.8)
box()

plot(
  g3,
  vertex.color = cores3,
  vertex.size = 40,
  vertex.label.color = "black", 
  vertex.label.cex = 1.5,
  edge.color = "black",
  layout = layout_in_circle(g3) 
)
title("t = 3", cex.main = 1.8)
box()
}

# ---------------------------------------------------------------------------- #

par(xpd = NA)  
arrows(
  x0 = -5.35, y0 = 0,
  x1 = -4.85, y1 = 0,
  length = 0.10, lwd = 1.5
)


arrows(
  x0 = -1.95, y0 = 0,
  x1 = -1.45, y1 = 0,
  length = 0.10, lwd = 1.5
)


par(xpd = FALSE)
