library("XML")
library("httr")
library("stringr")
library("dplyr")
library("jsonlite")

##############################################################

#載入id_data
get_id_path<-'D:\\111\\GraphAPI.json'
get_id<-fromJSON(get_id_path)
year_id<-get_id$data$id
##############################################################

#載入CSV
get_id_path<-'D:/111/loan.csv'
id_data<-read.csv(get_id_path,stringsAsFactors = FALSE)
year_id<-html_id
##############################################################

all<-dir("D:/000")
all.length<-length(all)
all_id<-NULL
for (x in 1:all.length) {
  b<-unlist(strsplit(all[x],split=".",fixed=T))
  all_id<-c(all_id,b[1])
}
year_id<-all_id
##############################################################

#2016/4 - 2014/4
start_finish_time<-c(1459468800,1456790400,1454284800,1451606400,1448928000,1446336000,1443657600,1441065600,1438387200,1435708800,1433116800,1430438400,1427846400,1425168000,1422748800,1420070400,1417392000,1414800000,1412121600,1409529600,1406851200,1404172800,1401580800,1398902400,1396310400)

#access_token

access_token_change<-'CAACEdEose0cBAJTcx7abQHsoSYf852sC7BIacQZAyiYEbZARnIQhO9BeSZBZBm0CGekqnQMD18Ohc2EG5INXL3P9ROHJbAeWFwvJHgygQkZB8Fr0m9Llh3xmLscW3CIUHZB1q7ZCb7lKht1TNS6G5jOZCyU5e8JjzOwzEBZCmMXEvSU9jyWz0m2smBZBinZAfMgNw9UKuaYZBhBQ2AZDZD'
##############################################################

#get html_index

#one_year_id<-125048977564283
#start_finish_time<-1454284800

#63
#


count_num<-0
count_num_1<-0
#id loop
for (b in 173:length(year_id)) {

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
    
    #載入文章
    count_num_1<-count_num_1+1
    count_num_into<-paste("已載入",count_num_1,"篇")
    print(count_num_into)
    
    #get html_previous
    
    html_previous_url<-html_index$paging$previous
    html_index <- content(GET(html_previous_url),as = 'parsed')
    
    
    #like
    #time
    like_time_total<-html_index$data[[1]]$values[[1]]$end_time
    like_time_total_no_clean<-c(like_time_total_no_clean,like_time_total)
    
    #value
    like_time_total<-0
    tw_like_value_total<-0
    like_value_length<-length(html_index$data[[1]]$values[[1]]$value)
    like_value<-0
    if(like_value_length>0){
      for (x in 1:like_value_length) {
        like_value<-like_value+unlist(html_index$data[[1]]$values[[1]]$value[[x]])
      }
      tw_like_value<-unlist(html_index$data[[1]]$values[[1]]$value[[1]])
      
      like_value_total_no_clean<-c(like_value_total_no_clean,like_value)
      tw_like_value_total_no_clean<-c(tw_like_value_total_no_clean,tw_like_value)

    }
  }
  ###################################################################################
}