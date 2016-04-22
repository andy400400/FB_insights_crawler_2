
path<-'C:/pro/data/000'
folder<-dir(path)

data_1<-read.csv(paste(path,"/",folder[2],sep = ""))
colnames(data_1)

#chiao,ilan,lotung,suao,toucheng
#dongshan,jhuangwei,sanxing,wujie,yuanshan
chiao<-sum(data_1$chiao_non_tw)/sum(data_1$chiao_all)
ilan<-sum(data_1$ilan_non_tw)/sum(data_1$ilan_all)
lotung<-sum(data_1$lotung_non_tw)/sum(data_1$lotung_all)
suao<-sum(data_1$suao_non_tw)/sum(data_1$suao_all)
toucheng<-sum(data_1$toucheng_non_tw)/sum(data_1$toucheng_all)
dongshan<-sum(data_1$dongshan_non_tw)/sum(data_1$dongshan_all)
jhuangwei<-sum(data_1$jhuangwei_non_tw)/sum(data_1$jhuangwei_all)
sanxing<-sum(data_1$sanxing_non_tw)/sum(data_1$sanxing_all)
wujie<-sum(data_1$wujie_non_tw)/sum(data_1$wujie_all)
yuanshan<-sum(data_1$yuanshan_non_tw)/sum(data_1$yuanshan_all)

options(digits = 3)
rbind(chiao,ilan,lotung,suao,toucheng,dongshan,jhuangwei,sanxing,wujie,yuanshan)*100
