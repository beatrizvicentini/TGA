infos <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/IDs_estacoes")

# ---------------------------------------------------------------------------- #

arquivos <- c(
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_01.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_02.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_03.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_04.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_05.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_06.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_07.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_08.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_09.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_10.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_11.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_12.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_13.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_14.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_15.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_16.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_17.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_18.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_19.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_20.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_21.RData",
  "C:/Users/catit/Downloads/bikeshare/datasets/redes/df_22.RData"
)

# ---------------------------------------------------------------------------- #

trata_chave <- function(df, informacoes = infos){
  df$ID_inicio <- df$ID
  df <- left_join(df, informacoes[, c("Codigos", "ID")], by = c("end_station_id" = "Codigos"))
  df$ID_fim <- df$ID.y
  df$ID.y <- NULL
  df$ID.x <- NULL
  return(df)
}

cria_matriz_adj_comp <- function(df, dimensao = 852){
  inicio <- NA
  fim <- NA
  Matriz_adj <- matrix(0,nrow = dimensao, ncol = dimensao)
  for (i in 1:nrow(df)) {
    inicio <- df[i,]$ID_inicio
    fim <- df[i,]$ID_fim
    Matriz_adj[inicio, fim] <- Matriz_adj[inicio, fim] + 1
  }
  Matriz_adj_completa <- Matriz_adj + t(Matriz_adj)
  diag(Matriz_adj_completa) <- 0
  return(Matriz_adj_completa)
}

cria_matriz_adj_bin<- function(Matriz_adj_completa){
  Matriz_adj_bin <- Matriz_adj_completa
  Matriz_adj_bin[which(Matriz_adj_bin >0)] <- 1
  return(Matriz_adj_bin)
}

# ---------------------------------------------------------------------------- #

for (i in seq_along(arquivos)[seq_along(arquivos) != 14]){
  print(i)
  nome_comp <- paste0("Matriz_Adj_comp_", i)
  nome_bin  <- paste0("Matriz_Adj_bin_", i)
  env_temp <- new.env()
  load(arquivos[i], envir = env_temp)
  print("carregando arquivo")
  nome_original <- ls(env_temp)
  df <- env_temp[[nome_original]]
  df_tratado <- trata_chave(df)
  print("tratando chave")
  matriz_comp <- cria_matriz_adj_comp(df_tratado)
  matriz_bin  <- cria_matriz_adj_bin(matriz_comp)
  print("criando base")
  assign(nome_comp, matriz_comp, envir = .GlobalEnv)
  assign(nome_bin , matriz_bin , envir = .GlobalEnv)
}

# ---------------------------------------------------------------------------- #

Matriz_completa <-     Matriz_Adj_comp_1+
                       Matriz_Adj_comp_2+
                       Matriz_Adj_comp_3+
                       Matriz_Adj_comp_4+
                       Matriz_Adj_comp_5+
                       Matriz_Adj_comp_6+
                       Matriz_Adj_comp_7+
                       Matriz_Adj_comp_8+
                       Matriz_Adj_comp_9+
                       Matriz_Adj_comp_10+
                       Matriz_Adj_comp_11+
                       Matriz_Adj_comp_12+
                       Matriz_Adj_comp_13+
                      #Matriz_Adj_comp_14+
                       Matriz_Adj_comp_15+
                       Matriz_Adj_comp_16+
                       Matriz_Adj_comp_17+
                       Matriz_Adj_comp_18+
                       Matriz_Adj_comp_19+
                       Matriz_Adj_comp_20+
                       Matriz_Adj_comp_21+
                       Matriz_Adj_comp_22
rm(Matriz_Adj_1,
     Matriz_Adj_2,
     Matriz_Adj_3,
     Matriz_Adj_4,
     Matriz_Adj_5,
     Matriz_Adj_6,
     Matriz_Adj_7,
     Matriz_Adj_8,
     Matriz_Adj_9,
     Matriz_Adj_10,
     Matriz_Adj_11,
     Matriz_Adj_12,
     Matriz_Adj_13,
     #Matriz_Adj_14,
     Matriz_Adj_15,
     Matriz_Adj_16,
     Matriz_Adj_17,
     Matriz_Adj_18,
     Matriz_Adj_19,
     Matriz_Adj_20,
     Matriz_Adj_21,
     Matriz_Adj_22)

# ---------------------------------------------------------------------------- #

which(apply(Matriz_completa,2,sum)==max(apply(Matriz_completa,1,sum)))
quantile(apply(Matriz_completa,1,sum))
hist(apply(Matriz_completa,1,sum))

# ---------------------------------------------------------------------------- #

dir_saida <- "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes"
if (!dir.exists(dir_saida)){
  dir.create(dir_saida, recursive = TRUE)
}

# ---------------------------------------------------------------------------- #

objetos_comp <- ls(pattern = "^Matriz_Adj_comp_")
objetos_bin  <- ls(pattern = "^Matriz_Adj_bin_")

# ---------------------------------------------------------------------------- #

for (nome in objetos_comp){
  mat <- get(nome)
  df <- as.data.frame(mat)
  caminho_arquivo <- file.path(dir_saida, paste0(nome, ".txt"))
  fwrite(df, file = caminho_arquivo, sep = ";")
  print(paste("Arquivo salvo:", caminho_arquivo))
}

# ---------------------------------------------------------------------------- #

for (nome in objetos_bin){
  mat <- get(nome)
  df  <- as.data.frame(mat)
  caminho_arquivo <- file.path(dir_saida, paste0(nome, ".txt"))
  fwrite(df, file = caminho_arquivo, sep = ";")
  print(paste("Arquivo salvo:", caminho_arquivo))
}

# ---------------------------------------------------------------------------- #

Matriz_completa_df <- as.data.frame(Matriz_completa)
fwrite(Matriz_completa_df, file = "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes/Matriz_Completa.txt", sep = ";")
