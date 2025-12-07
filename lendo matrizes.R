dir_path <- "C:/Users/catit/Downloads/bikeshare/datasets/redes/matrizes"

indices <- setdiff(1:22, 14)

for(i in indices){
  file_path <- file.path(dir_path, paste0("Matriz_Adj_bin_", i, ".txt")) 
  mat <- as.matrix(read.table(file_path, header = T, sep = ";"))
  obj_name <- paste0("Matriz_Adj_bin_", i)
  assign(obj_name, mat, envir = .GlobalEnv)
}


for(i in indices){
  file_path <- file.path(dir_path, paste0("Matriz_Adj_comp_", i, ".txt")) 
  mat <- as.matrix(read.table(file_path, header = T, sep = ";"))
  obj_name <- paste0("Matriz_Adj_comp_", i)
  assign(obj_name, mat, envir = .GlobalEnv)
}



infos <- fread("C:/Users/catit/Downloads/bikeshare/datasets/INFO_ESTACOES.txt")
