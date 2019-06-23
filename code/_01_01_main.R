##Open saved R dataset created in _01_00_data_process.R 
sourceData <- readRDS("../data/sourceData.rds")

source("helper_functions.R")

## list frequency of 
## WARNING!! figure out when phrase lands in middle of next word.
##  example: source: "...doesn't mean they're nicer..."
##      phrase: "mean the"
##      result: "nicer"
##      grep shouldn't find this phrase here...
freqNextWord <- function(phrase = "hello world"){
    phrase <- cleanText(phrase)
    linesWithPhrase <- sourceData[grep(phrase, sourceData)]
    linesSplitPhrase <- strsplit(linesWithPhrase, phrase)
    wordAfterPhrase <- rep(NA, length(linesSplitPhrase))
    if(length(wordAfterPhrase) == 0) return(wordAfterPhrase)
    for(i in 1:length(linesSplitPhrase)){
        wordAfterPhrase[i] <- strsplit(linesSplitPhrase[[i]][2], " ")[[1]][2]
    }
    wordAfterPhrase <- cleanText(wordAfterPhrase)
    resultsSorted <- sort(summary(as.factor(wordAfterPhrase)), decreasing = TRUE)
    results <- resultsSorted[(names(resultsSorted) %in% c("(Other)", "NA's")) == FALSE]
    return(results[1:10])
}

predictNextWord <- function(phrase = "hello world"){
    phrase <- cleanText(phrase)
    #if freq of a given next word is > 10, use it.
    #  otherwise, try again with smalller n-gram.
    cutoff <- 4
    #get 1-, 2-, 3-, and 4-grams of end of phrase
    nWords <- length(strsplit(phrase, " ")[[1]])
    lastNGram <- list(
        #paste(strsplit(phrase, " ")[[1]][max(1, nWords - 3): nWords], collapse = " "),
        paste(strsplit(phrase, " ")[[1]][max(1, nWords - 2): nWords], collapse = " "),
        paste(strsplit(phrase, " ")[[1]][max(1, nWords - 1): nWords], collapse = " "),
        paste(strsplit(phrase, " ")[[1]][max(1, nWords): nWords], collapse = " ")
        )
    for(i in 1:length(lastNGram)){
        nextWord <- freqNextWord(lastNGram[[i]])[1]
        if(nextWord >= cutoff) return(names(nextWord[1]))
    }
    return("?????")
}
