getwd()
setwd("/home/arpan/Documents/Ajax Intel/Sentiment_analysis ")

#-----DOWNLOAD THE STOCKS FILE-----
URL_prod_rev <- 
  "https://raw.githubusercontent.com/datasets/s-and-p-500-companies/master/data/constituents-financials.csv"
SP500 <- read.csv(URL_prod_rev, 
                  header=T, 
                  sep=",",
                  stringsAsFactors=FALSE)

#

SP500_tickers <- paste("$",SP500$Symbol, sep = "")
SP500_tickers <- paste(SP500_tickers,SP500$Name, sep = " ")

consumer_key<- c("x8GzVDZNm376fDEhhgUjeDdLc",	"BaXijPbyZTBtmjKsXVDPwTPCc",
                 "AKJsxNqX2D8uTo9orgjRirvWL",	"Ch6e19OXkGNeUP8QBYUIr5WRH",	"IOhPOwbSc5eBFq5uDVSBHf6Gb",
                 "V4n64KR9jNd2UQtqsm6RlsZ3s",	"FiU2YPcxQbCqV8eENDeqMTmcX",	"NfdqgKlVZGK1WwcIdcaoaK39r")	

consumer_secret <- c("l2vc71gcyo2i213kXyLv4ZBNSjQO9hmburVwkyIrEdFQsg395C",	
                     "qwuO61IXqt7C3HuGs9USpVm5lsMF3HbHxhdViw8cUmCftzTI2i",	"QOKk0ctHhbXNQ5QaipqofrZQzWM92mfkcoP60xe7HJzjSUCz6F",	
                     "OwsNjjFe5kNcZOgwBWYopcpuJEY5I30HnEWxXPs8HPzLzPo8AW", "tfLMqlZ1hfuvqcrbQjWnjYbUlw2fK60ZzXdzB5sxuSM1xJHlkG",	
                     "7f0j0xbkmY9Pu1sA6bjpMCVyj13RiZc5UxSGX5x5VnsunvFL4v",	"MX8LleP8SoCuDWqWVGAT2KtTW1oxye2IqJq55evR716S5mRmuX",	
                     "OLccQscdKuE3F23aj5vE2h3jOBGZN2OCx2oT8vLhMeTunQkdhz")	

access_token<- c("843639734782119937-tdHQ7GTqMEl40Zd5MJgfgweN0uivqY2",	
                 "80344503-5mEqgYjpElSZ9euB0CsrrnIfgiy2AG9O5CtWEzlOE",	"2617540074-5l6gGJhCP8iw9DS7sVD9qsFaUGfWGO9fqlHt5Wg",	
                 "842813040290553856-pdKA5MciQNPc7h68eckie9EXR2cOPGv",	"47391724-Hs2WBnocdSmIEwnl4JLUuPGMkQMmwHT5L2l2dpF3w",	
                 "843506548412440576-YaJW4CfOrwnTSwHteWkwTC94OW7R0cz",	"840746479413272576-s7EBAfxbT0idIhGZs27ONcCNpKqM1Zt",	
                 "526850301-TSWPjJ2A8oHZ5dBRoS5hXyMfeUF5CYhh19ykgJI0")

access_secret <-c("1ZG2StMVZ5XuN0GG7OTQ6ZEPuCCO8wnbxnlAGo5xS58sG",	"s0kTmeiautNWCOfkDPmkJ4gTsUafzoz6iNtIEijWW4mN8",
                  "VVMfNIzgPEUmCk5QyIWr5A4ZSC2Lxy7CERoUtWs4jAe0l",	"D5SrdfyhCLZaKIsRM4ZaJEnVRVqD9OE9NAhkus4at9Tl3",
                  "S1lf38C5Ax9Q1ZHuVrvxDTjak7YNo1va8AoBEF9ZPd63B",	"LepBEZIBMZwllWMRl8TjoTK3KBtJEYud4A76AQ1uIRs4x",	
                  "vFdBepLoljrHItEZ315bT9Lsqy2qYxfrCsdbYoP5PcTcW",	"DCyejp7s8BFCjdP0TM4AkOwYzfvuG4HxAgR4L5AKRM7t7")	

setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}

setupCrawler()
  #cred <- OAuthFactory$new(consumerKey = consumer_key, 
   #                        consumerSecret = consumer_secret,
    #                       requestURL='https://api.twitter.com/oauth/request_token',
     #                      accessURL='https://api.twitter.com/oauth/access_token',
      #                     authURL='https://api.twitter.com/oauth/authorize')

  tweets<- list()
  
  for (i in SP500_tickers[1:3]) {
    tweets[i] <- list(searchTwitter(i,n=3 ,lang = "en", since = '2017-03-22'))
  }
  
  tweets<- unlist(tweets)
  #convert to data frame
  df<- do.call("rbind", lapply(tweets,as.data.frame))
  #retweet<- df[length(which(df$retweetCount>0 | df$favoriteCount >0)),]
  #retweet$text <- sapply(retweet$text, function(row) iconv(row, "latin1","ASCII",sub = ""))
  #retweet$text <- gsub("(f|ht)tp(s?)://(.*)[.][a-z]+","",retweet$text)
  
  raw.sample <- df$text
  
  #  -------Save log file------
  con <- file("test.log")
  sink(con, append=TRUE)
  sink(con, append=TRUE, type="message")
  
  # This will echo all input and not truncate 150+ character lines...
  source("script.R", echo=TRUE, max.deparse.length=10000)
  
  # Restore output to console
  sink() 
  sink(type="message")
  
  # And look at the log...
  cat(readLines("test.log"), sep="\n")
  
  return(df)
  
}



setupCrawler("x8GzVDZNm376fDEhhgUjeDdLc" ,"l2vc71gcyo2i213kXyLv4ZBNSjQO9hmburVwkyIrEdFQsg395C", "843639734782119937-tdHQ7GTqMEl40Zd5MJgfgweN0uivqY2",  "1ZG2StMVZ5XuN0GG7OTQ6ZEPuCCO8wnbxnlAGo5xS58sG")


master_df <- list()
for (i in 6:8) {
  master_df<- setupCrawler(consumer_key[i] ,consumer_secret[i], access_token[i],  access_secret[i] )
console.log(setupCrawler)
}







################################# Jian's Version #########################
URL_prod_rev <- 
  "https://raw.githubusercontent.com/datasets/s-and-p-500-companies/master/data/constituents-financials.csv"
SP500 <- read.csv(URL_prod_rev, 
                  header=T, 
                  sep=",",
                  stringsAsFactors=FALSE)
SP500_tickers <- paste("$",SP500$Symbol, sep = "")
SP500_tickers <- paste(SP500_tickers,SP500$Name, sep = " ")
##################################################### First 63 Stock Tweets ################################

setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}

setupCrawler("x8GzVDZNm376fDEhhgUjeDdLc" ,"l2vc71gcyo2i213kXyLv4ZBNSjQO9hmburVwkyIrEdFQsg395C", "843639734782119937-tdHQ7GTqMEl40Zd5MJgfgweN0uivqY2",  "1ZG2StMVZ5XuN0GG7OTQ6ZEPuCCO8wnbxnlAGo5xS58sG")

tweets<- list()

for (i in SP500_tickers[1:63]) {
  tweets[i] <- list(searchTwitter(i,n=3 ,lang = "en", since = '2017-03-22'))
}

tweets<- unlist(tweets)
#convert to data frame
df_stocks_1to63 <- do.call("rbind", lapply(tweets,as.data.frame))

###################################################### 64 to 126 ###############################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}

setupCrawler("x8GzVDZNm376fDEhhgUjeDdLc" ,"l2vc71gcyo2i213kXyLv4ZBNSjQO9hmburVwkyIrEdFQsg395C", "843639734782119937-tdHQ7GTqMEl40Zd5MJgfgweN0uivqY2",  "1ZG2StMVZ5XuN0GG7OTQ6ZEPuCCO8wnbxnlAGo5xS58sG")

tweets<- list()

for (i in SP500_tickers[1:63]) {
  tweets[i] <- list(searchTwitter(i,n=3 ,lang = "en", since = '2017-03-22'))
}

tweets<- unlist(tweets)
#convert to data frame
df_stocks_1to63 <- do.call("rbind", lapply(tweets,as.data.frame))
