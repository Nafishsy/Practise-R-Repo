
data <- read.csv("USArrests.csv",header = TRUE)
str(data)
data$X <- NULL #NUll kore disi karon x akta string er jonno scale use korte pari na

data2<-scale(data)
library('factoextra')

#z-score-normalization if we have outlier then  
fviz_nbclust(data2,kmeans,method= 'wss')

#optimal value ber hobe

km<- kmeans(data2,centers = 4,nstart = 25)
#% diye compactness bujhte parbo

#Visualize the output of K-means clustering Algorithem

df_member <-cbind(data2,cluster = km$cluster)
df_member


#first duita attribute er upor clustering kore, scatterplot e
fviz_cluster(km,data = data2)

#to find mean to every cluster

arrg<-aggregate(USArrests, by=list(cluster=km$cluster),mean)
arrg
