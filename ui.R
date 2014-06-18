library(shiny)

shinyUI(fluidPage(
        titlePanel("LAX Passenger Traffic by Terminal"), 
        sidebarLayout(
                sidebarPanel(
                        helpText('Here I ploted the passenger traffic(in millions) of LAX from 2007 to 2013. Each year, the traffic of every terminal is shown in a rose diagram.'),
                        radioButtons('year', label = 'Choose a Year',choices = list('2007' = 2007, '2008' = 2008, '2009' = 2009, '2010' = 2010, '2011' = 2011, '2012' = 2012, '2013' = 2013), selected = 2007)
                        ),
                mainPanel(
                        plotOutput('rose')
                        )
                )
        )
)