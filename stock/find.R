
all<-dir(paste("C:/EXdata/FinancialInformation/FIData/getStockNumFI",sep = ""))

length_all<-length(all)
data_all<-NULL

for (zz in 1:198) {
  x1_path<-paste("C:/EXdata/FinancialInformation/FIData/getStockNumFI/",all[zz],sep = "")
  x1<-read.csv(x1_path,fileEncoding="UTF-8",stringsAsFactors = FALSE)
  
  last_row<-nrow(x1)
  colname_length<-length(colnames(x1))
  for (yy in 1:colname_length) {
    if (colnames(x1)[yy] == "NetPrice_Shared") {
      for (xx in 1:last_row) {
        if (x1$Time[xx]=="2014Q2") {
          data_2015Q2<-x1[xx,3:22]
          div<-x1[xx+1,yy]-x1[xx,yy]
          data_2015Q2<-cbind(data_2015Q2,div)
          
          data_all<-rbind(data_all,data_2015Q2)
        }
      }
    }
  }
}
for (zz in 200:length_all) {
  x1_path<-paste("C:/EXdata/FinancialInformation/FIData/getStockNumFI/",all[zz],sep = "")
  x1<-read.csv(x1_path,fileEncoding="UTF-8",stringsAsFactors = FALSE)
  
  last_row<-nrow(x1)
  colname_length<-length(colnames(x1))
  for (yy in 1:colname_length) {
    if (colnames(x1)[yy] == "NetPrice_Shared") {
      for (xx in 1:last_row) {
        if (x1$Time[xx]=="2014Q2") {
          data_2015Q2<-x1[xx,3:22]
          div<-x1[xx+1,yy]-x1[xx,yy]
          data_2015Q2<-cbind(data_2015Q2,div)
          
          data_all<-rbind(data_all,data_2015Q2)
        }
      }
    }
  }
}


View(data_all)

#檢查NA
length_data_all_colname<-length(colnames(data_all))
for (dd in 1:length_data_all_colname) {
  if (sum(is.na(data_all[,dd]))>0) {
    print(colnames(data_all)[dd])
  }
}

#去除NA
data_nrow<-nrow(data_all)
data_all_clean<-NULL
for (ss in 1:data_nrow) {
  if(sum(is.na(data_all[ss,])) == 0){
    data_all_clean<-rbind(data_all_clean,data_all[ss,])
  }
}

View(data_all_clean)

######################################################################################

outcome<-as.factor(ifelse(data_all_clean$div>=0,1,0))
OR_Rate<-data_all_clean$OR_Rate
#Income<-data_all_clean$Income-as.integer(data_all_clean$Income_YoY)
nO_Income<-as.integer(data_all_clean$nO_Income)-as.integer(data_all_clean$nO_Income_YoY)
N_Income<-data_all_clean$N_Income-as.integer(data_all_clean$N_Income_YoY)
N_Income_Rate<-data_all_clean$N_Income_Rate
N_Income_Shared<-data_all_clean$N_Income_Shared-data_all_clean$N_Income_Shared_YoY
Shared<-data_all_clean$Shared
NetPrice_totalAsset<-data_all_clean$NetPrice_totalAsset
FlowRate<-data_all_clean$FlowRate
#QuickRate<-data_all_clean$QuickRate


######################################################################################

#LASSO
x <- cbind(OR_Rate,Income,nO_Income,N_Income,N_Income_Rate,N_Income_Shared,Shared,NetPrice_totalAsset,FlowRate,QuickRate)
glmmod<-
  cv.glmnet(x,outcome,alpha=1,family='binomial')
plot(glmmod$glmnet.fit,label=TRUE)
glmmod$lambda.min
#s
coef(glmmod,s=0.002497611)

######################################################################################

data_all_clean
colnames(data_all_clean)

data_all_clean$div<-ifelse(data_all_clean$div>=0,1,0)

g<-glm(data_all_clean$div ~ data_all_clean$N_Income_Shared_YoY,data=data_all_clean, family = "binomial")
x <- predict(g, newdata = data_all_clean, type = "response")

plot(x~ data_all_clean$N_Income_Shared_YoY,data=data_all_clean)

mean(ifelse(data_all_clean$div==x,1,0))
