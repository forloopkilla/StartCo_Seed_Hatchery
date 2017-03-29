library(jsonlite)
########################################################################################################
#######----------PULL ALL THE HEADLINES AND DESCRIPTION FROM TOP BUSINESS NEWS SITES------------########
########################################################################################################

#------TOP BLOOMBERG API-----
top_bloomberg=fromJSON("https://newsapi.org/v1/articles?source=bloomberg&sortBy=top&apiKey=d912c47ecc6047d59add09e52f1cb609")
top_bloomberg <- do.call("rbind.fill", lapply(top_bloomberg, as.data.frame))
top_bloomberg <- top_bloomberg[4:13,2:7]

#------TOP GOOGLE NEWS API-----
top_googlenews=fromJSON("https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=d912c47ecc6047d59add09e52f1cb609")
top_googlenews <- do.call("rbind.fill", lapply(top_googlenews, as.data.frame))
top_googlenews <- top_googlenews[4:13,2:7]

#------TOP BUSINESS INSIDER API-----
top_businessinsider=fromJSON("https://newsapi.org/v1/articles?source=business-insider&sortBy=top&apiKey=d912c47ecc6047d59add09e52f1cb609")
top_businessinsider <- do.call("rbind.fill", lapply(top_businessinsider, as.data.frame))
top_businessinsider <- top_businessinsider[4:13,2:7]

#------LATEST BUSINESS INSIDER API-----
latest_businessinsider=fromJSON("https://newsapi.org/v1/articles?source=business-insider&sortBy=latest&apiKey=d912c47ecc6047d59add09e52f1cb609")
latest_businessinsider <- do.call("rbind.fill", lapply(latest_businessinsider, as.data.frame))
latest_businessinsider <- latest_businessinsider[4:13,2:7]

#------TOP CNBC API-----
top_cnbc=fromJSON("https://newsapi.org/v1/articles?source=cnbc&sortBy=top&apiKey=d912c47ecc6047d59add09e52f1cb609")
top_cnbc <- do.call("rbind.fill", lapply(top_cnbc, as.data.frame))
top_cnbc <- top_cnbc[4:13,2:7]

#------TOP FINANCIAL TIMES API-----
top_financialtimes=fromJSON("https://newsapi.org/v1/articles?source=financial-times&sortBy=top&apiKey=d912c47ecc6047d59add09e52f1cb609")
top_financialtimes <- do.call("rbind.fill", lapply(top_financialtimes, as.data.frame))
top_financialtimes <- top_financialtimes[4:13,2:7]

#------LATEST FINANCIAL TIMES API-----
latest_financialtimes=fromJSON("https://newsapi.org/v1/articles?source=financial-times&sortBy=latest&apiKey=d912c47ecc6047d59add09e52f1cb609")
latest_financialtimes <- do.call("rbind.fill", lapply(latest_financialtimes, as.data.frame))
latest_financialtimes <- latest_financialtimes[4:13,2:7]

#------TOP FORTUNE API-----
top_fortune=fromJSON("https://newsapi.org/v1/articles?source=fortune&sortBy=top&apiKey=d912c47ecc6047d59add09e52f1cb609")
top_fortune <- do.call("rbind.fill", lapply(top_fortune, as.data.frame))
top_fortune <- top_fortune[4:13,2:7]

#------LATEST FORTUNE API-----
latest_fortune=fromJSON("https://newsapi.org/v1/articles?source=fortune&sortBy=latest&apiKey=d912c47ecc6047d59add09e52f1cb609")
latest_fortune <- do.call("rbind.fill", lapply(latest_fortune, as.data.frame))
latest_fortune <- latest_fortune[4:13,2:7]

#------TOP economist API-----
top_economist=fromJSON("https://newsapi.org/v1/articles?source=the-economist&sortBy=top&apiKey=d912c47ecc6047d59add09e52f1cb609")
top_economist <- do.call("rbind.fill", lapply(top_economist, as.data.frame))
top_economist <- top_economist[4:13,2:7]

#------LATEST economist API-----
latest_economist=fromJSON("https://newsapi.org/v1/articles?source=the-economist&sortBy=top&apiKey=d912c47ecc6047d59add09e52f1cb609")
latest_economist <- do.call("rbind.fill", lapply(latest_economist, as.data.frame))
latest_economist <- latest_economist[4:13,2:7]

#------TOP WALL STREET JOURNAL API-----
top_wsj=fromJSON("https://newsapi.org/v1/articles?source=the-wall-street-journal&sortBy=top&apiKey=d912c47ecc6047d59add09e52f1cb609")
top_wsj <- do.call("rbind.fill", lapply(top_wsj, as.data.frame))
top_wsj <- top_wsj[4:13,2:7]

#-------CLEAN THE TITLE and DESCRIPTION------
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


top_bloomberg$clean_title <- cleanText(top_bloomberg[,2])
top_bloomberg$clean_description <- cleanText(top_bloomberg[,3])

top_googlenews$clean_title <- cleanText(top_googlenews[,2])
top_googlenews$clean_description <- cleanText(top_googlenews[,3])

top_businessinsider$clean_title <- cleanText(top_businessinsider[,2])
top_businessinsider$clean_description <- cleanText(top_businessinsider[,3])

latest_businessinsider$clean_title <- cleanText(latest_businessinsider[,2])
latest_businessinsider$clean_description <- cleanText(latest_businessinsider[,3])

top_cnbc$clean_title <- cleanText(top_cnbc[,2])
top_cnbc$clean_description <- cleanText(top_cnbc[,3])

top_financialtimes$clean_title <- cleanText(top_financialtimes[,2])
top_financialtimes$clean_description <- cleanText(top_financialtimes[,3])

latest_financialtimes$clean_title <- cleanText(latest_financialtimes[,2])
latest_financialtimes$clean_description <- cleanText(latest_financialtimes[,3])

top_fortune$clean_title <- cleanText(top_fortune[,2])
top_fortune$clean_description <- cleanText(top_fortune[,3])

latest_fortune$clean_title <- cleanText(latest_fortune[,2])
latest_fortune$clean_description <- cleanText(latest_fortune[,3])

top_economist$clean_title <- cleanText(top_economist[,2])
top_economist$clean_description <- cleanText(top_economist[,3])

latest_economist$clean_title <- cleanText(latest_economist[,2])
latest_economist$clean_description <- cleanText(latest_economist[,3])

top_wsj$clean_title <- cleanText(top_wsj[,2])
top_wsj$clean_description <- cleanText(top_wsj[,3])
