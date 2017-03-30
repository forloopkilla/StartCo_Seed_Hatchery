# StartCo_Seed_Hatchery
The Guardian API Wrapper
#Provides an interface to the Open Platform's Content API of the Guardian Media Group. 
#It retrieves content from news outlets The Observer, The Guardian, and guardian.co.uk from 1999 to current day.

install.packages("GuardianR")
install.packages("RCurl")
install.packages("RJSONIO")
install.packages("JSON")


library(RCurl)
library(RJSONIO)
library(GuardianR)
------------------------------

  URL_prod_rev <- 
  "https://raw.githubusercontent.com/datasets/s-and-p-500-companies/master/data/constituents-financials.csv"
SP500 <- read.csv(URL_prod_rev, 
                  header=T, 
                  sep=",",
                  stringsAsFactors=FALSE)

SP500_tickers <- paste("$",SP500$Symbol, sep = "")





guards<- list()
for (i in SP500_tickers[1:505]) {
  guards[i] <- list(get_guardian(i,
                                    section=,
                                    from.date="2017-03-26",
                                    to.date="2017-03-26",
                                    api.key="6af9ef66-02db-4dd8-8808-1b5ad2fbc9dc"))

}


Guards_DF<-do.call("rbind",lapply(guards,as.data.frame))
```
-----------------------------------------------------------------
#Stock Namesjj


SP500_names <- read.csv("Names.csv", 
                  header=T, 
                  sep=",",
                  stringsAsFactors=FALSE)

SP500_names <- paste(SP500_names$Names, sep = "")
SP500_names<-gsub("[[:punct:]]", " ", SP500_names)
SP500_names<-str_trim(SP500_names)
SP500_names<-gsub(" ","+",SP500_names)



guards2<- list()
for (i in SP500_names[1:505]) {
  guards2[i] <- list(get_guardian(i,
                                 section=,
                                 from.date="2017-03-26",
                                 to.date="2017-03-26",
                                 api.key="6af9ef66-02db-4dd8-8808-1b5ad2fbc9dc"))
  
}
Guards_DF2<-do.call("rbind",lapply(guards2,as.data.frame))
-------------------------------------------------------------------
#Stock Tickers minus the $
URL_prod_rev <- 
  "https://raw.githubusercontent.com/datasets/s-and-p-500-companies/master/data/constituents-financials.csv"
SP500noDS <- read.csv(URL_prod_rev, 
                  header=T, 
                  sep=",",
                  stringsAsFactors=FALSE)

SP500noDS <- paste(SP500noDS, sep = "")





guards3<- list()
for (i in SP500noDS[1:505]) {
  guards3[i] <- list(get_guardian(i,
                                 section=,
                                 from.date="2017-03-26",
                                 to.date="2017-03-26",
                                 api.key="6af9ef66-02db-4dd8-8808-1b5ad2fbc9dc"))
  
}


Guards_DF3<-do.call("rbind",lapply(guards,as.data.frame))

----------------------------------------------------------
#Final merge

Guards_DF_Final<-rbind.data.frame(Guards_DF,Guards_DF2,Guards_DF3)
----------
 
