#chiao,ilan,lotung,suao,toucheng
data_year<-"2014"
data_year<-"2015"
data_year<-"2016"
data_month<-c("01","02","03")
data_month<-c("04","05","06")
data_month<-c("07","08","09")
data_month<-c("10","11","12")

for (wer in 1:5) {
  
  city_5<-c("chiao","ilan","lotung","suao","toucheng")
  city<-city_5[wer]
  
  dir_1<-dir(paste('C:/pro/data/detal_of_data/',city,sep = ""))
  dir_1_length<-length(dir_1)
  
  
  #id file
  options(digits = 20)
  id_path<-paste('C:/pro/data/cleanlocation/',city,'_clean.csv',sep = "")
  id_data<-read.csv(id_path)
  id_data_length<-length(id_data$clean_id)
  
  ####################################################################
  basic_data_all<-NULL
  total_all_2016Q1<-NULL
  total_TW_2016Q1<-NULL
  total_MY_2016Q1<-NULL
  total_HK_2016Q1<-NULL
  total_US_2016Q1<-NULL
  total_CN_2016Q1<-NULL
  total_SG_2016Q1<-NULL
  total_JP_2016Q1<-NULL
  total_AU_2016Q1<-NULL
  ####################################################################
  
  #地點檔案區
  for (zz in 1:dir_1_length) {
    
    #抓出前段基本資料
    for (qq in 1:id_data_length) {
      #比對ID
      if (id_data$clean_id[qq]==dir_1[zz]) {
        basic_data<-id_data[qq,]
        basic_data_all<-rbind(basic_data_all,basic_data)
        
        dir_2<-dir(paste('C:/pro/data/detal_of_data/',city,'/',dir_1[zz],sep = ""))
        
        #地點資料
        dir_2_length<-length(dir_2)
        ####################################################################
        all_2016Q1<-0
        TW_2016Q1<-0
        MY_2016Q1<-0
        HK_2016Q1<-0
        US_2016Q1<-0
        CN_2016Q1<-0
        SG_2016Q1<-0
        JP_2016Q1<-0
        AU_2016Q1<-0
        ####################################################################
        for (xx in 1:dir_2_length) {
          #talk資料
          if (grepl("talk",dir_2[xx])) {
            
            dir_2_split<-unlist(strsplit(dir_2[xx],"_"))
            #2016Q1(4,5,5)
            if (dir_2_split[1]==data_year && sum(dir_2_split[2]==data_month)>0) {
              file_path<-paste('C:/pro/data/detal_of_data/',city,'/',dir_1[zz],"/",dir_2[xx],sep = "")
              file_data<-read.csv(file_path)
              file_data_colname<-colnames(file_data)
              file_data_colnam_length<-length(file_data_colname)
              #找國籍,值相加
              for (yy in 2:file_data_colnam_length) {
                all_2016Q1<-all_2016Q1+file_data[[yy]]
                #TW
                if (file_data_colname[yy] == "TW") {
                  TW_2016Q1<-TW_2016Q1+file_data[[yy]]
                }
                #MY
                if (file_data_colname[yy] == "MY") {
                  MY_2016Q1<-MY_2016Q1+file_data[[yy]]
                }
                #HK
                if (file_data_colname[yy] == "HK") {
                  HK_2016Q1<-HK_2016Q1+file_data[[yy]]
                }
                #US
                if (file_data_colname[yy] == "US") {
                  US_2016Q1<-US_2016Q1+file_data[[yy]]
                }
                #CN
                if (file_data_colname[yy] == "CN") {
                  CN_2016Q1<-CN_2016Q1+file_data[[yy]]
                }
                #SG
                if (file_data_colname[yy] == "SG") {
                  SG_2016Q1<-SG_2016Q1+file_data[[yy]]
                }
                #JP
                if (file_data_colname[yy] == "JP") {
                  JP_2016Q1<-JP_2016Q1+file_data[[yy]]
                }
                #AU
                if (file_data_colname[yy] == "AU") {
                  AU_2016Q1<-AU_2016Q1+file_data[[yy]]
                }
              }
            }
            
            
          }
        }
        total_all_2016Q1<-c(total_all_2016Q1,all_2016Q1)
        total_TW_2016Q1<-c(total_TW_2016Q1,TW_2016Q1)
        total_MY_2016Q1<-c(total_MY_2016Q1,MY_2016Q1)
        total_HK_2016Q1<-c(total_HK_2016Q1,HK_2016Q1)
        total_US_2016Q1<-c(total_US_2016Q1,US_2016Q1)
        total_CN_2016Q1<-c(total_CN_2016Q1,CN_2016Q1)
        total_SG_2016Q1<-c(total_SG_2016Q1,SG_2016Q1)
        total_JP_2016Q1<-c(total_JP_2016Q1,JP_2016Q1)
        total_AU_2016Q1<-c(total_AU_2016Q1,AU_2016Q1)
      }
    }
  }
  
  data_2016Q1<-cbind(basic_data_all,total_all_2016Q1,total_TW_2016Q1,total_MY_2016Q1,total_HK_2016Q1,total_US_2016Q1,total_CN_2016Q1,total_SG_2016Q1,total_JP_2016Q1,total_AU_2016Q1)
  colnames(data_2016Q1)<-c("X","id","name","latitude","longitude","total","TW","MY","HK","US","CN","SG","JP","AU")
  
  
  path_sean<-paste('C:/pro/data/8_season_data/',city,'_2016Q1.csv',sep = "")
  write.csv(data_2016Q1,path_sean)
}