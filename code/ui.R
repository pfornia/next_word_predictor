#ui.R

library(shiny)
shinyUI(
    pageWithSidebar(
        headerPanel("Data Science Capstone Project"),
        sidebarPanel(
            h4("Using sample text data from Blogs, News, and Twitter, this small tool will attempt to predict the next word after an input words or series of words.")    
        ),
        mainPanel(
            textInput('inputMessage', 'Start typing your message', value = "Going to the"),
            actionButton("do", "Predict next word:"),
            
            #h4("Next Word:"),

            verbatimTextOutput("omessage")

        )
    )
)