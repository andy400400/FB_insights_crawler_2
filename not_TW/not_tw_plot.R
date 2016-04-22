all<-dir(paste("C:/pro/data/not_tw",sep = ""))

file_length<-length(all)

for (x in 1:file_length) {
  
  add_path<-paste("C:/pro/data/not_tw/",all[x],sep = "")
  
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

x1<-chiao[,4]
x2<-ilan[,4]
x3<-lotung[,4]
x4<-suao[,4]
x5<-toucheng[,4]

###################################
time<-NULL
x1_mean<-NULL
x2_mean<-NULL
x3_mean<-NULL
x4_mean<-NULL
x5_mean<-NULL
for (gg in 1:24) {
  if(gg%%3==0){
    time<-c(time,ilan$time[gg])
    
    x1_mean<-c(x1_mean,mean(x1[gg],x1[gg-1],x1[gg-2]))
    x2_mean<-c(x2_mean,mean(x2[gg],x2[gg-1],x2[gg-2]))
    x3_mean<-c(x3_mean,mean(x3[gg],x3[gg-1],x3[gg-2]))
    x4_mean<-c(x4_mean,mean(x4[gg],x4[gg-1],x4[gg-2]))
    x5_mean<-c(x5_mean,mean(x5[gg],x5[gg-1],x5[gg-2]))
  }
}
###################################
{
  value_range <- range(0, chiao$Not_TW_talk,ilan$Not_TW_talk,lotung$Not_TW_talk,suao$Not_TW_talk,toucheng$Not_TW_talk)
  
  plot(chiao$Not_TW_talk, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:24, lab=ilan$time)
  axis(2, las=1, at=2000*0:value_range[2])
  
  box()
  
  lines(ilan$Not_TW_talk, type="o", lty=1, col="red")
  lines(lotung$Not_TW_talk, type="o", lty=1, col="#00DB00")
  lines(suao$Not_TW_talk, type="o", lty=1, col="#272727")
  lines(toucheng$Not_TW_talk, type="o", lty=1, col="purple")
  
  title(main="Not_TW_talk", font.main=4)
  
  title(xlab="Time")
  title(ylab="Number of people")
  
  legend("topleft", g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red","#00DB00","#272727","purple"), pch=21:22, lty=1:2)
}
###################################
##mean
{
  value_range <- range(0,x1_mean,x2_mean,x3_mean,x4_mean,x5_mean)
  
  plot(x1_mean, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:8, lab=time)
  axis(2, las=1, at=500*0:value_range[2])
  
  box()
  
  lines(x2_mean, type="o", lty=1, col="red")
  lines(x3_mean, type="o", lty=1, col="#00DB00")
  lines(x4_mean, type="o", lty=1, col="#272727")
  lines(x5_mean, type="o", lty=1, col="purple")
  
  title(main="not TW", font.main=4)
  
  title(xlab="Time")
  title(ylab="Number of people")
  
  legend("topleft", g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red","#00DB00","#272727","purple"), pch=21:22, lty=1:2)
}