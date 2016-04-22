#chiao,ilan,lotung,suao,toucheng
#dongshan,jhuangwei,sanxing,wujie,yuanshan

time<-as.character(data_value$add_time[24:1])
all_talk_data<-NULL
#####################
talk_other_all<-NULL
talk_other_all<-NULL

  path_x<-paste('C:/pro/data/total_add/add_','chiao','.csv',sep = "")
  data_value<-read.csv(path_x)
  talk_other<-data_value[,5]-data_value[,6]
  talk_other_all<-c(talk_other_all,talk_other)


talk_data<-cbind(data_value[,5],data_value[,6],talk_other_all)
colnames(talk_data)<-c("toucheng_all","toucheng_tw","toucheng_non_tw")

talk_data_clean<-NULL
for (d in 1:24) {
  talk_data_clean<-rbind(talk_data[d,],talk_data_clean)
}

all_talk_data<-cbind(all_talk_data,as.data.frame(talk_data_clean))

path_x2<-'C:/pro/data/000/talk_value.csv'
write.csv(all_talk_data,path_x2)


