---
title       : Coursera Capstone Project
subtitle    : Next Word Prediction
author      : Paul Fornia
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Finishing each others' sandwiches
    
The field of text analytics is exploding, and the ability for software to quickly understand and manipulate typed language has obvious, far-reaching consequences.
    
One seemingly simple (but useful) exercise to get introduced to text analytics, is to create a program that can predict the next word in an incomplete sentence.

Besides serving as lesson for programmers new to text analytics (like myself), this problem could have valuable business applications. Such an algorithm could help flag mistakes in documents, could be used in translation software, and if implemented efficiently enough, could be used by firms like SwiftKey to help device users increase the speed of writing messages.

--- .class #id 

## The Task

The task for this application is as follows:

1. Use a large (static) collection of text used in real life. These come from Blogs, News articles, and from Twitter feeds.
2. Create a predictive model that tries to predict which word will appear next in a sentence, based on this training data.
3. Imbed this model in a light-weight app that users can use in real-time as they are typing.

![width](Capture.png)

--- .class #id 

## A simple n-gram approach

My predictive model uses a small sub-sample of all available training data. 

The training data is converted to all lower-case, and all punctuation is removed.

Note: The exact same data cleaning algorithm will be applied to the user-input data as the application is being used.

The model will iteratively search 4-grams, 3-grams, 2-grams, and 1-grams until a sufficient amount of matching data is found.

--- .class #id 

## The 4-grams

The algorithm works as follows:

1. The last three words of user input are taken, and searched for in the input data.
2. For each instance of this three-word phrase in the data, one "next word" is captured and stored.
3. If the most frequently occuring "next word" is seen with some threshold frequency (e.g., if a 4-gram is seen more than 3 times in a few hundred thousand lines of text), then this next word is returned to the user as a prediction of the next word to be used.

This is equivalent to searching for the most frequent 4-gram starting with a given three words.

--- .class #id 

## The 3-grams, 2-grams, 1-grams...

If however, there are no "frequent" 4-grams starting with the last three input words, then the process is repeated with one fewer word, by searching the text for 3-grams starting with the last two words... 

And finally, by searching all 2-grams starting with the last user-inputted word.

An R Shiny application implementing this algorithm can be found at 
<https://paulfornia.shinyapps.io/Capstone_v3>
