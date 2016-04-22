library("XML")
library("httr")
library("stringr")
library("dplyr")
library("jsonlite")

access_token_change<-'CAACEdEose0cBANwDwiFMfEAuY12ZBChx06cmva9hd8d7WrHbi938VX0g65nANE51XZCENs4zSq6c7aeAiqkbu4T46KLYI6O2lQbCh35pFTo8phwmAh8TlkLBoAZBShvPmhav0KWmDFeSOZBQreoISsZA4huYtldJL8qnZASeUwKD8CdUGDhnfEIUjvSpjf4VuWPEiHiVKTxAZDZD'

url <-paste('https://graph.facebook.com/v2.0/search?type=place&center=24.638,121.767&distance=2200','&access_token=',access_token_change,sep = "")

html_index <- content(GET(url),as = 'parsed')

html_id<-NULL
html_name<-NULL
html_latitude<-NULL
html_longitude<-NULL

for (x in 1:229) {
  html_id<-c(html_id,html_index$data[[x]]$id)
  html_name<-c(html_name,html_index$data[[x]]$name)
  html_latitude<-c(html_latitude,html_index$data[[x]]$location$latitude)
  html_longitude<-c(html_longitude,html_index$data[[x]]$location$longitude)
}


html_all<-cbind(html_id,html_name,html_latitude,html_longitude)


View(html_all)

all_path<-paste("D:/111/","dongshan",".csv",sep = "")
write.csv(html_all, file = all_path)

#¼W¥[®e§Ô­È
options(digits = 20)

in_data<-read.csv(all_path)

View(in_data_fr)
