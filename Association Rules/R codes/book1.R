colnames(book)
book$ChildBks <- factor(book$ChildBks,levels = c("1","0"),labels = c("childbks",""))
book$YouthBks <- factor(book$YouthBks,levels = c("1","0"),labels = c("Youthbks","" ))
book$CookBks <- factor(book$CookBks,levels = c("1","0"),labels = c("CookBks",""))
book$DoItYBks <- factor(book$DoItYBks, levels = c("1","0"),labels = c("DOITYBks",""))
book$RefBks <- factor(book$RefBks,levels = c("1","0"),labels = c("RefBks",""))
book$ArtBks <- factor(book$ArtBks,levels = c("1","0"),labels = c("ArtBks",""))
book$GeogBks <- factor(book$GeogBks,levels = c("1","0"),labels = c("GeogBks",""))
book$ItalCook <- factor(book$ItalCook,levels = c("1","0"),labels = c("ItalCook",""))
book$Florence <- factor(book$Florence,levels=c("1","0"),labels = c("Florence",""))
book$ItalArt <- factor(book$ItalArt,levels = c("1","0"),labels = c("ItalArt",""))
book$ItalAtlas <- factor(book$ItalAtlas,levels = c("1","0"),labels = c("ItalAtlas",""))
book1 <- as(book,"transactions")
inspect(book1)
itemFrequencyPlot(book1,topN= 10)
summary(book1)
arules <- apriori(book1,parameter = list(support=0.5,confidence=0.6,minlen=3))
arules #1117 rules
inspect(head(sort(arules,by="lift")))
head(quality(arules))
plot(arules)
windows()
plot(arules,method = "grouped")
plot(arules[1:50],method = "graph")
arules <- apriori(book1,parameter = list(support=0.6,confidence=0.89,minlen=3))
arules #177 rules
inspect(head(sort(arules,by="lift")))
head(quality(arules))
plot(arules)
windows()
plot(arules,method = "grouped")
plot(arules[1:50],method = "graph")
arules <- apriori(book1,parameter = list(support=0.6,confidence=0.89,minlen=1))
arules #93 rules
inspect(head(sort(arules,by="lift")))
head(quality(arules))
plot(arules)
windows()
plot(arules,method = "grouped")
plot(arules[1:50],method = "graph")

