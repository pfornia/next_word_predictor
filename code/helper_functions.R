cleanText <- function(inputData){
    #Remove punctuation
    inputDataTemp10 <- gsub(" & ", " and ", inputData)
    inputDataTemp20 <- gsub("[,.?!$£&\"”“(){}:;'--*â€œ°Â™¦]", "", inputDataTemp10)
    #Change all to lower case.    
    inputDataTemp30 <- tolower(inputDataTemp20)
    return(inputDataTemp30)
}
