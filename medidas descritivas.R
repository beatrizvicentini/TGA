indices <- setdiff(1:22, 14)

for(i in indices){
  if(i==1){
    nome <- paste0("Matriz_Adj_bin_", i)
    Matriz <- get(nome, envir = .GlobalEnv)
    arestas_media <- sum(Matriz)/2
  } else{
    nome <- paste0("Matriz_Adj_bin_", i)
    Matriz <- get(nome, envir = .GlobalEnv)
    arestas_media <- rbind(arestas_media, sum(Matriz)/2)
  }
}

# ---------------------------------------------------------------------------- #

objetos_bin <- ls(pattern = "^Matriz_Adj_bin_")
objetos_bin <- objetos_bin[1:min(21, length(objetos_bin))]

for(nome in objetos_bin){
  Matriz_adj_bin <- get(nome, envir = .GlobalEnv)
  if (which(objetos_bin == nome) <= 13){
  obj_name <- paste0("X_", which(objetos_bin == nome))
  } else {
    obj_name <- paste0("X_", (which(objetos_bin == nome)+1))
  }
  assign(obj_name, colSums(Matriz_adj_bin), envir = .GlobalEnv)
}

for(i in indices){
  if(i==1){
    nome <- paste0("X_", i)
    arestas <- get(nome, envir = .GlobalEnv)
  } else{
  nome <- paste0("X_", i)
  X <- get(nome, envir = .GlobalEnv)
  arestas <- rbind(arestas, X)
  }
}

# ---------------------------------------------------------------------------- #

objetos_comp <- ls(pattern = "^Matriz_Adj_comp_")
objetos_comp <- objetos_comp[1:min(21, length(objetos_comp))]

for(nome in objetos_comp){
  Matriz_adj_comp <- get(nome, envir = .GlobalEnv)
  if (which(objetos_comp == nome) <= 13){
    obj_name <- paste0("Y_", which(objetos_comp == nome))
  } else {
    obj_name <- paste0("Y_", (which(objetos_comp == nome)+1))
  }
  assign(obj_name, colSums(Matriz_adj_comp), envir = .GlobalEnv)
}

for(i in indices){
  if(i==1){
    nome <- paste0("Y_", i)
    pesos <- get(nome, envir = .GlobalEnv)
  } else{
    nome <- paste0("Y_", i)
    Y <- get(nome, envir = .GlobalEnv)
    pesos <- rbind(pesos, Y)
  }
}

# ---------------------------------------------------------------------------- #

for(i in indices){
  if(i==1){
    nome <- paste0("X_", i)
    X <- get(nome, envir = .GlobalEnv)
    grau_medio <- sum(X)/length(X)
  } else{
    nome <- paste0("X_", i)
    X <- get(nome, envir = .GlobalEnv)
    grau_medio <- rbind(grau_medio, sum(X)/length(X))
  }
}

for(i in indices){
  if(i==1){
    nome <- paste0("Y_", i)
    Y <- get(nome, envir = .GlobalEnv)
    pesos_media <- sum(Y)/length(Y)
  } else{
    nome <- paste0("Y_", i)
    Y <- get(nome, envir = .GlobalEnv)
    pesos_media <- rbind(pesos_media, sum(Y)/length(Y))
  }
}
