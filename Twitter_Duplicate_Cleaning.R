getwd()
setwd("/home/arpan/Documents/Ajax Intel/Sentiment_analysis/Raw data files")

#---------READ THE FILES-----------
sent_3_15 <- read.csv("sent_3_15.csv")
sent_3_16 <- read.csv("sent_3_16.csv")
sent_3_17 <- read.csv("sent_3_17.csv")
sent_3_20 <- read.csv("sent_3_20.csv")
sent_3_21 <- read.csv("sent_3_21.csv")
sent_3_22 <- read.csv("sent_3_22.csv")
sent_3_23 <- read.csv("sent_3_23.csv")
sent_3_24 <- read.csv("sent_3_24.csv")

sample <- head(sent_3_22, 500)
duplicated(sample$text)

#------NUMBER/FREQUENCY OF TWEETS BY EACH TICKER-------
library(plyr)
count_tickers <- count(sent_3_22, vars = c("ticker"))

#------FREQUENCY OF TWEETS BY EACH TICKER AND TWEETS WITHOUT REMOVING THE DUPLICATES------
count_tweets <- count(sent_3_22, vars = c("ticker","text"))

#------REMOVING ALL THE DUPLICATE TWEETS FOR SENTIMENT ANALYSIS------
sent_3_22_unique <- as.data.frame(unique(sent_3_22$text))


