getwd()
#setwd("/home/arpan/Documents/Ajax Intel/Sentiment_analysis/Raw data files")

#---------READ THE FILES-----------
sent_3_20 <- read.csv("sent_3_20.csv")
sent_3_21 <- read.csv("sent_3_21.csv")
sent_3_22 <- read.csv("sent_3_22.csv")
sent_3_23 <- read.csv("sent_3_23.csv")
sent_3_24 <- read.csv("sent_3_24.csv")
sent_3_25 <- read.csv("sent_3_25.csv")
sent_3_26 <- read.csv("sent_3_26.csv")
sent_3_27 <- read.csv("sent_3_27.csv")

cleanText <- function(x) {
  # tolower
  x = tolower(x)
  # remove rt
  x = gsub("rt", "", x)
  # remove at
  x = gsub("@\\w+", "", x)
  # remove punctuation
  x = gsub("[[:punct:]]", "", x)
  # remove control characters
  x <-  gsub('[[:cntrl:]]', '', x)
  # remove numbers
  x = gsub("[[:digit:]]", "", x)
  # remove links http
  x = gsub("http\\w+",  "", x)
  # remove tabs
  x = gsub("[ |\t]{2,}", " ", x)
  # remove new lines
  x = gsub("[ |\n]{1,}", " ", x)
  # remove blank spaces at the beginning
  x = gsub("^ ", "", x)
  # remove blank spaces at the end
  x = gsub(" $", "", x)
  return(x)
}




#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_20 <- count(sent_3_20, vars = c("Ticker"))
unique_tweets_3_20 <- count(sent_3_20, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_20 <- count(sent_3_20, vars = c("Ticker","clean_text"))
count_tweets_3_20 <- aggregate(clean_text ~ Ticker, sent_3_20, length)

#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_21 <- count(sent_3_21, vars = c("Ticker"))
unique_tweets_3_21 <- count(sent_3_21, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_21 <- count(sent_3_21, vars = c("Ticker","clean_text"))
count_tweets_3_21 <- aggregate(clean_text ~ Ticker, sent_3_21, length)

#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_22 <- count(sent_3_22, vars = c("Ticker"))
unique_tweets_3_22 <- count(sent_3_22, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_22 <- count(sent_3_22, vars = c("Ticker","clean_text"))
count_tweets_3_22 <- aggregate(clean_text ~ Ticker, sent_3_22, length)

#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_23 <- count(sent_3_23, vars = c("Ticker"))
unique_tweets_3_23 <- count(sent_3_23, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_23 <- count(sent_3_23, vars = c("Ticker","clean_text"))
count_tweets_3_23 <- aggregate(clean_text ~ Ticker, sent_3_23, length)

#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_24 <- count(sent_3_24, vars = c("Ticker"))
unique_tweets_3_24 <- count(sent_3_24, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_24 <- count(sent_3_24, vars = c("Ticker","clean_text"))
count_tweets_3_24 <- aggregate(clean_text ~ Ticker, sent_3_24, length)

#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_25 <- count(sent_3_25, vars = c("Ticker"))
unique_tweets_3_25 <- count(sent_3_25, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_25 <- count(sent_3_25, vars = c("Ticker","clean_text"))
count_tweets_3_25 <- aggregate(clean_text ~ Ticker, sent_3_25, length)

#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_26 <- count(sent_3_26, vars = c("Ticker"))
unique_tweets_3_26 <- count(sent_3_26, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_26 <- count(sent_3_26, vars = c("Ticker","clean_text"))
count_tweets_3_26 <- aggregate(clean_text ~ Ticker, sent_3_26, length)

#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_27 <- count(sent_3_27, vars = c("Ticker"))
unique_tweets_3_27 <- count(sent_3_27, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_27 <- count(sent_3_27, vars = c("Ticker","clean_text"))
count_tweets_3_27 <- aggregate(clean_text ~ Ticker, sent_3_27, length)


############ Begin merging preparation ###############################################
MASTER.SENT <- rbind(sent_3_20,sent_3_21,sent_3_22,sent_3_23,sent_3_24,sent_3_25,sent_3_26,sent_3_27)
MASTER.SENT$clean_text <- cleanText(MASTER.SENT$text)
MASTER.SENT$date <- date(MASTER.SENT$created)
colnames(MASTER.SENT)
daily.tweet.count.with.dup <- aggregate(clean_text ~ Ticker+date, MASTER.SENT, length)

keep.names<- c("Ticker","favorited","favoriteCount","isRetweet","retweeted","retweetCount","clean_text","date")
MASTER.SENT <- MASTER.SENT[keep.names]
Fav_Retweeted <-  MASTER.SENT[which(MASTER.SENT$favoriteCount != 0 | MASTER.SENT$retweetCount !=0),]
No_favs_retweets <- MASTER.SENT[-which(MASTER.SENT$favoriteCount != 0 | MASTER.SENT$retweetCount !=0),]

#SENTIMENT<- if (MASTER.SENT$favoriteCount ==0 & MASTER.SENT$retweetCount==0) MASTER.SENT[!duplicated(MASTER.SENT$clean_text),]
SENTIMENT<- rbind(Fav_Retweeted,No_favs_retweets)
SENTIMENT2<- SENTIMENT[!duplicated(SENTIMENT),]

huliu.positive <- scan("E:/Predictive Modeling/positive-words.txt", what='character', comment.char=';')
huliu.negative <- scan("E:/Predictive Modeling/negative-words.txt", what='character', comment.char=';')
huliu.negative <- c(huliu.negative,'wtf','wait','waiting','epicfail', 'crash', 'bug', 'bugy', 'bugs', 'slow', 'lie')
SENTIMENT2<- read.csv("SENTIMENT2.csv")
daily.tweet.count.with.dup<- read.csv("daily_tweet_count.csv")

SENTIMENT2$clean_text <- gsub(SENTIMENT2$Ticker, "", SENTIMENT2$clean_text)
#write.csv(SENTIMENT2,file="SENTIMENT2.csv",row.names = F)
#write.csv(daily.tweet.count.with.dup,file="daily_tweet_count.csv",row.names = F)

raw.sample <- SENTIMENT2$clean_text

raw.sample1 <- raw.sample[1:10000]
raw.sample2 <- raw.sample[10001:20000]
raw.sample3 <- raw.sample[20001:30000]
raw.sample4 <- raw.sample[30001:40000]
raw.sample5 <- raw.sample[40001:50000]
raw.sample6 <- raw.sample[50001:60000]
raw.sample7 <- raw.sample[60001:70000]
raw.sample8 <- raw.sample[70001:80000]
raw.sample9 <- raw.sample[80001:90000]
raw.sample10 <- raw.sample[90001:100000]
raw.sample11 <- raw.sample[100001:110000]
raw.sample12 <- raw.sample[110001:length(raw.sample)]


result12 <- score.sentiment(raw.sample12, huliu.positive, huliu.negative)
library(reshape)
#create a copy of the result
test1 = result12[[1]] #score
test2 = result12[[2]] #postive scores
test3 = result12[[3]] #negative scores

test1$text <- NULL
test2$text <- NULL
test3$text <- NULL

q1 <- test1[1,]
q2 <- test2[1,]
q3 <- test3[1,]

qq1 <- melt(q1, , var= 'Score')
qq2 <- melt(q2, , var= 'Positive')
qq3 <- melt(q3, , var= 'Negative')

qq1['Score'] = NULL
qq2['Positive'] = NULL
qq3['Negative'] = NULL

table1 <- data.frame(Text=result12[[1]]$text, Score=qq1)
table2 <- data.frame(Text=result12[[2]]$text, Score=qq2)
table3 <- data.frame(Text=result12[[3]]$text, Score=qq3)

#Merge the tables
table_final12 <- data.frame(Text = table1$Text, Score= table1$value, Positive = table2$value, Negative = table3$value)
#DISAG.Var = abs(1-abs((table_final$Positive-table_final$Negative)/(table_final$Positive+table_final$Negative)))
RESULTS.table <- rbind(table_final1,table_final2,table_final3,table_final4,table_final5,table_final6,table_final7,table_final8,table_final9,table_final10,table_final11,table_final12)

Sentiment_merge<- cbind(SENTIMENT2,RESULTS.table)
write.csv(Sentiment_merge,file="Sentiment_Agg.csv",row.names = F)

agg<-aggregate(cbind(favoriteCount, retweetCount,Score,Positive,Negative)~Ticker+date, data=Sentiment_merge, sum, na.rm=TRUE)
require(reshape2)
df_melt <- melt(df1, id = c("date", "year", "month"))
dcast(df_melt, year + month ~ variable, sum)
colnames(Sentiment_merge)
colnames(daily.tweet.count.with.dup)[3]<- "Tweet_Total_Count"
SENTIMENT3<- merge(agg,daily.tweet.count.with.dup,by= c("date","Ticker"))
STOCKS<- read.csv("STOCKS_prices.csv")
STOCKS$X<- NULL
STOCKS$Ticker<-NULL
colnames(STOCKS)[1]<- "Ticker"
################### MERGE DATA ############
MERGED.DATA <- merge(STOCKS, SENTIMENT3,by=c("Ticker","date"), all.y = T)
MERGED.DATA<- MERGED.DATA[complete.cases(MERGED.DATA),]
write.csv(MERGED.DATA,file="MERGED.DATA.csv",row.names = F)
