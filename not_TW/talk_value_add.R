#chiao,ilan,lotung,suao,toucheng
#dongshan,jhuangwei,sanxing,wujie,yuanshan
talk_data_clean<-NULL
#######################
talk_TW_all<-NULL
talk_other_all<-NULL
all_talk_data<-NULL
path_x<-paste('C:/pro/data/add_detal_of_data2/','toucheng','talk.csv',sep = "")
data_value<-read.csv(path_x)

#TW
talk_TW_all<-data_value[,3]
#non-TW
data_value_length<-length(data_value)
data_value_nrow<-nrow(data_value)
for (a2 in 1:data_value_nrow) {
  talk_other<-0
  for (a1 in 4:data_value_length) {
    talk_other<-talk_other+data_value[a2,a1]
  }
  talk_other_all<-c(talk_other_all,talk_other)
}

all_talk_data<-talk_TW_all+talk_other_all



talk_data<-cbind(all_talk_data,talk_TW_all,talk_other_all)
colnames(talk_data)<-c("toucheng_all","toucheng_tw","toucheng_non_tw")

talk_data_clean<-cbind(talk_data_clean,talk_data)

################################################
path_x2<-'C:/pro/data/000/talk_value1.csv'
write.csv(talk_data_clean,path_x2)


