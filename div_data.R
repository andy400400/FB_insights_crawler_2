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
save_name<-"div_chiao"
plot_data<-chiao

{
div_like_no<-NULL
div_TW_like_no<-NULL
div_talk_no<-NULL
div_TW_talk_no<-NULL

for (w in 1:12) {
  div_like_no<-c(div_like_no,plot_data[w+12,3]-plot_data[w,3])
  div_TW_like_no<-c(div_TW_like_no,plot_data[w+12,4]-plot_data[w,4])
  div_talk_no<-c(div_talk_no,plot_data[w+12,5]-plot_data[w,5])
  div_TW_talk_no<-c(div_TW_talk_no,plot_data[w+12,6]-plot_data[w,6])
}

div_like<-NULL
div_TW_like<-NULL
div_talk<-NULL
div_TW_talk<-NULL

for (b in 10:12) {
  div_like<-c(div_like,div_like_no[b])
  div_TW_like<-c(div_TW_like,div_TW_like_no[b])
  div_talk<-c(div_talk,div_talk_no[b])
  div_TW_talk<-c(div_TW_talk,div_TW_talk_no[b])
}
for (a in 1:10) {
  div_like<-c(div_like,div_like_no[a])
  div_TW_like<-c(div_TW_like,div_TW_like_no[a])
  div_talk<-c(div_talk,div_talk_no[a])
  div_TW_talk<-c(div_TW_talk,div_TW_talk_no[a])
}

div_data_all<-cbind(div_like,div_TW_like,div_talk,div_TW_talk)
colnames(div_data_all)<-c("like","TW_like","talk","TW_talk")

add_path<-paste("C:/Users/Student/Desktop/pro/data/div_data/",save_name,".csv",sep = "")
write.csv(div_data_all, file = add_path)
}