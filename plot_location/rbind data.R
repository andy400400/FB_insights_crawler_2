#chiao,ilan,lotung,suao,toucheng
#dongshan,jhuangwei,sanxing,wujie,yuanshan

city_all<-c("chiao","ilan","lotung","suao","toucheng","dongshan","jhuangwei","sanxing","wujie","yuanshan")
all_data_total<-NULL

for (z in 1:10) {
  city<-city_all[z]
  al<-dir('C:/pro/plot/8_season_data')
  al_length<-length(al)
  al_choose<-NULL
  for (x in 1:al_length) {
    if (grepl(city,al[x])) {
      al_choose<-c(al_choose,al[x])
    }
  }
  
  data_total<-NULL
  bl_length<-length(al_choose)
  options(digits = 20)
  for (y in 1:bl_length) {
    data<-read.csv(paste('C:/pro/plot/8_season_data/',al_choose[y],sep = ""))
    data_nrow<-nrow(data)
    zero<-cbind(c(1:data_nrow),c(y))
    season<-zero[,2]
    data<-cbind(data,season)
    data<-data[,-1]
    data<-data[,-1]
    data_total<-rbind(data_total,data)
  }
  
  all_data_total<-rbind(all_data_total,data_total)
  
}

claen_data<-NULL
all_data_total_nrow<-nrow(all_data_total)
for (a in 1:all_data_total_nrow) {
  if (all_data_total[a,5]>0) {
    claen_data<-rbind(claen_data,all_data_total[a,])
  }
}
nrow(claen_data)
write.csv(claen_data,'C:/pro/plot/season_data/location.csv')
