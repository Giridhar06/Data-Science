wine_1 <- wine[-1]
attach(wine_1)
cor(wine_1)
summary(wine_1)
pcaobj <-princomp(wine_1,cor = TRUE,scores = TRUE,covmat = NULL) 
summary(pcaobj)
str(pcaobj)
loadings(pcaobj)
plot(pcaobj)
biplot(pcaobj)
pcaobj$scores[,1:3]
wine <- cbind(wine,pcaobj$scores[,1:3])

#h-clustering

clus_data <- wine[,15:17]
norm_clus <- scale(clus_data)
dist_1 <- dist(norm_clus,method = "euclidean")
fit_1 <- hclust(dist_1,method = "complete")
plot(fit_1)
plot(fit_1,hang = -1)
rect.hclust(fit_1,k=4,border = "green")
groups <- cutree(fit_1,4)
membership_1 <- as.matrix(groups)
final_data <- cbind(membership_1,wine)
View(aggregate(final_data[,-c(2,16:18)], by= list(membership_1), FUN = mean))

#k-means

fit <- kmeans(norm_clus,4)
str(fit)
final2 <- data.frame(wine,fit$cluster)
final3 <- final2[,c(1:14,18)]
View(aggregate(wine[,2:17],by=list(fit$cluster),FUN=mean))
wss = (norm_clus)*sum(apply(norm_clus, 2, var))		 # Determine number of clusters by scree-plot 
for (i in 1:3) wss[i] = sum(kmeans(norm_clus, centers=i)$withinss)
plot(1:534, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares") # preferrable k =15

