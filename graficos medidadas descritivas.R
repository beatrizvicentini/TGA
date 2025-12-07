datas <-  as.Date(c("2024-01-01"
           , "2024-02-01"
           , "2024-03-01"
           , "2024-04-01"
           , "2024-05-01"
           , "2024-06-01"
           , "2024-07-01"
           , "2024-08-01"
           , "2024-09-01"
           , "2024-10-01"
           , "2024-11-01"
           , "2024-12-01"
           , "2025-01-01"
           , "2025-03-01"
           , "2025-04-01"
           , "2025-05-01"
           , "2025-06-01"
           , "2025-07-01"
           , "2025-08-01"
           , "2025-09-01"
           , "2025-10-01"), format = "%Y-%m-%d")

df <- data.frame(indice = datas,
                         grau = grau_medio,
                       aresta = Aresta_macro,
                       peso = pesos_media)

p1 <- ggplot(df, aes(x = indice, y = grau)) +
  geom_line(color = "springgreen2", size = 1) +
  geom_point(color = "springgreen2", size = 2) +
  labs(title = "Grau médio", x = "Índice", y = "Valor") +
  theme_minimal()


p2 <- ggplot(df, aes(x = indice, y = peso)) +
  geom_line(color = "violetred3", size = 1) +
  geom_point(color = "violetred3", size = 2) +
  labs(title = "Peso médio", x = "Índice", y = "Valor") +
  theme_minimal()


p3 <- ggplot(df, aes(x = factor(indice), y = grau)) +
  geom_bar(stat = "identity", fill = "springgreen2") +
  labs(title = "Grau médio", x = "Índice", y = "Valor") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 6))


p4 <- ggplot(df, aes(x = factor(indice), y = peso)) +
  geom_bar(stat = "identity", fill = "violetred3") +
  labs(title = "Peso médio", x = "Índice", y = "Valor") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 6))




p5 <- ggplot(df, aes(x = indice, y = aresta)) +
  geom_line(color = "lightslateblue", size = 1) +
  geom_point(color = "lightslateblue", size = 2) +
  labs(title = "Média de arestas", x = "Índice", y = "Valor") +
  theme_minimal()

p6 <- ggplot(df, aes(x = factor(indice), y = aresta)) +
  geom_bar(stat = "identity", fill = "lightslateblue") +
  labs(title = "Média de arestas", x = "Índice", y = "Valor") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 6))



(p1 | p3) / (p2 | p4) / (p5 | p6)


