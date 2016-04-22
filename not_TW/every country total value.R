
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
#chiao,ilan,lotung,suao,toucheng
#_like,_talk
#MY,HK,US,CN,SG,JP,AU
length(chiao_talk)
colnames(chiao_talk)
zero<-cbind(c(1:120),c(0))
other<-zero[,2]
dim(other)<-c(24,5)

xx<-1
for (hh in 3:203) {
  if (sum(colnames(chiao_talk)[hh]==c("MY","HK","US","CN","SG","JP","AU","TW"))<1) {
    for (jj in 1:24) {
      other[jj,xx]<-other[jj,xx]+toucheng_talk[jj,hh]
    }
  }
}

  

##talk
{
  r1<-cbind(sum(chiao_talk$MY),sum(chiao_talk$HK),sum(chiao_talk$US),sum(chiao_talk$CN),sum(chiao_talk$SG),sum(chiao_talk$JP),sum(chiao_talk$AU))
  r2<-cbind(sum(ilan_talk$MY),sum(ilan_talk$HK),sum(ilan_talk$US),sum(ilan_talk$CN),sum(ilan_talk$SG),sum(ilan_talk$JP),sum(ilan_talk$AU))
  r3<-cbind(sum(lotung_talk$MY),sum(lotung_talk$HK),sum(lotung_talk$US),sum(lotung_talk$CN),sum(lotung_talk$SG),sum(lotung_talk$JP),sum(lotung_talk$AU))
  r4<-cbind(sum(suao_talk$MY),sum(suao_talk$HK),sum(suao_talk$US),sum(suao_talk$CN),sum(suao_talk$SG),sum(suao_talk$JP),sum(suao_talk$AU))
  r5<-cbind(sum(toucheng_talk$MY),sum(toucheng_talk$HK),sum(toucheng_talk$US),sum(toucheng_talk$CN),sum(toucheng_talk$SG),sum(toucheng_talk$JP),sum(toucheng_talk$AU))
  
  rr<-rbind(r1,r2,r3,r4,r5)
  colnames(rr)<-c("MY","HK","US","CN","SG","JP","AU")
  row.names(rr)<-c("chiao","ilan","lotung","suao","toucheng")
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
  l1<-cbind(chiao_like$MY[24],chiao_like$HK[24],chiao_like$US[24],chiao_like$CN[24],chiao_like$SG[24],chiao_like$JP[24],chiao_like$AU[24])
  l2<-cbind(ilan_like$MY[24],ilan_like$HK[24],ilan_like$US[24],ilan_like$CN[24],ilan_like$SG[24],ilan_like$JP[24],ilan_like$AU[24])
  l3<-cbind(lotung_like$MY[24],lotung_like$HK[24],lotung_like$US[24],lotung_like$CN[24],lotung_like$SG[24],lotung_like$JP[24],lotung_like$AU[24])
  l4<-cbind(suao_like$MY[24],suao_like$HK[24],suao_like$US[24],suao_like$CN[24],suao_like$SG[24],suao_like$JP[24],suao_like$AU[24])
  l5<-cbind(toucheng_like$MY[24],toucheng_like$HK[24],toucheng_like$US[24],toucheng_like$CN[24],toucheng_like$SG[24],toucheng_like$JP[24],toucheng_like$AU[24])
  
  ll<-rbind(l1,l2,l3,l4,l5)
  colnames(ll)<-c("MY","HK","US","CN","SG","JP","AU")
  row.names(ll)<-c("chiao","ilan","lotung","suao","toucheng")
  ll
}
