aurl <- "https://www.amazon.in/product-reviews/B07X2KLKRZ/ref=cm_cr_arp_d_paging_btm_next_2?ie=UTF8&showViewpoints=1&pageNumber"
amazon_reviews <- NULL
for(i in 1:30){
  murl <- read_html(as.character(paste(aurl,i,sep = "=")))
  rev<-murl%>% html_nodes(".review-text")%>%html_text()
  amazon_reviews <- c(amazon_reviews,rev)
}
write.table(amazon_reviews,"Redmi note 8 Pro.txt")
getwd()

txt <- amazon_reviews
str(txt)
View(txt)
length(txt)
x <- Corpus(VectorSource(txt))
inspect(x[1])
x<- tm_map(x,function(x) iconv(enc2utf8(x),sub = 'byte'))
x1 <- tm_map(x,tolower)
inspect(x1[1])
x1 <- tm_map(x1,removePunctuation)
inspect(x1[1])
x1 <- tm_map(x1,removeNumbers)
x1 <- tm_map(x1,removeWords,stopwords('english'))
x1 <- tm_map(x1,stripWhitespace)
tdm <- TermDocumentMatrix(x1)
tdm
tdm <- as.matrix(tdm)
tdm [1:20,1:20]
w<- rowSums(tdm)
w
w_sub<-subset(w,w>=20)
w_sub
barplot(w_sub,las=2,col = rainbow(30))
x1 <- tm_map(x1,removeWords,c('phone','redmi','also'))
x1 <- tm_map(x1,stripWhitespace)
tdm <- TermDocumentMatrix(x1)
tdm
tdm <- as.matrix(tdm)
tdm [1:20,1:20]
w<- rowSums(tdm)
w
w_sub<-subset(w,w>=20)
w_sub
barplot(w_sub,las=2,col = rainbow(30))
wordcloud(words = names(w_sub),freq = w_sub)
w_sub1 <- sort(rowSums(tdm),decreasing = T)
head(w_sub1)
wordcloud(words = names(w_sub1),freq = w_sub1)
wordcloud(words = names(w_sub1),freq = w_sub1,random.order = F,colors = rainbow(30),scale = c(2,0.4),rot.per = 0.4)
windows()
wordcloud(words = names(w_sub1),freq = w_sub1,random.order = F,colors = rainbow(30),scale = c(4,0.9),rot.per = 0.9)
