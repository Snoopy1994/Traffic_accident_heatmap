install.packages("factoextra")
library(factoextra)

data<- read.csv("hsinchu_109_accident.csv", header = TRUE)
head(data)
df<-data[,3:4]
head(df)

set.seed(929)
km.res=kmeans(df, 5, nstart = 25)
fviz_cluster(km.res, df, frame=FALSE, geom="point")

install.packages("fpc")
db=fpc::dbscan(df, eps=0.015, MinPts=3)
plot(db, df, main= "DBSCAN", frame= FALSE)

library("factoextra")
fviz_cluster(db, df, stand=FALSE, frame=FALSE, geom="point")
print(db)

NROW(db$cluster)
db$cluster[sample(1:1100,50)]

install.packages("dbscan")
dbscan::kNNdistplot(df, k=3)
abline(h=0.005, lty=2)

res.fpc=fpc::dbscan(df, eps = 0.005, MinPts = 3)
res.db=dbscan::dbscan(df, 0.005, 3)
all(res.fpc$cluster== res.db$cluster)

fviz_cluster(res.fpc, df, geom = "point")