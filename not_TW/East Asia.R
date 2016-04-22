{
x1<-chiao_talk$HK+chiao_talk$CN+chiao_talk$JP

value_range <- range(0,x1)

plot(x1, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
##
x2<-ilan_talk$HK+ilan_talk$CN+ilan_talk$JP

value_range <- range(0,x2)

plot(x2, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
##
x3<-lotung_talk$HK+lotung_talk$CN+lotung_talk$JP
#x3[11]<-1000
value_range <- range(0,x3)

plot(x3, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
##
x4<-suao_talk$HK+suao_talk$CN+suao_talk$JP

value_range <- range(0,x4)

plot(x4, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
##
x5<-toucheng_talk$HK+toucheng_talk$CN+toucheng_talk$JP

value_range <- range(0,x5)

plot(x5, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
}

#x1,x2,x3,x4,x5
#mean
{
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
}

#sum
{
  time<-NULL
  x1_mean<-NULL
  x2_mean<-NULL
  x3_mean<-NULL
  x4_mean<-NULL
  x5_mean<-NULL
  for (gg in 1:24) {
    if(gg%%3==0){
      time<-c(time,ilan$time[gg])
      
      x1_mean<-c(x1_mean,sum(x1[gg],x1[gg-1],x1[gg-2]))
      x2_mean<-c(x2_mean,sum(x2[gg],x2[gg-1],x2[gg-2]))
      x3_mean<-c(x3_mean,sum(x3[gg],x3[gg-1],x3[gg-2]))
      x4_mean<-c(x4_mean,sum(x4[gg],x4[gg-1],x4[gg-2]))
      x5_mean<-c(x5_mean,sum(x5[gg],x5[gg-1],x5[gg-2]))
    }
  }
}
######################################################################################
{
  value_range <- range(0,x1,x2,x3,x4,x5)
  
  plot(x1, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:24, lab=ilan$time)
  axis(2, las=1, at=200*0:value_range[2])
  
  box()
  
  lines(x2, type="o", lty=1, col="red")
  lines(x3, type="o", lty=1, col="#00DB00")
  lines(x4, type="o", lty=1, col="#272727")
  lines(x5, type="o", lty=1, col="purple")
  
  title(main="East Asia", font.main=4)
  
  title(xlab="Time")
  title(ylab="Number of people")
  
  legend("topleft", g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red","#00DB00","#272727","purple"), pch=21:22, lty=1:2)
}
######################################################################################
##mean
{
  value_range <- range(0,x1_mean,x2_mean,x3_mean,x4_mean,x5_mean)
  
  plot(x1_mean, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:8, lab=time)
  axis(2, las=1, at=200*0:value_range[2])
  
  box()
  
  lines(x2_mean, type="o", lty=1, col="red")
  lines(x3_mean, type="o", lty=1, col="#00DB00")
  lines(x4_mean, type="o", lty=1, col="#272727")
  lines(x5_mean, type="o", lty=1, col="purple")
  
  title(main="East Asia", font.main=4)
  
  title(xlab="Time")
  title(ylab="Number of people")
  
  legend("topleft", g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red","#00DB00","#272727","purple"), pch=21:22, lty=1:2)
}
######################################################################################
##sum
{
  value_range <- range(0,x1_mean,x2_mean,x3_mean,x4_mean,x5_mean)
  
  plot(x1_mean, type="o", col="blue", ylim=value_range,axes=FALSE, ann=FALSE)
  
  axis(1, at=1:8, lab=time)
  axis(2, las=1, at=200*0:value_range[2])
  
  box()
  
  lines(x2_mean, type="o", lty=1, col="red")
  lines(x3_mean, type="o", lty=1, col="#00DB00")
  lines(x4_mean, type="o", lty=1, col="#272727")
  lines(x5_mean, type="o", lty=1, col="purple")
  
  title(main="East Asia", font.main=4)
  
  title(xlab="Time")
  title(ylab="Number of people")
  
  legend("topleft", g_range[2], c("chiao","ilan","lotung","suao","toucheng"), cex=0.8, col=c("blue","red","#00DB00","#272727","purple"), pch=21:22, lty=1:2)
}

