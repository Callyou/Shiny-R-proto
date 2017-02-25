### To load the csv
setwd("C:\\Users\\Calliane\\Desktop\\Shiny-R-proto")
datafrs<-read.csv("C:\\Users\\Calliane\\Desktop\\Shiny-R-proto\\datafrs3.csv")

# treatment on the data set
datafrs<-subset(datafrs, select =-c(X))
datafrs<-datafrs[-c(3183),]

datafrs$name <- as.factor(datafrs$name)
datafrs$location <- as.factor(datafrs$location)
datafrs$totalscore <- as.numeric(datafrs$totalscore)
datafrs$date <- as.Date(datafrs$date)
datafrs$dob <- as.Date(datafrs$dob)
datafrs$nationality <- as.factor(datafrs$nationality)

# to produce the graph
library(data.table)

# all season
datat <- data.table(datafrs)
ath <- datat[,list(mrank=mean(rank), mdist_p=mean(dist_p),mkmh_scaled=mean(kmh_scaled), mjudges=mean(judges), mwind=mean(wind), .N), by=name][order(mrank)]
ath <- as.data.frame(ath)

#season 1
datat1 <- data.table(datafrs[datafrs$saison==1,])
ath1 <- datat1[,list(mrank=mean(rank), mdist_p=mean(dist_p),mkmh_scaled=mean(kmh_scaled), mjudges=mean(judges), mwind=mean(wind), .N), by=name][order(mrank)]
ath1 <- as.data.frame(ath1)

#season 2
datat2 <- data.table(datafrs[datafrs$saison==2,])
ath2 <- datat2[,list(mrank=mean(rank), mdist_p=mean(dist_p),mkmh_scaled=mean(kmh_scaled), mjudges=mean(judges), mwind=mean(wind), .N), by=name][order(mrank)]
ath2 <- as.data.frame(ath2)

#season 3
datat3 <- data.table(datafrs[datafrs$saison==3,])
ath3 <- datat3[,list(mrank=mean(rank), mdist_p=mean(dist_p),mkmh_scaled=mean(kmh_scaled), mjudges=mean(judges), mwind=mean(wind), .N), by=name][order(mrank)]
ath3 <- as.data.frame(ath3)

#season 4
datat4 <- data.table(datafrs[datafrs$saison==4,])
ath4 <- datat4[,list(mrank=mean(rank), mdist_p=mean(dist_p),mkmh_scaled=mean(kmh_scaled), mjudges=mean(judges), mwind=mean(wind), .N), by=name][order(mrank)]
ath4 <- as.data.frame(ath4)