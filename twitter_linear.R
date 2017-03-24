URL_prod_rev <- 
  "https://raw.githubusercontent.com/datasets/s-and-p-500-companies/master/data/constituents-financials.csv"
SP500 <- read.csv(URL_prod_rev, 
                  header=T, 
                  sep=",",
                  stringsAsFactors=FALSE)
SP500_tickers <- paste("$",SP500$Symbol, sep = "")
#SP500_tickers <- paste(SP500_tickers,SP500$Name, sep = " ")
##################################################### First 63 Stock Tweets ################################
Start <- Sys.time()
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
#############################################################################################################
setupCrawler("x8GzVDZNm376fDEhhgUjeDdLc" ,"l2vc71gcyo2i213kXyLv4ZBNSjQO9hmburVwkyIrEdFQsg395C", 
             "843639734782119937-tdHQ7GTqMEl40Zd5MJgfgweN0uivqY2",  "1ZG2StMVZ5XuN0GG7OTQ6ZEPuCCO8wnbxnlAGo5xS58sG")
tweets<- list()
for (i in SP500_tickers[1:63]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
df_stocks_1to63 <- do.call("rbind", lapply(tweets,as.data.frame))
###################################################### 64 to 126 ###############################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("BaXijPbyZTBtmjKsXVDPwTPCc" ,"qwuO61IXqt7C3HuGs9USpVm5lsMF3HbHxhdViw8cUmCftzTI2i", 
             "80344503-5mEqgYjpElSZ9euB0CsrrnIfgiy2AG9O5CtWEzlOE",  "s0kTmeiautNWCOfkDPmkJ4gTsUafzoz6iNtIEijWW4mN8")
tweets<- list()
for (i in SP500_tickers[64:126]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_64to126 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################### 127 to 190 ###############################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("AKJsxNqX2D8uTo9orgjRirvWL" ,"QOKk0ctHhbXNQ5QaipqofrZQzWM92mfkcoP60xe7HJzjSUCz6F", 
             "2617540074-5l6gGJhCP8iw9DS7sVD9qsFaUGfWGO9fqlHt5Wg",  "VVMfNIzgPEUmCk5QyIWr5A4ZSC2Lxy7CERoUtWs4jAe0l")
tweets<- list()
for (i in SP500_tickers[127:190]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_127to190 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################# 191 to 254 #################################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("Ch6e19OXkGNeUP8QBYUIr5WRH" ,"OwsNjjFe5kNcZOgwBWYopcpuJEY5I30HnEWxXPs8HPzLzPo8AW", 
             "842813040290553856-pdKA5MciQNPc7h68eckie9EXR2cOPGv",  "D5SrdfyhCLZaKIsRM4ZaJEnVRVqD9OE9NAhkus4at9Tl3")
tweets<- list()
for (i in SP500_tickers[191:254]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_191to254 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################# 254 to 318 #################################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("IOhPOwbSc5eBFq5uDVSBHf6Gb" ,"tfLMqlZ1hfuvqcrbQjWnjYbUlw2fK60ZzXdzB5sxuSM1xJHlkG", 
             "47391724-Hs2WBnocdSmIEwnl4JLUuPGMkQMmwHT5L2l2dpF3w",  "S1lf38C5Ax9Q1ZHuVrvxDTjak7YNo1va8AoBEF9ZPd63B")
tweets<- list()
for (i in SP500_tickers[255:318]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_255to318 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################# 319 to 382 #################################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("V4n64KR9jNd2UQtqsm6RlsZ3s" ,"7f0j0xbkmY9Pu1sA6bjpMCVyj13RiZc5UxSGX5x5VnsunvFL4v", 
             "843506548412440576-YaJW4CfOrwnTSwHteWkwTC94OW7R0cz",  "LepBEZIBMZwllWMRl8TjoTK3KBtJEYud4A76AQ1uIRs4x")
tweets<- list()
for (i in SP500_tickers[319:382]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_319to382 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################# 383 to 447 #################################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("FiU2YPcxQbCqV8eENDeqMTmcX" ,"MX8LleP8SoCuDWqWVGAT2KtTW1oxye2IqJq55evR716S5mRmuX", 
             "840746479413272576-s7EBAfxbT0idIhGZs27ONcCNpKqM1Zt",  "vFdBepLoljrHItEZ315bT9Lsqy2qYxfrCsdbYoP5PcTcW")
tweets<- list()

for (i in SP500_tickers[383:447]) {
  tweets[i] <- list(searchTwitter(i,n=1500,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_383to447 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################# 448 to 505 #################################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("NfdqgKlVZGK1WwcIdcaoaK39r" ,"OLccQscdKuE3F23aj5vE2h3jOBGZN2OCx2oT8vLhMeTunQkdhz", 
             "526850301-TSWPjJ2A8oHZ5dBRoS5hXyMfeUF5CYhh19ykgJI0",  "DCyejp7s8BFCjdP0TM4AkOwYzfvuG4HxAgR4L5AKRM7t7")
tweets<- list()
for (i in SP500_tickers[448:505]) {
  tweets[i] <- list(searchTwitter(i,n=1500,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_448to505 <- do.call("rbind", lapply(tweets,as.data.frame))
Sys.time()-Start  

MASTER_3_22 <- rbind(df_stocks_1to63,df_stocks_64to126,df_stocks_127to190,df_stocks_191to254,df_stocks_255to318,df_stocks_319to382,df_stocks_383to447,df_stocks_448to505)


################################################
################################################
################################################
################################################

URL_prod_rev <- 
  "https://raw.githubusercontent.com/datasets/s-and-p-500-companies/master/data/constituents-financials.csv"
SP500 <- read.csv(URL_prod_rev, 
                  header=T, 
                  sep=",",
                  stringsAsFactors=FALSE)
SP500_tickers <- paste("$",SP500$Symbol, sep = "")
#SP500_tickers <- paste(SP500_tickers,SP500$Name, sep = " ")
##################################################### First 63 Stock Tweets ################################
Start <- Sys.time()
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
#############################################################################################################
setupCrawler("x8GzVDZNm376fDEhhgUjeDdLc" ,"l2vc71gcyo2i213kXyLv4ZBNSjQO9hmburVwkyIrEdFQsg395C", 
             "843639734782119937-tdHQ7GTqMEl40Zd5MJgfgweN0uivqY2",  "1ZG2StMVZ5XuN0GG7OTQ6ZEPuCCO8wnbxnlAGo5xS58sG")
tweets<- list()
for (i in SP500_tickers[1:63]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
df_stocks_1to63 <- do.call("rbind", lapply(tweets,as.data.frame))
###################################################### 64 to 126 ###############################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("BaXijPbyZTBtmjKsXVDPwTPCc" ,"qwuO61IXqt7C3HuGs9USpVm5lsMF3HbHxhdViw8cUmCftzTI2i", 
             "80344503-5mEqgYjpElSZ9euB0CsrrnIfgiy2AG9O5CtWEzlOE",  "s0kTmeiautNWCOfkDPmkJ4gTsUafzoz6iNtIEijWW4mN8")
tweets<- list()
for (i in SP500_tickers[64:126]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_64to126 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################### 127 to 190 ###############################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("AKJsxNqX2D8uTo9orgjRirvWL" ,"QOKk0ctHhbXNQ5QaipqofrZQzWM92mfkcoP60xe7HJzjSUCz6F", 
             "2617540074-5l6gGJhCP8iw9DS7sVD9qsFaUGfWGO9fqlHt5Wg",  "VVMfNIzgPEUmCk5QyIWr5A4ZSC2Lxy7CERoUtWs4jAe0l")
tweets<- list()
for (i in SP500_tickers[127:190]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_127to190 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################# 191 to 254 #################################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("Ch6e19OXkGNeUP8QBYUIr5WRH" ,"OwsNjjFe5kNcZOgwBWYopcpuJEY5I30HnEWxXPs8HPzLzPo8AW", 
             "842813040290553856-pdKA5MciQNPc7h68eckie9EXR2cOPGv",  "D5SrdfyhCLZaKIsRM4ZaJEnVRVqD9OE9NAhkus4at9Tl3")
tweets<- list()
for (i in SP500_tickers[191:254]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_191to254 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################# 254 to 318 #################################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("IOhPOwbSc5eBFq5uDVSBHf6Gb" ,"tfLMqlZ1hfuvqcrbQjWnjYbUlw2fK60ZzXdzB5sxuSM1xJHlkG", 
             "47391724-Hs2WBnocdSmIEwnl4JLUuPGMkQMmwHT5L2l2dpF3w",  "S1lf38C5Ax9Q1ZHuVrvxDTjak7YNo1va8AoBEF9ZPd63B")
tweets<- list()
for (i in SP500_tickers[255:318]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_255to318 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################# 319 to 382 #################################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("V4n64KR9jNd2UQtqsm6RlsZ3s" ,"7f0j0xbkmY9Pu1sA6bjpMCVyj13RiZc5UxSGX5x5VnsunvFL4v", 
             "843506548412440576-YaJW4CfOrwnTSwHteWkwTC94OW7R0cz",  "LepBEZIBMZwllWMRl8TjoTK3KBtJEYud4A76AQ1uIRs4x")
tweets<- list()
for (i in SP500_tickers[319:382]) {
  tweets[i] <- list(searchTwitter(i,n=1500 ,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_319to382 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################# 383 to 447 #################################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("FiU2YPcxQbCqV8eENDeqMTmcX" ,"MX8LleP8SoCuDWqWVGAT2KtTW1oxye2IqJq55evR716S5mRmuX", 
             "840746479413272576-s7EBAfxbT0idIhGZs27ONcCNpKqM1Zt",  "vFdBepLoljrHItEZ315bT9Lsqy2qYxfrCsdbYoP5PcTcW")
tweets<- list()

for (i in SP500_tickers[383:447]) {
  tweets[i] <- list(searchTwitter(i,n=1500,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_383to447 <- do.call("rbind", lapply(tweets,as.data.frame))
################################################# 448 to 505 #################################################
setupCrawler <- function(consumer_key,consumer_secret,access_token,access_secret) {
  library(ROAuth)
  library(twitteR)
  setup_twitter_oauth(consumer_key ,consumer_secret, access_token,  access_secret )
}
setupCrawler("NfdqgKlVZGK1WwcIdcaoaK39r" ,"OLccQscdKuE3F23aj5vE2h3jOBGZN2OCx2oT8vLhMeTunQkdhz", 
             "526850301-TSWPjJ2A8oHZ5dBRoS5hXyMfeUF5CYhh19ykgJI0",  "DCyejp7s8BFCjdP0TM4AkOwYzfvuG4HxAgR4L5AKRM7t7")
tweets<- list()
for (i in SP500_tickers[448:505]) {
  tweets[i] <- list(searchTwitter(i,n=1500,lang = "en", since = '2017-03-22', until = '2017-03-23'))
}
tweets<- unlist(tweets)
#convert to data frame
df_stocks_448to505 <- do.call("rbind", lapply(tweets,as.data.frame))
Sys.time()-Start  

MASTER_3_21 <- rbind(df_stocks_1to63,df_stocks_64to126,df_stocks_127to190,df_stocks_191to254,df_stocks_255to318,df_stocks_319to382,df_stocks_383to447,df_stocks_448to505)



MASTER_3_22<- add_rownames(MASTER_3_21, "ticker")
MASTER_3_22$ticker<-gsub('[[:digit:]]+', '', MASTER_3_22$ticker)
MASTER_3_22$ticker = gsub("[[:punct:]]", "", MASTER_3_22$ticker)

MASTER_3_21$ticker = tolower(df$ticker)

length(unique(MASTER_3_21$ticker))
