
all<-dir(paste("C:/Users/Student/Desktop/pro/data/total_add",sep = ""))

file_length<-length(all)

for (x in 1:file_length) {
  add_path<-paste("C:/Users/Student/Desktop/pro/data/total_add/",all[x],sep = "")
  if (x==1) {
    add_chiao<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==2) {
    add_ilan<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==3) {
    add_lotung<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==4) {
    add_suao<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==5) {
    add_toucheng<-read.csv(add_path,stringsAsFactors = FALSE)
  }
}

zero<-cbind(c(1:120),c(0))
zero_1<-zero[,2]
dim(zero_1)<-c(24,5)

chiao<-zero_1
ilan<-zero_1
lotung<-zero_1
suao<-zero_1
toucheng<-zero_1

for (r in 1:24) {
  for (c in 1:5) {
    chiao[r,c]<-add_chiao[25-r,c+1]
  }
}
for (r in 1:24) {
  for (c in 1:5) {
    ilan[r,c]<-add_ilan[25-r,c+1]
  }
}
for (r in 1:24) {
  for (c in 1:5) {
    lotung[r,c]<-add_lotung[25-r,c+1]
  }
}
for (r in 1:24) {
  for (c in 1:5) {
    suao[r,c]<-add_suao[25-r,c+1]
  }
}
for (r in 1:24) {
  for (c in 1:5) {
    toucheng[r,c]<-add_toucheng[25-r,c+1]
  }
}

colnames(chiao)<-c("time","like","TW_like","talk","TW_talk")
colnames(ilan)<-c("time","like","TW_like","talk","TW_talk")
colnames(lotung)<-c("time","like","TW_like","talk","TW_talk")
colnames(suao)<-c("time","like","TW_like","talk","TW_talk")
colnames(toucheng)<-c("time","like","TW_like","talk","TW_talk")


add_path<-paste("C:/Users/Student/Desktop/pro/data/plot_data/chiao.csv",sep = "")
write.csv(chiao, file = add_path)

add_path<-paste("C:/Users/Student/Desktop/pro/data/plot_data/ilan.csv",sep = "")
write.csv(ilan, file = add_path)

add_path<-paste("C:/Users/Student/Desktop/pro/data/plot_data/lotung.csv",sep = "")
write.csv(lotung, file = add_path)

add_path<-paste("C:/Users/Student/Desktop/pro/data/plot_data/suao.csv",sep = "")
write.csv(suao, file = add_path)

add_path<-paste("C:/Users/Student/Desktop/pro/data/plot_data/toucheng.csv",sep = "")
write.csv(toucheng, file = add_path)

View(chiao)
