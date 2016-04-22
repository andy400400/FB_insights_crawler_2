library("jsonlite")

#讀原始資料
get_id_path<-'D:\\111\\GraphAPI.json'
get_id<-fromJSON(get_id_path)
year_id<-get_id$data$id

#讀爬蟲資料
all<-dir("D:/0000")
all.length<-length(a)
all_id<-NULL
for (x in 1:a.length) {
  b<-unlist(strsplit(all[x],split=".",fixed=T))
  all_id<-c(all_id,b[1])
}

final_id<-NULL
final_name<-NULL
final_latitude<-NULL
final_longitude<-NULL
final_like<-NULL

start_time<-NULL
#建立變數(月*4)
{
  jan_total_like<-NULL
  feb_total_like<-NULL
  mar_total_like<-NULL
  apr_total_like<-NULL
  may_total_like<-NULL
  jun_total_like<-NULL
  jul_total_like<-NULL
  aug_total_like<-NULL
  sep_total_like<-NULL
  oct_total_like<-NULL
  nov_total_like<-NULL
  dec_total_like<-NULL
  
  jan_TW_like<-NULL
  feb_TW_like<-NULL
  mar_TW_like<-NULL
  apr_TW_like<-NULL
  may_TW_like<-NULL
  jun_TW_like<-NULL
  jul_TW_like<-NULL
  aug_TW_like<-NULL
  sep_TW_like<-NULL
  oct_TW_like<-NULL
  nov_TW_like<-NULL
  dec_TW_like<-NULL
  
  jan_talk<-NULL
  feb_talk<-NULL
  mar_talk<-NULL
  apr_talk<-NULL
  may_talk<-NULL
  jun_talk<-NULL
  jul_talk<-NULL
  aug_talk<-NULL
  sep_talk<-NULL
  oct_talk<-NULL
  nov_talk<-NULL
  dec_talk<-NULL
  
  jan_TW_talk<-NULL
  feb_TW_talk<-NULL
  mar_TW_talk<-NULL
  apr_TW_talk<-NULL
  may_TW_talk<-NULL
  jun_TW_talk<-NULL
  jul_TW_talk<-NULL
  aug_TW_talk<-NULL
  sep_TW_talk<-NULL
  oct_TW_talk<-NULL
  nov_TW_talk<-NULL
  dec_TW_talk<-NULL
}
  
brfore_length<-length(get_id$data$id)
after_length<-length(all_id)

#交叉比對
for (y in 1:after_length) {
  #載入資料
  id_path<-paste("D:/0000/",all_id[y],".CSV",sep = "")
  id_data<-read.csv(id_path,stringsAsFactors = FALSE)
  #與地標資料比對
  for (z in 1:brfore_length) {
    if (all_id[y] == get_id$data$id[z]) {
      final_id<-c(final_id,get_id$data$id[z])
      final_name<-c(final_name,get_id$data$name[z])
      final_latitude<-c(final_latitude,get_id$data$location$latitude[z])
      final_longitude<-c(final_longitude,get_id$data$location$longitude[z])
      final_like<-c(final_like,id_data[1,3])
    }
  }
  ###########################################################################
  
  #找開始日期
  for (when_na in 1:24) {
    if (is.na(id_data$total_like[when_na])) {
      break
    }
  }

  #開始日期為na前一個
  start<-when_na-1
  split_3<-unlist(strsplit(id_data$time[start],split="-"))
  add_3<-paste(split_3[1],"/",split_3[2],sep = "")
  start_time<-c(start_time,add_3)
  
  
  #各月差(3,2,1,12,11,10,9,8,7,6,5,4)
    for (month_num in 1:12) {
      div_total_like<-id_data$total_like[month_num]-id_data$total_like[month_num+12]
      div_TW_like<-id_data$TW_like[month_num]-id_data$TW_like[month_num+12]
      div_talk<-id_data$talk[month_num]-id_data$talk[month_num+12]
      div_TW_talk<-id_data$TW_talk[month_num]-id_data$TW_talk[month_num+12]
      if (month_num==1) {
        mar_total_like<-c(mar_total_like,div_total_like)
        mar_TW_like<-c(mar_TW_like,div_TW_like)
        mar_talk<-c(mar_talk,div_talk)
        mar_TW_talk<-c(mar_TW_talk,div_TW_talk)
      }
      if (month_num==2) {
        feb_total_like<-c(feb_total_like,div_total_like)
        feb_TW_like<-c(feb_TW_like,div_TW_like)
        feb_talk<-c(feb_talk,div_talk)
        feb_TW_talk<-c(feb_TW_talk,div_TW_talk)
      }
      if (month_num==3) {
        jan_total_like<-c(jan_total_like,div_total_like)
        jan_TW_like<-c(jan_TW_like,div_TW_like)
        jan_talk<-c(jan_talk,div_talk)
        jan_TW_talk<-c(jan_TW_talk,div_TW_talk)
      }
      if (month_num==4) {
        dec_total_like<-c(dec_total_like,div_total_like)
        dec_TW_like<-c(dec_TW_like,div_TW_like)
        dec_talk<-c(dec_talk,div_talk)
        dec_TW_talk<-c(dec_TW_talk,div_TW_talk)
      }
      if (month_num==5) {
        nov_total_like<-c(nov_total_like,div_total_like)
        nov_TW_like<-c(nov_TW_like,div_TW_like)
        nov_talk<-c(nov_talk,div_talk)
        nov_TW_talk<-c(nov_TW_talk,div_TW_talk)
      }
      if (month_num==6) {
        oct_total_like<-c(oct_total_like,div_total_like)
        oct_TW_like<-c(oct_TW_like,div_TW_like)
        oct_talk<-c(oct_talk,div_talk)
        oct_TW_talk<-c(oct_TW_talk,div_TW_talk)
      }
      if (month_num==7) {
        sep_total_like<-c(sep_total_like,div_total_like)
        sep_TW_like<-c(sep_TW_like,div_TW_like)
        sep_talk<-c(sep_talk,div_talk)
        sep_TW_talk<-c(sep_TW_talk,div_TW_talk)
      }
      if (month_num==8) {
        aug_total_like<-c(aug_total_like,div_total_like)
        aug_TW_like<-c(aug_TW_like,div_TW_like)
        aug_talk<-c(aug_talk,div_talk)
        aug_TW_talk<-c(aug_TW_talk,div_TW_talk)
      }
      if (month_num==9) {
        jul_total_like<-c(jul_total_like,div_total_like)
        jul_TW_like<-c(jul_TW_like,div_TW_like)
        jul_talk<-c(jul_talk,div_talk)
        jul_TW_talk<-c(jul_TW_talk,div_TW_talk)
      }
      if (month_num==10) {
        jun_total_like<-c(jun_total_like,div_total_like)
        jun_TW_like<-c(jun_TW_like,div_TW_like)
        jun_talk<-c(jun_talk,div_talk)
        jun_TW_talk<-c(jun_TW_talk,div_TW_talk)
      }
      if (month_num==11) {
        may_total_like<-c(may_total_like,div_total_like)
        may_TW_like<-c(may_TW_like,div_TW_like)
        may_talk<-c(may_talk,div_talk)
        may_TW_talk<-c(may_TW_talk,div_TW_talk)
      }
      if (month_num==12) {
        apr_total_like<-c(apr_total_like,div_total_like)
        apr_TW_like<-c(apr_TW_like,div_TW_like)
        apr_talk<-c(apr_talk,div_talk)
        apr_TW_talk<-c(apr_TW_talk,div_TW_talk)
      }
    }
}

final_cbind<-cbind(final_id,final_name,final_latitude,final_longitude,final_like,start_time,jan_total_like,feb_total_like,mar_total_like,apr_total_like,may_total_like,jun_total_like,jul_total_like,aug_total_like,sep_total_like,oct_total_like,nov_total_like,dec_total_like,jan_TW_like,feb_TW_like,mar_TW_like,apr_TW_like,may_TW_like,jun_TW_like,jul_TW_like,aug_TW_like,sep_TW_like,oct_TW_like,nov_TW_like,dec_TW_like,jan_talk,feb_talk,mar_talk,apr_talk,may_talk,jun_talk,jul_talk,aug_talk,sep_talk,oct_talk,nov_talk,dec_talk,jan_TW_talk,feb_TW_talk,mar_TW_talk,apr_TW_talk,may_TW_talk,jun_TW_talk,jul_TW_talk,aug_TW_talk,sep_TW_talk,oct_TW_talk,nov_TW_talk,dec_TW_talk)

View(final_cbind)

#轉型態
final_cbind_df<-as.data.frame(final_cbind)
final_cbind_df$final_like<-as.integer(as.character(final_cbind_df$final_like))

final_cbind_df$final_id<-as.integer(as.character(final_cbind_df$final_id))

#排序
final_order<-final_cbind_df[order(-final_cbind_df[,5]),]

#存檔
all_path<-paste("D:/000/final_order.csv",sep = "")
write.csv(final_order, file = all_path)

View(final_order)