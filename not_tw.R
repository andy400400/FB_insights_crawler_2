all<-dir(paste("C:/Users/Student/Desktop/pro/data/plot_data",sep = ""))

file_length<-length(all)

for (x in 1:file_length) {
  add_path<-paste("C:/Users/Student/Desktop/pro/data/plot_data/",all[x],sep = "")
  if (x==1) {
    chiao<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==2) {
    ilan<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==3) {
    lotung<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==4) {
    suao<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==5) {
    toucheng<-read.csv(add_path,stringsAsFactors = FALSE)
  }
}

#chiao,ilan,lotung,suao,toucheng
save_name<-"div_toucheng"
plot_data<-toucheng

{
  Not_TW_like<-NULL
  Not_TW_talk<-NULL
  Not_TW_time<-NULL
  
  for (w in 1:24) {
    Not_TW_like<-c(Not_TW_like,plot_data[w,3]-plot_data[w,4])
    Not_TW_talk<-c(Not_TW_talk,plot_data[w,5]-plot_data[w,6])
    Not_TW_time<-c(Not_TW_time,plot_data[w,2])
  }
  


  div_data_all<-cbind(Not_TW_time,Not_TW_like,Not_TW_talk)
  colnames(div_data_all)<-c("time","Not_TW_like","Not_TW_talk")
  
  add_path<-paste("C:/Users/Student/Desktop/pro/data/not_tw/",save_name,".csv",sep = "")
  write.csv(div_data_all, file = add_path)
}