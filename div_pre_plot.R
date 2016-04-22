all<-dir(paste("C:/Users/Student/Desktop/pro/data/total_add",sep = ""))

file_length<-length(all)

for (x in 1:file_length) {
  add_path<-paste("C:/Users/Student/Desktop/pro/data/total_add/",all[x],sep = "")
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

#########################################################################

#chiao,ilan,lotung,suao,toucheng
save_name<-"div_toucheng"
plot_data<-toucheng

{
  div_like<-NULL
  div_TW_like<-NULL
  div_talk<-NULL
  div_TW_talk<-NULL
  div_time<-NULL
  
  for (w in 24:2) {
    div_like<-c(div_like,plot_data[w-1,3]-plot_data[w,3])
    div_TW_like<-c(div_TW_like,plot_data[w-1,4]-plot_data[w,4])
    div_talk<-c(div_talk,plot_data[w-1,5]-plot_data[w,5])
    div_TW_talk<-c(div_TW_talk,plot_data[w-1,6]-plot_data[w,6])
  }
  for (w in 23:1) {
    div_time<-c(div_time,plot_data[w,2])
  }
  
  
  
  div_data_all<-cbind(div_time,div_like,div_TW_like,div_talk,div_TW_talk)
  colnames(div_data_all)<-c("time","like","TW_like","talk","TW_talk")
  
  add_path<-paste("C:/Users/Student/Desktop/pro/data/div_pre/",save_name,".csv",sep = "")
  write.csv(div_data_all, file = add_path)
}


#########################################################################

all<-dir(paste("C:/Users/Student/Desktop/pro/data/div_pre",sep = ""))

file_length<-length(all)

for (x in 1:file_length) {
  add_path<-paste("C:/Users/Student/Desktop/pro/data/div_pre/",all[x],sep = "")
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

#########################################################################
#talk
{
  value_range <- range(0, chiao$talk, ilan$talk, lotung$talk, suao$talk, toucheng$talk)
  
  plot(chiao$talk, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:23, lab=chiao$time)
  axis(2, las=1, at=30000*value_range[1]:value_range[2])
  
  box()
  
  lines(ilan$talk, type="o", lty=1, col="red")
  lines(lotung$talk, type="o", lty=1, col="#00DB00")
  lines(suao$talk, type="o", lty=1, col="#272727")
  lines(toucheng$talk, type="o", lty=1, col="#FFAF60")
  
  title(main="Talking About", font.main=4)
  
  title(xlab="Time")
  title(ylab="Number of people")
  
  legend(1, g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2)
}

#######################################################################

#like
{
  value_range <- range(0, chiao$like, ilan$like, lotung$like, suao$like, toucheng$like)
  
  plot(chiao$like, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:23, lab=chiao$time)
  axis(2, las=1, at=5000*0:value_range[2])
  
  box()
  
  lines(ilan$like, type="o", lty=1, col="red")
  lines(lotung$like, type="o", lty=1, col="#00DB00")
  lines(suao$like, type="o", lty=1, col="#272727")
  lines(toucheng$like, type="o", lty=1, col="#FFAF60")
  
  title(main="Like", font.main=4)
  
  title(xlab="Time")
  title(ylab="Number of people")
  
  legend(1, g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2)
}

#######################################################################
