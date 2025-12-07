processa_grafos_bin <- function(lista_nomes, dir_plot, layout) {
  if (length(lista_nomes) == 0) {
    message("Processamento concluído!")
    return(invisible(NULL))
  }
  nome_atual <- lista_nomes[1]
  message("Processando: ", nome_atual)
  Matriz_adj_bin <- get(nome_atual, envir = .GlobalEnv)
  storage.mode(Matriz_adj_bin) <- "numeric"
  g_unweighted <- graph_from_adjacency_matrix(
    Matriz_adj_bin,
    mode = "undirected"
  )
  arquivo_png <- file.path(dir_plot, paste0(nome_atual, ".png"))
  png(arquivo_png, width = 2000, height = 2000, res = 250)
  par(mar = c(0.2, 0.2, 0.2, 0.2))
  plot(
    g_unweighted,
    vertex.color = "black",
    vertex.size = 1,
    vertex.label = NA,    
    edge.color = "gray",
    layout = layout
  )
  
  dev.off()
  message("Salvo: ", arquivo_png)
  processa_grafos_bin(lista_nomes[-1], dir_plot, layout)
}

# ---------------------------------------------------------------------------- #

layout_coords <- infos[, c(3,4)]
layout_coords <- as.matrix(
  data.frame(
    lapply(layout_coords, function(x) as.numeric(as.character(x)))
  )
)

dir_plot <- "C:/Users/catit/Downloads/bikeshare/datasets/redes/imagens"
dir.create(dir_plot, recursive = TRUE, showWarnings = FALSE)
objetos_bin <- ls(pattern = "^Matriz_Adj_bin_")

# ---------------------------------------------------------------------------- #

processa_grafos_bin(objetos_bin, dir_plot, layout_coords)


