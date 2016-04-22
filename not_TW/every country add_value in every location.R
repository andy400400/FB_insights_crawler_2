library("XML")
library("httr")
library("stringr")
library("dplyr")
library("jsonlite")

##############################################################

city_name<-"dongshan"

#chiao,ilan,lotung,suao,toucheng
#dongshan,jhuangwei,sanxing,wujie,yuanshan

##############################################################

#製作行名稱向量
add_path<-paste("C:/pro/data/all_country.csv",sep = "")
all_country<-read.csv(add_path)
col_name_total<-NULL
for (xxx in 2:nrow(all_country)) {
  col_name<-paste(all_country[xxx,2],sep="")
  col_name_total<-c(col_name_total,col_name)
}

#日期
date_path<-paste("C:/pro/data/date.csv",sep = "")
date_data<-read.csv(date_path,stringsAsFactors =FALSE)
time<-NULL
for (rr in 1:24) {
  time<-c(date_data[rr,2],time)
}

#製作24*189陣列
zero_1<-cbind(c(1:4824),c(0))
country_matric<-zero_1[,2]
dim(country_matric)<-c(24,201)

#放入行名
colnames(country_matric)<-col_name_total
country_matric_like<-country_matric
country_matric_talk<-country_matric

##############################################################

all_colnames<-NULL
unique_all_colnames<-NULL

#進入城市資料夾
into_path<-paste("C:/pro/data/detal_of_data/",city_name,sep = "")
all_folder<-dir(into_path)

#城市內景點資料夾
folder_length<-length(all_folder)
for (xx in 1:folder_length) {
  
  #各景點的資料
  id_into_path<-paste(into_path,"/",all_folder[xx],sep = "")
  all_file<-dir(id_into_path)
  
  #各景點的資料數
  file_length<-length(all_file)
  is_like<-"like"
  is_talk<-"talk"
  
  #各個資料
  for (yy in 1:file_length) {
    
    #時間資料
    for (ss in 1:length(time)) {
      
      #拆解2016/06
      split_date_time<-strsplit(time[ss],"/")
      
      #與檔名比對2016_06_like_.csv
      split_all_file<-strsplit(all_file[yy],"_")
      if (grepl(split_date_time[[1]][1],split_all_file[[1]][1]) && grepl(split_date_time[[1]][2],split_all_file[[1]][2])) {
        
        #找like資料
        if (grepl(is_like,all_file[yy])) {
          file_id_into_path<-paste(id_into_path,"/",all_file[yy],sep = "")
          like_data<-read.csv(file_id_into_path)
          
          #資料行名稱loop
          like_data_colnames<-colnames(like_data)
          if (ncol(like_data)>1) {
            for (colname_compare in 2:ncol(like_data)) {
              
              #表格行名稱
              length_country_matric_like_colnames<-length(colnames(country_matric_like))
              country_matric_like_colnames<-colnames(country_matric_like)
              
              #表格行名稱loop
              for (country_matric_like_colname_compare in 1:length_country_matric_like_colnames) {
                if (like_data_colnames[colname_compare]==country_matric_like_colnames[country_matric_like_colname_compare]) {
                  country_matric_like[ss,country_matric_like_colname_compare]<-country_matric_like[ss,country_matric_like_colname_compare]+like_data[1,colname_compare]
                }
              }
            }
          }
        }
        
        #找talk資料
        if (grepl(is_talk,all_file[yy])) {
          file_id_into_path<-paste(id_into_path,"/",all_file[yy],sep = "")
          talk_data<-read.csv(file_id_into_path)
          
          #資料行名稱loop
          talk_data_colnames<-colnames(talk_data)
          if (ncol(talk_data)>1) {
            for (colname_compare in 2:ncol(talk_data)) {
              
              #表格行名稱
              length_country_matric_talk_colnames<-length(colnames(country_matric_talk))
              country_matric_talk_colnames<-colnames(country_matric_talk)
              
              #表格行名稱loop
              for (country_matric_talk_colname_compare in 1:length_country_matric_talk_colnames) {
                if (talk_data_colnames[colname_compare]==country_matric_talk_colnames[country_matric_talk_colname_compare]) {
                  country_matric_talk[ss,country_matric_talk_colname_compare]<-country_matric_talk[ss,country_matric_talk_colname_compare]+talk_data[1,colname_compare]
                }
              }
            }
          }
        }
        
      }
    }
  }
}

###################################################################################

country_matric_like_time<-cbind(time,country_matric_like)
country_matric_like_ok<-as.data.frame(country_matric_like_time)

add_path<-paste("C:/pro/data/add_detal_of_data/",city_name,"like.csv",sep = "")
write.csv(country_matric_like_ok,add_path)


country_matric_talk_time<-cbind(time,country_matric_talk)
country_matric_talk_ok<-as.data.frame(country_matric_talk_time)

add_path<-paste("C:/pro/data/add_detal_of_data/",city_name,"talk.csv",sep = "")
write.csv(country_matric_talk_ok,add_path)

