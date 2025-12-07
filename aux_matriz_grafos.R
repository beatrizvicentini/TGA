arquivos <- c(
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_1.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_2.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_3.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_4.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_5.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_6.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_7.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_8.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_9.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_10.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_11.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_12.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_13.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_14.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_15.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_16.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_17.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_18.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_19.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_20.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_21.txt",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Adj_bin_22.txt"
)

# ---------------------------------------------------------------------------- #

for (i in seq_along(arquivos)[seq_along(arquivos) != 14]) {
  print(i)
  nome_bin <- paste0("Matriz_Adj_bin_", i)
  dados <- read.table(arquivos[i],
                      sep = ";",
                      header = TRUE,
                      stringsAsFactors = FALSE,
                      encoding = "UTF-8")
  assign(nome_bin, dados, envir = .GlobalEnv)
}

# ---------------------------------------------------------------------------- #

infos <- fread("C:/Users/catit/Downloads/bikeshare/datasets/INFO_ESTACOES.txt")
