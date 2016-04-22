x1<-dir('D:/0000')

x2<-paste('D:/0000/',x1[1],sep = "")

data<-read.csv(x2)
data_row<-nrow(data)

Id<-NULL
Time<-NULL
Buy<-NULL
Sell<-NULL
Deal<-NULL
Vol<-NULL
BS<-NULL

for (x in 1:data_row) {
  data_value<-unlist(strsplit(as.character(data[x,1])," "))
 
  Time<-c(Time,data_value[3])

}

data_cbind<-cbind(Id,Time,Buy,Sell,Deal,Vol,BS)

x3<-paste('D:/000/',x1[1],sep = "")
write.csv(data_cbind,x3)

use_data<-read.csv(x3)

head(use_data)

head(use_data$Time,50)
time_length<-length(use_data$Time)

time_num<-1
for (y in 1:time_length) {
  if (use_data$Time[y]==use_data$Time[y+1]) {
    time_num<-time_num+1
  }
  
}

colnames(use_data)

length(use_data$Deal)
plot(use_data$Deal, type="o", col="blue",axes=FALSE, ann=FALSE)
