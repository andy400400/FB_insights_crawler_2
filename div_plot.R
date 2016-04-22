#TOTAL
#all<-dir(paste("C:/Users/Student/Desktop/pro/data/plot_data",sep = ""))

#DIV
all<-dir(paste("C:/Users/Student/Desktop/pro/data/div_data",sep = ""))

file_length<-length(all)

for (x in 1:file_length) {
  
  #TOTAL
  #add_path<-paste("C:/Users/Student/Desktop/pro/data/plot_data/",all[x],sep = "")
  
  #DIV
  add_path<-paste("C:/Users/Student/Desktop/pro/data/div_data/",all[x],sep = "")
  
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

#######################################################################

#talk
{
  value_range <- range(0, chiao$talk, ilan$talk, lotung$talk, suao$talk, toucheng$talk)
  
  plot(chiao$talk, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:24, lab=chiao$time)
  axis(2, las=1, at=30000*value_range[1]:value_range[2])
  
  box()
  
  lines(ilan$talk, type="o", lty=1, col="red")
  lines(lotung$talk, type="o", lty=1, col="#00DB00")
  lines(suao$talk, type="o", lty=1, col="#272727")
  lines(toucheng$talk, type="o", lty=1, col="#FFAF60")
  
  title(main="Talking About", font.main=4)
  
  title(xlab="Time")
  title(ylab="Number of people")
  
  legend(3, g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2)
}

#######################################################################

#TW_talk
{
  value_range <- range(0, chiao$TW_talk, ilan$TW_talk, lotung$TW_talk, suao$TW_talk, toucheng$TW_talk)
  
  plot(chiao$TW_talk, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:24, lab=chiao$time)
  axis(2, las=1, at=30000*value_range[1]:value_range[2])
  
  box()
  
  lines(ilan$TW_talk, type="o", lty=1, col="red")
  lines(lotung$TW_talk, type="o", lty=1, col="#00DB00")
  lines(suao$TW_talk, type="o", lty=1, col="#272727")
  lines(toucheng$TW_talk, type="o", lty=1, col="#FFAF60")
  
  title(main="TW_Talking About", font.main=4)
  
  title(xlab="Time")
  title(ylab="Number of people")
  
  legend(1, g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2)
}

#######################################################################

#like
{
  value_range <- range(0, chiao$like, ilan$like, lotung$like, suao$like, toucheng$like)
  
  plot(chiao$like, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:24, lab=chiao$time)
  axis(2, las=1, at=30000*value_range[1]:value_range[2])
  
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

#TW_like
{
  value_range <- range(0, chiao$TW_like, ilan$TW_like, lotung$TW_like, suao$TW_like, toucheng$TW_like)
  
  plot(chiao$TW_like, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:24, lab=chiao$time)
  axis(2, las=1, at=60000*0:value_range[2])
  
  box()
  
  lines(ilan$TW_like, type="o", lty=1, col="red")
  lines(lotung$TW_like, type="o", lty=1, col="#00DB00")
  lines(suao$TW_like, type="o", lty=1, col="#272727")
  lines(toucheng$TW_like, type="o", lty=1, col="#FFAF60")
  
  title(main="TW_Like", font.main=4)
  
  title(xlab="Time")
  title(ylab="Number of people")
  
  legend(1, g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2)
}

#######################################################################