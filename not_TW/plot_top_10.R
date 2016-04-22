
all<-dir(paste("C:/pro/data/add_detal_of_data",sep = ""))

file_length<-length(all)

for (x in 1:file_length) {
  
  add_path<-paste("C:/pro/data/add_detal_of_data/",all[x],sep = "")
  
  #like
  if (x==1) {
    chiao_like<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==3) {
    ilan_like<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==5) {
    lotung_like<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==7) {
    suao_like<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==9) {
    toucheng_like<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  
  #talk
  if (x==2) {
    chiao_talk<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==4) {
    ilan_talk<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==6) {
    lotung_talk<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==8) {
    suao_talk<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==10) {
    toucheng_talk<-read.csv(add_path,stringsAsFactors = FALSE)
  }
}

#######################################################################
#chiao
  
  #like

{
  country_time<-chiao_like$time[2:24]
  
  chiao_country_div<-NULL
  country_length<-length(chiao_like$ID)
  for (ff in 1:(country_length-1)){
    country_div<-chiao_like$ID[ff+1]-chiao_like$ID[ff]
    chiao_country_div<-c(chiao_country_div,country_div)
  }
  
  ilan_country_div<-NULL
  country_length<-length(ilan_like$ID)
  for (ff in 1:(country_length-1)){
    country_div<-ilan_like$ID[ff+1]-ilan_like$ID[ff]
    ilan_country_div<-c(ilan_country_div,country_div)
  }
  
  lotung_country_div<-NULL
  country_length<-length(lotung_like$ID)
  for (ff in 1:(country_length-1)){
    country_div<-lotung_like$ID[ff+1]-lotung_like$ID[ff]
    lotung_country_div<-c(lotung_country_div,country_div)
  }

  suao_country_div<-NULL
  country_length<-length(suao_like$ID)
  for (ff in 1:(country_length-1)){
    country_div<-suao_like$ID[ff+1]-suao_like$ID[ff]
    suao_country_div<-c(suao_country_div,country_div)
  }
  
  toucheng_country_div<-NULL
  country_length<-length(toucheng_like$ID)
  for (ff in 1:(country_length-1)){
    country_div<-toucheng_like$ID[ff+1]-toucheng_like$ID[ff]
    toucheng_country_div<-c(toucheng_country_div,country_div)
  }
  
  
  
    value_range <- range(0, chiao_country_div,ilan_country_div,lotung_country_div,suao_country_div,toucheng_country_div)
    
    plot(chiao_country_div, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
    
    axis(1, at=1:24, lab=ilan$time)
    axis(2, las=1, at=50*value_range[1]:value_range[2])
    
    box()
    
    lines(ilan_country_div, type="o", lty=1, col="red")
    lines(lotung_country_div, type="o", lty=1, col="#00DB00")
    lines(suao_country_div, type="o", lty=1, col="#272727")
    lines(toucheng_country_div, type="o", lty=1, col="purple")
    
    title(main="ID", font.main=4)
    
    title(xlab="Time")
    title(ylab="Number of people")
    
    legend("topleft", g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red","#00DB00","#272727","purple"), pch=21:22, lty=1:2)
}
#####################################################################
  #talk
  #chiao,ilan,lotung,suao,toucheng
  
  talk<-cbind(chiao_talk$time,ilan_talk$MY,lotung_talk$MY,suao_talk$MY,toucheng_talk$MY)
  colnames(talk)<-c("time","MY","HK","SG","US")
  
  ###################################
  

  ###################################
  {
    value_range <- range(0, log10(chiao_talk$CN),log10(ilan_talk$CN),log10(lotung_talk$CN),log10(suao_talk$CN),log10(toucheng_talk$CN))
    
    plot(log10(chiao_talk$CN), type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
    
    axis(1, at=1:24, lab=ilan$time)
    axis(2, las=1, at=1*0:value_range[2])
    
    box()
    
    lines(log10(ilan_talk$CN), type="o", lty=1, col="red")
    lines(log10(lotung_talk$CN), type="o", lty=1, col="#00DB00")
    lines(log10(suao_talk$CN), type="o", lty=1, col="#272727")
    lines(log10(toucheng$CN), type="o", lty=1, col="purple")

    title(main="CN", font.main=4)
    
    title(xlab="Time")
    title(ylab="Number of people")
    
    legend("topleft", g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red","#00DB00","#272727","purple"), pch=21:22, lty=1:2)
  }
  
  
  