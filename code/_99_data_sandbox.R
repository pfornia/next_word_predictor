rawDataFolder <- "../data/final/en_US/"

blogsDataRaw <- readLines(paste0(rawDataFolder, "en_US.blogs.txt"))
newsDataRaw <- readLines(paste0(rawDataFolder, "en_US.news.txt"))
twitterDataRaw <- readLines(paste0(rawDataFolder, "en_US.twitter.txt"))

##news was not being read correctly. Searched for "At the Spice Merchant, a 2",
##  found an arrow character, and removed all such characters from the document.

##quiz 1:

blogLineNchar <- nchar(blogsDataRaw)
newsLineNchar <- nchar(newsDataRaw)
twitterLineNchar <- nchar(twitterDataRaw) 

##count lines containing a word (proxy for # of occurrences)
twitterLove <- sum(as.numeric(grepl("love", twitterDataRaw)))
twitterHate <- sum(as.numeric(grepl("hate", twitterDataRaw)))

##find "biostats"
twitterBiostats <- twitterDataRaw[grep("biostats", twitterDataRaw)]

##find kickboxing
twitterKickboxing <- twitterDataRaw[grep("A computer once beat me at chess, but it was no match for me at kickboxing", twitterDataRaw)]

##find "data science"
twitterDatascience <- twitterDataRaw[grep("data science", twitterDataRaw)]

searchInternet<- function(phrase = "hello world", sourceType = "all"){
    sourceType <- tolower(sourceType)
    if(sourceType == "all"){
        sourceData <- c(blogsDataRaw, newsDataRaw, twitterDataRaw)
    } else if(sourceType == "blog"){
        sourceData <- blogsDataRaw
    } else if(sourceType == "news"){
        sourceData <- newsDataRaw
    } else if(sourceType == "twitter"){
        sourceData <- twitterDataRaw
    } else {
        stop("Invalid soure data type. Pick 'Blog', 'News', or 'Twitter'")
    }
    return(sourceData[grep(phrase, sourceData)])
}

## tutorial source for tm library: 
##  https://deltadna.com/blog/text-mining-in-r-for-term-frequency/

library(tm)

## source: https://en.wikipedia.org/wiki/Seven_dirty_words   
##  ...plus a little creativity.

getTop40 <- function(testTMData, numberOut = 40){
    allText <- paste(testTMData, collapse = " ")
    allTextVector <- VectorSource(allText)
    allTextCorpus <- Corpus(allTextVector)
    
    allTextCorpus1 <- tm_map(allTextCorpus, content_transformer(tolower))
    allTextCorpus2 <- tm_map(allTextCorpus1, removePunctuation)
    ## removing special characters still needs some work!
    allTextCorpus3 <- tm_map(allTextCorpus2, removeWords, c("â€œ", "â€™", "â€“", "itâ€™s"))
    allTextCorpus4 <- tm_map(allTextCorpus3, removeWords, stopwords("english"))
    
    profanityList <- c("asshole", "assholes", "bitch", "bitches", "bitching", "cocksucker", "cocksuckers", "cunt", "cunts", "faggot", "faggots", "fuck", "fuckers", "fucking", "fucks", "goddamn", "goddamned", "goddamnit", "jackass", "jackasses", "motherfucker", "motherfuckers", "niger", "nigers", "piss", "pissing", "shit", "shithole", "shits")
    
    allTextCorpus5 <- tm_map(allTextCorpus4, removeWords, profanityList)
    
    
    dtm <- DocumentTermMatrix(allTextCorpus5)
    dtm2 <- as.matrix(dtm)
    dim(dtm2)
    
    frequency <- sort(colSums(dtm2), decreasing = TRUE)
    largeFreq <- frequency[1:numberOut]
    return(largeFreq)
}

top40blogs <- getTop40(sample(blogsDataRaw, 1000), numberOut = 100)
top40news <- getTop40(sample(newsDataRaw, 1000), numberOut = 100)
top40twitter <- getTop40(sample(twitterDataRaw, 1000), numberOut = 100)

library(wordcloud)
set.seed(1)
wordcloud(names(top40blogs), top40blogs, colors = 1:100, random.color = TRUE)
wordcloud(names(top40news), top40blogs, colors = 1:100, random.color = TRUE)
wordcloud(names(top40twitter), top40blogs, colors = 1:100, random.color = TRUE)

publish(title = 'Data Science Capstone: Milestone', 'milestone_presentation.html', host = 'rpubs')



##Attempt to codify common words into numbers...


a <- sourceData
b <- strsplit(a, " ")
d <- unlist(b)
nWords <- length(d)
## 330K total tokens
## top 100 tokens seems to give about half; 
##  top 1000 about 72.5% of words; 
#   top 5000 about 87.2%
freqWords <- summary(as.factor(d), maxsum = 5000)
testSize <- as.factor(d)
nTokens <- length(freqWords)

#shiny
library(shiny)

runApp(display.mode = "showcase")
runApp()

deployApp()

#slidify
install.packages("RCurl")
install.packages("devtools")
install.packages("Rtools")
install.packages("stringi")
devtools::install_github('rstudio/shinyapps')


library(stringr)
library(devtools)
library(RCurl)
library(Rtools)
library(shinyapps)
library(stringr)


library(devtools)
#install_github('slidify', 'ramnathv')
devtools::install_github('ramnathv/slidify', ref = github_pull(425))
install_github('slidifyLibraries', 'ramnathv')


library(slidify)

slidify('index.Rmd')
browseURL("index.html")

publish(title = 'Data Science Capstone: Predict Next Word', 'index.html', host = 'rpubs')

