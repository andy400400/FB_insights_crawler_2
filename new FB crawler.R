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
options(digits = 20)
city_path<-paste("C:/pro/data/111/",city_name,".csv",sep = "")
id_data<-read.csv(city_path)
year_id<-id_data$html_id

##############################################################

#2016/4 - 2014/4
start_finish_time<-c(1459468800,1456790400,1454284800,1451606400,1448928000,1446336000,1443657600,1441065600,1438387200,1435708800,1433116800,1430438400,1427846400,1425168000,1422748800,1420070400,1417392000,1414800000,1412121600,1409529600,1406851200,1404172800,1401580800,1398902400,1396310400)

#access_token

access_token_change<-'CAACEdEose0cBAK8Ip0ZBonT4JZC5yz0bZCkEGF1PdNMRegeGNWRQ1Vb7EODvLjyCnNPiVnZADOdAOWFipA0zxcnWsQyZACVCT55OcyItHCz8rxIZChCWPO4poqaZBK3A6RYTwYYKRwdUOK8r5eunuZAHwGqFAUHctfdLDxrkiyRDcEF8FPmyDW0Qm4SlYHjuZCjyOYIDZBgdxVZBgZDZD'

##############################################################

#get html_index

#one_year_id<-975929005752300
#start_finish_time<-1454284800

#
#

count_num<-0
count_num_1<-1
#id loop
for (b in count_num_1:length(year_id)) {
  
  one_year_id<-year_id[b]
  
  ##############################################################
  like_time_total_no_clean<-NULL
  like_value_total_no_clean<-NULL
  tw_like_value_total_no_clean<-NULL
  talk_value_total_clean<-NULL
  tw_talk_value_total_clean<-NULL
  ##############################################################

  #time loop
  for (y in 1:length(start_finish_time)) {
    url <-paste('https://graph.facebook.com/v2.0/',one_year_id,'/insights?since=',start_finish_time[y],'&until=',start_finish_time[y],'&access_token=',access_token_change,sep = "")
    
    html_index <- content(GET(url),as = 'parsed')

    
    #確認
    if (y==1) {
      if (b>1) {
        count_num_1<-count_num_1+1
      }
      count_num_into<-paste("以載入",count_num_1,"篇")
      print(count_num_into)
    }
        
    #get html_previous
    
    html_previous_url<-html_index$paging$previous
    html_index <- content(GET(html_previous_url),as = 'parsed')
    
    
    #like
    #time
    like_time_total<-html_index$data[[1]]$values[[1]]$end_time
    like_time_total_no_clean<-c(like_time_total_no_clean,like_time_total)
    time_split<-unlist(strsplit(like_time_total,split="-",fixed=T))
    file_name<-paste(time_split[1],"_",time_split[2],sep = "")
    
    #value
    like_value_length<-length(html_index$data[[1]]$values[[1]]$value)
    like_value<-0
    talk_value<-0
    if(like_value_length>0){
      
        if (y == 1) {
          dir.create(paste("C:/pro/data/detal_of_data/",city_name,"/",one_year_id,sep = ""))
        }

        #like
        like_value<-html_index$data[[1]]$values[[1]]$value
        like_path<-paste("C:/pro/data/detal_of_data/",city_name,"/",one_year_id,"/",file_name,"_like_.csv",sep = "")
        write.csv(like_value, file = like_path)
        
        #talk about
        last_data<-length(html_index$data)
        talk_value_length<-length(html_index$data[[last_data]]$values[[1]]$value)
        if (talk_value_length>0) {
          talk_value<-html_index$data[[last_data]]$values[[1]]$value
          talk_path<-paste("C:/pro/data/detal_of_data/",city_name,"/",one_year_id,"/",file_name,"_talk_.csv",sep = "")
          write.csv(talk_value, file = talk_path)
        }
    }
  }
  count_num<-count_num+1
  count_num_OK<-paste("已完成",count_num,"篇")
  print(count_num_OK)
}
###################################################################################
