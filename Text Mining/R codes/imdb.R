## data extraction 
aurl<-"https://www.imdb.com/title/tt0111161/reviews?ref_=tt_urv"
lego <- NULL
for (i in 1:10){
  murl <- read_html(as.character(paste(aurl,i,sep="")))
  rev <- murl %>%
    html_nodes(".show-more__control") %>%
    html_text()%>%                       
    gsub("^\\s+|\\s+$", "", .)
  lego <- c(lego,rev)
}
write.table(lego,"legom1.txt",row.names = F)
txt <- lego
## data cleaning
x<-read.table("legom1.txt",header = TRUE)
corpus<-Corpus(VectorSource(x$x))
corpus<-tm_map(corpus,removeNumbers)
corpus<-tm_map(corpus,removePunctuation)
corpus<-tm_map(corpus,removeWords,stopwords('english'))
corpus<-tm_map(corpus,stemDocument)
corpus<-tm_map(corpus,stripWhitespace)
removeURL <- function(x) gsub('http[[:alnum:]]*','',x)
corpus <- tm_map(corpus, content_transformer(removeURL))
corpus<- tm_map(corpus,function(corpus) iconv(enc2utf8(corpus),sub = 'byte'))
tdm <- TermDocumentMatrix(corpus)
tdm


tdm <- as.matrix(tdm)
tdm[1:10,1:20]


w <- rowSums(tdm)  # provides the no of times a particular word has been used.
w <- subset(w, w>= 20) # Pull words that were used more than 25 times.
barplot(w, las = 2, col = rainbow(50))

w <- sort(rowSums(tdm), decreasing = TRUE) # Sort words in decreasing order.

w <- data.frame(names(w),w)
colnames(w) <- c('word','freq')
wordcloud(words = w,freq= w)
wordcloud2(w,size = 0.5, shape = 'triangle', rotateRatio = 0.5, 
           minSize = 1)

get_sentiments("bing")

##postive negative word cloud
w %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("gray20", "gray80"),
                   max.words = 1000)




## sentiment analysis


reviews <- as.character(x[-1,])
class(x)
s <- get_nrc_sentiment(reviews)
head(s)
barplot(colSums(s), las = 2.5, col = rainbow(10),
        ylab = 'Count',main= 'sentiment analysis of lego')