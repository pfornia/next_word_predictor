##IDEAS #1:
# find N most common words (N = 1000? 10,000?)
# convert these to 1-N integers and all others to 0.
#  (maybe split 0s into part of speech??)
#  reperform analysis as is.

source("helper_functions.R")

rawDataFolder <- "../data/final/en_US/"

#Read the data files
print("Reading blog data...")
blogsDataRaw <- readLines(paste0(rawDataFolder, "en_US.blogs.txt"))

print("Reading news data...")
newsDataRaw <- readLines(paste0(rawDataFolder, "en_US.news.txt"))

print("Reading twitter data...")
twitterDataRaw <- readLines(paste0(rawDataFolder, "en_US.twitter.txt"))

#Combine three data sets
print("Pre-processing data...")
#let's leave out twitter for now...
sourceDataRaw <- c(blogsDataRaw, newsDataRaw)
#WARNING: TO DO: split multi-sentence lines into multiple lines

#grab the first 100K
# eventually, we'll want to use entire data
set.seed(1)
sourceData <- cleanText(sample(sourceDataRaw, 200000))
saveRDS(sourceData, "../data/sourceData.rds")
a <- readRDS("../data/sourceData.rds")


