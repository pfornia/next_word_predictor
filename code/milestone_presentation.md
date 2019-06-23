---
title       : Capstone Milestone Presentation
subtitle    : Data Science Specialization Capstone | Summer 2015 
author      : Paul Fornia
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
    
## Input Data
    
Input tables provide data from three different types of internet text sources:    

1. Blogs
2. News
3. Twitter

--- .class #id 

## Length of Lines

Length of lines (in number of characters) varies by source type.

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 

--- .class #id 

## Most used "non-trivial" words

Using the "tm" package, I:

1. Filter out very common "stopwords"

2. Change all data to lower case

3. Remove most punctuation (some work still needed)

4. Remove profanity

5. Produce Wordclouds of Top 100 common words by source type




--- .class #id 

## Top 100 words in Blogs

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 

--- .class #id 

## Top 100 words in the News
![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4-1.png) 

--- .class #id 

## Top 100 words on Twitter

![plot of chunk unnamed-chunk-5](assets/fig/unnamed-chunk-5-1.png) 

--- .class #id 

## Next Steps, Simple
Create simplest predictive algorithm:

1. Given a string of text, take last 3 words typed. If sufficient 4-tuples exist starting with these three words, suggest the 4th word of the most common 4-tuple.

2. If insufficent such 4-tuples exist, take only last 2 words in typed test data and repeat with all 3-tuple.

3. If insufficent 3-tuples, repeat with last word typed and doubles.

4. If last word is unusual or non-existent in training data, suggest single most common word.

--- .class #id 

## Next Steps, Advanced.
As I build my application, I'll make improvements as they become apparent. Some examples may include:

* Perform better filtering of special characters, punctuation.

* Incorporate parts of speech, and separate training data by independent and dependent clauses (e.g., don't count a n-tuple that spans two sentences).

* Any other sorting of topics beyond just the blog/news/twitter level. For instance, if blog post is identified as a cooking recipe, then use appropriate training data.
