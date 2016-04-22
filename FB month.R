library("XML")
library("httr")
library("stringr")
library("dplyr")
library("jsonlite")

##############################################################

#è¼‰å…¥id_data
get_id_path<-'D:\\111\\GraphAPI.json'
get_id<-fromJSON(get_id_path)
year_id<-get_id$data$id
##############################################################

#è¼‰å…¥CSV
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

access_token_change<-'CAACEdEose0cBAKZBmIHoQxLZCtBFqZBAwU694Dhzcg46vz3Pino0wuqiHeLCjR5ec3zLqZAd8ss0flIpsvKFaZCBNTStgMOpG9Vd2qHD2uNC8M5gXK5ZAZARN4NY8v5Raa6GM10qZCh41qVGN4RpxjrQDaWZBOYXwN0CQMGGHZBZBx7049UZCSxihMCHS6lygZANgGMS1TNB45N5ZC5QZDZD'
##############################################################

#get html_index

#one_year_id<-975929005752300
#start_finish_time<-1454284800

#63
#


count_num<-0
count_num_1<-0
#id loop
for (b in 173:length(year_id)) {
  count_num_1<-count_num_1+1
  count_num_into<-paste("å·²ç?“è?‰å…¥",count_num_1,"ç¯?")
  print(count_num_into)
  
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
    
    #talk about
    #value
    talk_time_total<-0
    tw_talk_value_total<-0
    last_data<-length(html_index$data)
    talk_value_length<-length(html_index$data[[last_data]]$values[[1]]$value)
    
    talk_value<-0
    tw_talk_value<-0
    
    #??‰å…§å®¹æ?å??
    if(talk_value_length>0){
      for (x in 1:talk_value_length) {
        talk_value<-talk_value+unlist(html_index$data[[4]]$values[[1]]$value[[x]])
      }
      tw_talk_value<-unlist(html_index$data[[4]]$values[[1]]$value[[1]])
    }
    
    talk_value_total_clean<-c(talk_value_total_clean,talk_value)
    tw_talk_value_total_clean<-c(tw_talk_value_total_clean,tw_talk_value)
    }
  }
  ###################################################################################
  
  #??‰å…§å®¹æ?å??
  if(length(tw_talk_value_total_clean)>0){
    ###################################################################################
    #?•´??†ç›¸æ¸?
    div_like_value_total_clean<-NULL
    div_tw_like_value_total_clean<-NULL
    
    for (s in 1:(length(like_time_total_no_clean)-1)) {
      like_value_total_no<-like_value_total_no_clean[s]-like_value_total_no_clean[s+1]
      div_like_value_total_clean<-c(div_like_value_total_clean,like_value_total_no)
      
      tw_like_value_total_no<-tw_like_value_total_no_clean[s]-tw_like_value_total_no_clean[s+1]
      div_tw_like_value_total_clean<-c(div_tw_like_value_total_clean,tw_like_value_total_no)
    }
    
    #choose 24
    like_time_total_clean<-like_time_total_no_clean[1:24]
    total_like_value<-like_value_total_no_clean[1:24]
    tw_total_like_value<-tw_like_value_total_no_clean[1:24]
    talk_value_total_clean_24<-talk_value_total_clean[1:24]
    tw_talk_value_total_clean_24<-tw_talk_value_total_clean[1:24]
    
    ######################################################################################
    #??ˆä½µ
    
      FB_total<-NULL
      FB_total<-cbind(like_time_total_clean,total_like_value,tw_total_like_value,talk_value_total_clean_24,tw_talk_value_total_clean_24,div_like_value_total_clean,div_tw_like_value_total_clean)
      
      colnames(FB_total)<-c("time","total_like","TW_like","talk","TW_talk","div_total_like","div_TW_like")
    
    all_path<-paste("D:/00/",year_id[b],".csv",sep = "")
    write.csv(FB_total, file = all_path)
    
    count_num<-count_num+1
    count_num_OK<-paste("å·²ç?“å?Œæ??",count_num,"ç¯?")
    print(count_num_OK)
  }
}