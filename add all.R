yourfolder<-'suao'
yourname<-'add_suao'

all<-dir(paste("C:/Users/Student/Desktop/pro/data/",yourfolder,sep = ""))
all.length<-length(all)


add_total_like<-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
add_TW_like<-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
add_talk<-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
add_TW_talk<-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
add_all<-cbind(add_total_like,add_TW_like,add_talk,add_TW_talk)
add_all_data<-as.data.frame(add_all)

#loop file
for (x in 1:all.length) {
  add_path<-paste("C:/Users/Student/Desktop/pro/data/",yourfolder,"/",all[x],sep = "")
  add_data<-read.csv(add_path,stringsAsFactors = FALSE)
  #loop row
  for (y in 1:4) {
    #loop col
    for (z in 1:24) {
      #避免空值
      if (!is.na(add_data[z,(y+2)])) {
        add_all_data[z,y]<-add_all_data[z,y]+add_data[z,(y+2)]
      }
    }
  }
}

#改變時間格式
add_time<-NULL
add_noclean<-add_data$time
for (a in 1:length(add_noclean)) {
  time_split<-unlist(strsplit(add_noclean[a],split="-",fixed=T))
  time_con<-paste(time_split[1],"/",time_split[2],sep = "")
  add_time<-c(add_time,time_con)
}



#結合時間
add_all_data<-cbind(add_time,add_all_data)


add_path<-paste("C:/Users/Student/Desktop/pro/data/",yourname,".csv",sep = "")
write.csv(add_all_data, file = add_path)


#check
View(add_data)
View(add_all_data)
