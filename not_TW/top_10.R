
folder_path<-dir("C:/pro/data/add_detal_of_data")

length_folder_path<-length(folder_path)

col_name<-NULL
like_top_10<-NULL

#file number
for (q in 1:length_folder_path) {
  
  #like
  if (grepl("like",folder_path[q])) {
    file_path<-paste("C:/pro/data/add_detal_of_data/",folder_path[q],sep = "")
    like_data<-read.csv(file_path)
    like_data_sort<-sort(like_data[24,3:length(like_data)],decreasing = TRUE)
    like_top<-like_data_sort[1:10]
    
    #前十國名,人數
    like_top_clean<-NULL
    like_top_name<-NULL
    for (rr in 1:10) {
      like_top_clean<-c(like_top_clean,like_top[[rr]])
      like_top_name<-c(like_top_name,colnames(like_top[rr]))
    }
  }
  
  #talk
  if (grepl("talk",folder_path[q])) {
    file_path<-paste("C:/pro/data/add_detal_of_data/",folder_path[q],sep = "")
    like_data<-read.csv(file_path)
    
    #各國talk值相加
    talk_col_name<-NULL
    talk_col_value<-NULL
    for (tt in 3:length(like_data)) {
      
      #國名
      talk_col_name<-c(talk_col_name,colnames(like_data[tt]))
      add_talk_col_value<-0
      #各國人數相加
      for (uu in 1:nrow(like_data)) {
        add_talk_col_value<-add_talk_col_value+like_data[uu,tt]
      }
      talk_col_value<-c(talk_col_value,add_talk_col_value)
    }
    #整理型態
    dim(talk_col_value)<-c(1,201)
    colnames(talk_col_value)<-talk_col_name
    
    #前十名
    like_data_sort<-sort(talk_col_value[1,1:length(talk_col_value)],decreasing = TRUE)
    like_top<-like_data_sort[1:10]
    like_top<-as.data.frame(like_top)
    
    #前十國名,人數
    like_top_clean<-NULL
    like_top_name<-NULL
    for (rr in 1:10) {
      like_top_clean<-c(like_top_clean,like_top[rr,1])
    }
    like_top_name<-rownames(like_top)
  }
  
  #地點,行名稱*2
  file_name<-unlist(strsplit(folder_path[q],split = ".csv"))
  col_name<-c(col_name,file_name,file_name)
  
  #top 10 國家,人數
  like_top_10<-cbind(like_top_10,like_top_name,like_top_clean)
}

as.data.frame(like_top_10)
colnames(like_top_10)<-col_name

top10_path<-paste("C:/pro/data/top 10/top10.csv")
write.csv(like_top_10,top10_path)


