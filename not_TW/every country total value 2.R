
all<-dir(paste("C:/pro/data/add_detal_of_data",sep = ""))

file_length<-length(all)

for (x in 1:file_length) {
  
  add_path<-paste("C:/pro/data/add_detal_of_data/",all[x],sep = "")
  
  #like
  if (x==1) {
    dongshan_like<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==3) {
    jhuangwei_like<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==5) {
    sanxing_like<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==7) {
    wujie_like<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==9) {
    yuanshan_like<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  
  #talk
  if (x==2) {
    dongshan_talk<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==4) {
    jhuangwei_talk<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==6) {
    sanxing_talk<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==8) {
    wujie_talk<-read.csv(add_path,stringsAsFactors = FALSE)
  }
  if (x==10) {
    yuanshan_talk<-read.csv(add_path,stringsAsFactors = FALSE)
  }
}

#######################################################################
#dongshan,jhuangwei,sanxing,wujie,yuanshan
#_like,_talk
#MY,HK,US,CN,SG,JP,AU
length(dongshan_talk)
colnames(dongshan_talk)
zero<-cbind(c(1:120),c(0))
other<-zero[,2]
dim(other)<-c(24,5)

xx<-1
for (hh in 3:203) {
  if (sum(colnames(dongshan_talk)[hh]==c("MY","HK","US","CN","SG","JP","AU","TW"))<1) {
    for (jj in 1:24) {
      other[jj,xx]<-other[jj,xx]+yuanshan_talk[jj,hh]
    }
  }
}



##talk
{
  r1<-cbind(sum(dongshan_talk$MY),sum(dongshan_talk$HK),sum(dongshan_talk$US),sum(dongshan_talk$CN),sum(dongshan_talk$SG),sum(dongshan_talk$JP),sum(dongshan_talk$AU))
  r2<-cbind(sum(jhuangwei_talk$MY),sum(jhuangwei_talk$HK),sum(jhuangwei_talk$US),sum(jhuangwei_talk$CN),sum(jhuangwei_talk$SG),sum(jhuangwei_talk$JP),sum(jhuangwei_talk$AU))
  r3<-cbind(sum(sanxing_talk$MY),sum(sanxing_talk$HK),sum(sanxing_talk$US),sum(sanxing_talk$CN),sum(sanxing_talk$SG),sum(sanxing_talk$JP),sum(sanxing_talk$AU))
  r4<-cbind(sum(wujie_talk$MY),sum(wujie_talk$HK),sum(wujie_talk$US),sum(wujie_talk$CN),sum(wujie_talk$SG),sum(wujie_talk$JP),sum(wujie_talk$AU))
  r5<-cbind(sum(yuanshan_talk$MY),sum(yuanshan_talk$HK),sum(yuanshan_talk$US),sum(yuanshan_talk$CN),sum(yuanshan_talk$SG),sum(yuanshan_talk$JP),sum(yuanshan_talk$AU))
  
  rr<-rbind(r1,r2,r3,r4,r5)
  colnames(rr)<-c("MY","HK","US","CN","SG","JP","AU")
  row.names(rr)<-c("dongshan","jhuangwei","sanxing","wujie","yuanshan")
  rr
}
#各國總人數
total<-NULL
for (e1 in 1:7) {
  add_value<-0
  for (e2 in 1:5) {
    add_value<-add_value+rr[e2,e1]
  }
  total<-c(total,add_value)
}
rr2<-rbind(rr,total)

#各區域總人數
total<-NULL
for (e1 in 1:5) {
  add_value<-0
  for (e2 in 1:7) {
    add_value<-add_value+rr[e1,e2]
  }
  total<-c(total,add_value)
}
rr3<-cbind(rr2,total)

rr3[6,8]<-81019

xx_path<-'C:/pro/data/country_value.csv'
write.csv(rr3,xx_path)


##like
#MY,HK,US,CN,SG,JP,AU

{
  l1<-cbind(dongshan_like$MY[24],dongshan_like$HK[24],dongshan_like$US[24],dongshan_like$CN[24],dongshan_like$SG[24],dongshan_like$JP[24],dongshan_like$AU[24])
  l2<-cbind(jhuangwei_like$MY[24],jhuangwei_like$HK[24],jhuangwei_like$US[24],jhuangwei_like$CN[24],jhuangwei_like$SG[24],jhuangwei_like$JP[24],jhuangwei_like$AU[24])
  l3<-cbind(sanxing_like$MY[24],sanxing_like$HK[24],sanxing_like$US[24],sanxing_like$CN[24],sanxing_like$SG[24],sanxing_like$JP[24],sanxing_like$AU[24])
  l4<-cbind(wujie_like$MY[24],wujie_like$HK[24],wujie_like$US[24],wujie_like$CN[24],wujie_like$SG[24],wujie_like$JP[24],wujie_like$AU[24])
  l5<-cbind(yuanshan_like$MY[24],yuanshan_like$HK[24],yuanshan_like$US[24],yuanshan_like$CN[24],yuanshan_like$SG[24],yuanshan_like$JP[24],yuanshan_like$AU[24])
  
  ll<-rbind(l1,l2,l3,l4,l5)
  colnames(ll)<-c("MY","HK","US","CN","SG","JP","AU")
  row.names(ll)<-c("dongshan","jhuangwei","sanxing","wujie","yuanshan")
  ll
}
