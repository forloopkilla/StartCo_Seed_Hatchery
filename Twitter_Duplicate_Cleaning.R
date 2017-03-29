getwd()
setwd("/home/arpan/Documents/Ajax Intel/Sentiment_analysis/Raw data files")

#---------READ THE FILES-----------
sent_3_20 <- read.csv("sent_3_20.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding="latin1")
sent_3_21 <- read.csv("sent_3_21.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding="latin1")
sent_3_22 <- read.csv("sent_3_22.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding="latin1")
sent_3_23 <- read.csv("sent_3_23.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding="latin1")
sent_3_24 <- read.csv("sent_3_24.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding="latin1")
sent_3_25 <- read.csv("sent_3_25.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding="latin1")
sent_3_26 <- read.csv("sent_3_26.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding="latin1")
sent_3_27 <- read.csv("sent_3_27.csv", header=TRUE, stringsAsFactors=FALSE, fileEncoding="latin1")


cleanText <- function(x) {
  # tolower
  x = tolower(x)
  # remove rt
  #x = gsub("rt", "", x)
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

sent_3_20$clean_text <- cleanText(sent_3_20[,2])
sent_3_21$clean_text <- cleanText(sent_3_21[,2])
sent_3_22$clean_text <- cleanText(sent_3_22[,2])
sent_3_23$clean_text <- cleanText(sent_3_23[,2])
sent_3_24$clean_text <- cleanText(sent_3_24[,2])
sent_3_25$clean_text <- cleanText(sent_3_25[,2])
sent_3_26$clean_text <- cleanText(sent_3_26[,2])
sent_3_27$clean_text <- cleanText(sent_3_27[,2])



#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_20 <- count(sent_3_20, vars = c("Ticker"))
unique_tweets_3_20 <- count(sent_3_20, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_20 <- count(sent_3_20, vars = c("Ticker","clean_text"))


#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_21 <- count(sent_3_21, vars = c("Ticker"))
unique_tweets_3_21 <- count(sent_3_21, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_21 <- count(sent_3_21, vars = c("Ticker","clean_text"))


#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_22 <- count(sent_3_22, vars = c("Ticker"))
unique_tweets_3_22 <- count(sent_3_22, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_22 <- count(sent_3_22, vars = c("Ticker","clean_text"))


#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_23 <- count(sent_3_23, vars = c("Ticker"))
unique_tweets_3_23 <- count(sent_3_23, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_23 <- count(sent_3_23, vars = c("Ticker","clean_text"))


#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_24 <- count(sent_3_24, vars = c("Ticker"))
unique_tweets_3_24 <- count(sent_3_24, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_24 <- count(sent_3_24, vars = c("Ticker","clean_text"))


#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_25 <- count(sent_3_25, vars = c("Ticker"))
unique_tweets_3_25 <- count(sent_3_25, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_25 <- count(sent_3_25, vars = c("Ticker","clean_text"))


#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_26 <- count(sent_3_26, vars = c("Ticker"))
unique_tweets_3_26 <- count(sent_3_26, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_26 <- count(sent_3_26, vars = c("Ticker","clean_text"))


#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
unique_tickers_3_27 <- count(sent_3_27, vars = c("Ticker"))
unique_tweets_3_27 <- count(sent_3_27, vars = c("clean_text"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets_3_27 <- count(sent_3_27, vars = c("Ticker","clean_text"))




