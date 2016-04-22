data_colnames<-NULL
unique_all_colnames<-NULL

a1<-dir("C:/pro/data/detal_of_data")
a1_length<-length(a1)

for (x1 in 1:a1_length) {
  a2<-dir(paste("C:/pro/data/detal_of_data/",a1[x1],sep=""))
  a2_length<-length(a2)
  
  for (x2 in 1:a2_length) {
    a3<-dir(paste("C:/pro/data/detal_of_data/",a1[x1],"/",a2[x2],sep=""))
    a3_length<-length(a3)
    
    for (x3 in 1:a3_length) {
      a4<-read.csv(paste("C:/pro/data/detal_of_data/",a1[x1],"/",a2[x2],"/",a3[x3],sep=""))
      a4_colnames<-colnames(a4)
      data_colnames<-c(data_colnames,a4_colnames)
      unique_all_colnames<-unique(data_colnames)
    }
  }
}

add_path<-paste("C:/pro/data/all_country.csv",sep = "")
write.csv(unique_all_colnames,add_path)
