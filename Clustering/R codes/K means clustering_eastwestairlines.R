mydata <- EastWestAirlines
normalized_data <- scale(mydata[,2:12])
fit <- kmeans(normalized_data, 4) # 4 cluster solution
str(fit)
final2<- data.frame(mydata, fit$cluster) # append cluster membership
final2
#final4 <- cbind(mydata, fit$cluster)
final3 <- final2[,c(ncol(final2),1:(ncol(final2)-1))]
aggregate(mydata[,2:12], by=list(fit$cluster), FUN=mean)

#elbow curve & k ~ sqrt(n/2) to decide the k value

wss = (nrow(normalized_data)-1)*sum(apply(normalized_data, 2, var))		 # Determine number of clusters by scree-plot 
for (i in 1:13) wss[i] = sum(kmeans(normalized_data, centers=i)$withinss)
plot(1:13, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")   # Look for an "elbow" in the scree plot #
title(sub = "K-Means Clustering Scree-Plot")
#
#preferrable k value is 11  
