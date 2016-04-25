dir_1<-dir('C:/pro/PTT')
path_1<-paste('C:/pro/PTT/',dir_1,sep = "")
ptt_data<-read.csv(path_1,stringsAsFactors = FALSE)


#只抓年
year_clean<-NULL
date_length<-length(ptt_data$date)
for (x in 1:date_length) {
  split_date<-unlist(strsplit(ptt_data$date[x]," "))
  split_date_length<-length(split_date)
  year<-split_date[split_date_length]
  year_clean<-c(year_clean,year)
}


#抓地點

#1
location<-c("礁溪","宜蘭市","羅東","蘇澳","頭城","冬山","壯圍","三星","五結","員山")

#chiao,ilan,lotung,suao,toucheng
#dongshan,jhuangwei,sanxing,wujie,yuanshan
zero_1<-cbind(c(1:120),c(0))
zero_2<-zero_1[,2]
dim(zero_2)<-c(12,10)
colnames(zero_2)<-c("chiao","ilan","lotung","suao","toucheng","dongshan","jhuangwei","sanxing","wujie","yuanshan")

location_length<-length(location)
row.names(zero_2)<-year_12
date_length<-length(ptt_data$date)
year_length<-length(year_12)
ptt_data<-cbind(ptt_data,year_clean)

other_data<-NULL

#1
#12年(05-16)
for (x3 in 1:year_length) {
  #文章年分
  for (x2 in 1:date_length) {
    #是否吻合
    if (ptt_data$year_clean[x2]==year_12[x3]) {
      count<-0
      #關鍵字比較(與文章標題)
      for (x4 in 1:location_length) {
        if (grepl(location[x4],ptt_data$title[x2])) {
          zero_2[x3,x4]<-zero_2[x3,x4]+1
          count<-1
        }
      }
      if (count==0) {
        other_data<-rbind(other_data,ptt_data[x2,])
      }
    }
  }
}

#2
other_data<-other_data_1
other_data_1<-NULL
for (x3 in 1:year_length) {
  #文章年分
  for (x2 in 1:length(other_data$year_clean)) {
    #是否吻合
    if (other_data$year_clean[x2]==year_12[x3]) {
      count<-0
      #關鍵字比較(與文章標題)
      for (x4 in 1:location_length) {
        if (grepl(location[x4],other_data$title[x2])) {
          zero_2[x3,x4]<-zero_2[x3,x4]+1
          count<-1
        }
      }
      if (count==0) {
        other_data_1<-rbind(other_data_1,ptt_data[x2,])
      }
    }
  }
}
nrow(other_data_1)

write.csv(zero_2,'C:/pro/data/000/ptt_num_2.csv')

#1
location<-c("礁溪","宜蘭市","羅東","蘇澳","頭城","冬山","壯圍","三星","五結","員山")
#2
location<-c("霍格華茲","幾米","肉羹","武荖坑","烏石","宜農牧場","壯圍","三星","傳統藝術中心","威士忌")
#3
location<-c("四圍堡車站","正好鮮肉","羅東","蘇澳","大溪漁港","梅花湖","壯圍","三星","中興文化","金車蘭")
#4
location<-c("五峰旗","東門夜市","羅東","蘇澳","蘭陽博物館","小熊","壯圍","三星","童玩節","葛瑪蘭酒廠")
#5
location<-c("柯氏蔥油餅","窯烤山寨村","羅東","蘇澳","桃源谷","冬山","壯圍","三星","玉兔鉛筆","員山")
#6
location<-c("礁溪","宜蘭文學館","羅東","蘇澳","草嶺古道","冬山","壯圍","三星","五結","員山")
#7
location<-c("礁溪","北門","羅東","蘇澳","頭城","冬山","壯圍","三星","五結","員山")
#8
location<-c("礁溪","宜蘭市","羅東","蘇澳","頭城","冬山","壯圍","三星","五結","員山")
