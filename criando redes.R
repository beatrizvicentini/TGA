infos <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/IDs_estacoes")

# ---------------------------------------------------------------------------- #

estudo <- df_01
estudo$ID_inicio <- estudo$ID
estudo <- left_join(estudo, infos[, c("Codigos", "ID")], by = c( "end_station_id" = "Codigos"))
estudo$ID_fim <- estudo$ID.x
estudo$ID <- NULL
estudo$ID.x <- NULL

# ---------------------------------------------------------------------------- #

inicio <- NA
fim <- NA
dimensao <- 852 #max(unique(base_completa$ID)) #852
Matriz_adj <- matrix(0,nrow = dimensao, ncol = dimensao)

for (i in 1:nrow(estudo)) {
  inicio <- estudo[i,]$ID_inicio
  fim <- estudo[i,]$ID_fim
  Matriz_adj[inicio, fim] <- Matriz_adj[inicio, fim] + 1
}

# ---------------------------------------------------------------------------- #

Matriz_adj_completa <- Matriz_adj + t(Matriz_adj)
max(Matriz_adj_completa)
diag(Matriz_adj_completa) <- 0
Matriz_adj_bin <- Matriz_adj_completa
Matriz_adj_bin[which(Matriz_adj_bin >0)] <- 1

# ---------------------------------------------------------------------------- #

g_unweighted <- graph_from_adjacency_matrix(Matriz_adj_bin, mode = "undirected")
par(mar = c(0.2, 0.2, 0.2, 0.2))
plot(
  g_unweighted,
  vertex.color = "white",
  vertex.size = 15,
  vertex.label.color = "black",  
  vertex.label.cex = 1,
  edge.color = "black",
  layout = layout_nicely(g_weighted)
)

# ---------------------------------------------------------------------------- #

write.csv(Matriz_adj_completa, file = "C:/Users/catit/Downloads/bikeshare/datasets/redes/matriz_completa_01.csv")
write.csv(Matriz_adj_bin, file = "C:/Users/catit/Downloads/bikeshare/datasets/redes/matriz_binaria_01.csv")
