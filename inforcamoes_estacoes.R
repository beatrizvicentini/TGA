df_01 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202401-capitalbikeshare-tripdata.csv")
df_02 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202402-capitalbikeshare-tripdata.csv")
df_03 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202403-capitalbikeshare-tripdata.csv")
df_04 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202004-capitalbikeshare-tripdata.csv")
df_05 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202405-capitalbikeshare-tripdata.csv")
df_06 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202406-capitalbikeshare-tripdata.csv")
df_07 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202407-capitalbikeshare-tripdata.csv")
df_08 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202408-capitalbikeshare-tripdata.csv")
df_09 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202409-capitalbikeshare-tripdata.csv")
df_10 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202410-capitalbikeshare-tripdata.csv")
df_11 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202411-capitalbikeshare-tripdata.csv")
df_12 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202412-capitalbikeshare-tripdata.csv")
df_13 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202501-capitalbikeshare-tripdata.csv")
df_14 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202502-capitalbikeshare-tripdata.csv")
df_15 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202503-capitalbikeshare-tripdata.csv")
df_16 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202504-capitalbikeshare-tripdata.csv")
df_17 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202505-capitalbikeshare-tripdata.csv")
df_18 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202506-capitalbikeshare-tripdata.csv")
df_19 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202507-capitalbikeshare-tripdata.csv")
df_20 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202508-capitalbikeshare-tripdata.csv")
df_21 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202509-capitalbikeshare-tripdata.csv")
df_22 <- read.csv("C:/Users/catit/Downloads/bikeshare/datasets/202510-capitalbikeshare-tripdata.csv")

id_df_01 <- df_01$ride_id
id_df_02 <- df_02$ride_id
id_df_03 <- df_03$ride_id
id_df_04 <- df_04$ride_id
id_df_05 <- df_05$ride_id
id_df_06 <- df_06$ride_id
id_df_07 <- df_07$ride_id
id_df_08 <- df_08$ride_id
id_df_09 <- df_09$ride_id
id_df_10 <- df_10$ride_id
id_df_11 <- df_11$ride_id
id_df_12 <- df_12$ride_id
id_df_13 <- df_13$ride_id
id_df_14 <- df_14$ride_id
id_df_15 <- df_15$ride_id
id_df_16 <- df_16$ride_id
id_df_17 <- df_17$ride_id
id_df_18 <- df_18$ride_id
id_df_19 <- df_19$ride_id
id_df_20 <- df_20$ride_id
id_df_21 <- df_21$ride_id
id_df_22 <- df_22$ride_id





base_conjunta <- rbind(df_01
                       , df_02
                       , df_03
                       , df_04
                       , df_05
                       , df_06
                       , df_07
                       , df_08
                       , df_09
                       , df_10
                       , df_11
                       , df_12
                       , df_13
                       , df_14
                       , df_15
                       , df_16
                       , df_17
                       , df_18
                       , df_19
                       , df_20
                       , df_21
                       , df_22)

save(base_conjunta, file="C:/Users/catit/Downloads/bikeshare/datasets/basa_conjunta.RData")
write.csv(base_conjunta, file="C:/Users/catit/Downloads/bikeshare/datasets/basa_conjunta.csv")  

rm(df_01
   , df_02
   , df_03
   , df_04
   , df_05
   , df_06
   , df_07
   , df_08
   , df_09
   , df_10
   , df_11
   , df_12
   , df_13
   , df_14
   , df_15
   , df_16
   , df_17
   , df_18
   , df_19
   , df_20
   , df_21
   , df_22)

colnames(base_conjunta)
nomes <- (unique(c(unique(base_conjunta$start_station_name), unique(base_conjunta$end_station_name))))
teste1 <- sort(unique(base_conjunta$start_station_id))
teste2 <- sort(unique(base_conjunta$end_station_id))

teste1 == teste2
comeco <- data.frame("Nome" = base_conjunta$start_station_name,
                     "ID" = base_conjunta$start_station_id,
                     "Lat" = base_conjunta$start_lat ,
                     "Lon" = base_conjunta$start_lng)


fim <- data.frame("Nome" = base_conjunta$end_station_name,
                  "ID" = base_conjunta$end_station_id,
                  "Lat" = base_conjunta$end_lat ,
                  "Lon" = base_conjunta$end_lng)

infos <- rbind(comeco, fim)
rm(comeco, fim)

infos <- infos %>% distinct(.keep_all = T)
avaliar <- c(31045,31070,31097,31133,31225,31339,31380,31401,31407,31502,31528,31613,31660,
             31699,31726,31922,31936,31949,32215,32288,32307,32429)
teste <- infos[infos$ID %in% avaliar,] #divergencia na digitacao
table(infos$ID, exclude = NULL)[is.na(table(infos$ID))] #379 NA
infos <- infos[!is.na(infos$ID),]
codigos <- sort(unique(infos$ID))
depara <- data.frame("Codigos" = codigos,
                    "ID" = seq(1:length(codigos)))
colnames(infos)[colnames(infos) == "ID"] <- "Codigos"
infos <- left_join(infos, depara, by = "Codigos")

infos <- infos %>% distinct(ID, .keep_all = T)

infos <- infos %>% arrange(ID)

fwrite(infos, file = "C:/Users/catit/Downloads/bikeshare/datasets/INFO_ESTACOES.txt", sep =";")


depara  <- left_join(depara, base_conjunta[, c("start_station_name","start_station_id")], by=c("Codigos" = "start_station_id"))
depara <- depara %>% distinct(.keep_all = T)

depara  <- left_join(depara, base_conjunta[, c("end_station_name","end_station_id")], by=c("Codigos" = "end_station_id"))
depara <- depara %>% distinct(.keep_all = T)


depara$Nomes<- ifelse(is.na(depara$start_station_name), depara$end_station_name,
                                    depara$start_station_name)

teste <- depara %>% distinct(ID, .keep_all = T) #forcei apenas a primeira ocorrencia

identificacao <- teste[, -c(3,4)]

write.csv(identificacao, file = "C:/Users/catit/Downloads/bikeshare/datasets/IDs_estacoes")  


base_conjunta <- left_join(base_conjunta, identificacao[, c("Codigos", "ID")], by =c("start_station_id" = "Codigos"))

base_conjunta <- left_join(base_conjunta, identificacao[, c("Codigos", "ID")], by =c("end_station_id" = "Codigos"))

base_conjunta$ID <- ifelse(is.na(base_conjunta$ID.x), base_conjunta$ID.y,
                           base_conjunta$ID.x)
 
table(base_conjunta$ID, exclude = NULL)
 
teste <- base_conjunta[is.na(base_conjunta$ID),]

min(teste$started_at)
max(teste$started_at)

base_interesse <- base_conjunta[!is.na(base_conjunta$ID),]
base_interesse$ID.x <- NULL
base_interesse$ID.y <- NULL
save(base_interesse, file="C:/Users/catit/Downloads/bikeshare/datasets/basa_filtrada.RData")

write.csv(base_interesse, file="C:/Users/catit/Downloads/bikeshare/datasets/basa_filtrada.csv")  

base_interesse <- read.csv(file="C:/Users/catit/Downloads/bikeshare/datasets/basa_filtrada.csv")

df_01 <- base_interesse[base_interesse$ride_id %in% id_df_01,]
df_02 <- base_interesse[base_interesse$ride_id %in% id_df_02,]
df_03 <- base_interesse[base_interesse$ride_id %in% id_df_03,]
df_04 <- base_interesse[base_interesse$ride_id %in% id_df_04,]
df_05 <- base_interesse[base_interesse$ride_id %in% id_df_05,]
df_06 <- base_interesse[base_interesse$ride_id %in% id_df_06,]
df_07 <- base_interesse[base_interesse$ride_id %in% id_df_07,]
df_08 <- base_interesse[base_interesse$ride_id %in% id_df_08,]
df_09 <- base_interesse[base_interesse$ride_id %in% id_df_09,]
df_10 <- base_interesse[base_interesse$ride_id %in% id_df_10,]
df_11 <- base_interesse[base_interesse$ride_id %in% id_df_11,]
df_12 <- base_interesse[base_interesse$ride_id %in% id_df_12,]
df_13 <- base_interesse[base_interesse$ride_id %in% id_df_13,]
df_14 <- base_interesse[base_interesse$ride_id %in% id_df_14,]
df_15 <- base_interesse[base_interesse$ride_id %in% id_df_15,]
df_16 <- base_interesse[base_interesse$ride_id %in% id_df_16,]
df_17 <- base_interesse[base_interesse$ride_id %in% id_df_17,]
df_18 <- base_interesse[base_interesse$ride_id %in% id_df_18,]
df_19 <- base_interesse[base_interesse$ride_id %in% id_df_19,]
df_20 <- base_interesse[base_interesse$ride_id %in% id_df_20,]
df_21 <- base_interesse[base_interesse$ride_id %in% id_df_21,]
df_22 <- base_interesse[base_interesse$ride_id %in% id_df_22,]

save(df_01, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_01.RData")
save(df_02, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_02.RData")
save(df_03, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_03.RData")
save(df_04, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_04.RData")
save(df_05, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_05.RData")
save(df_06, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_06.RData")
save(df_07, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_07.RData")
save(df_08, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_08.RData")
save(df_09, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_09.RData")
save(df_10, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_10.RData")
save(df_11, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_11.RData")
save(df_12, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_12.RData")
save(df_13, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_13.RData")
save(df_14, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_14.RData")
save(df_15, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_15.RData")
save(df_16, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_16.RData")
save(df_17, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_17.RData")
save(df_18, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_18.RData")
save(df_19, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_19.RData")
save(df_20, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_20.RData")
save(df_21, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_21.RData")
save(df_22, file="C:/Users/catit/Downloads/bikeshare/datasets/redes/df_22.RData")





