library(shiny)
source('helper.R')

df = read.csv('Los_Angeles_International_Airport_-_Passenger_Traffic_By_Terminal.csv', header = T)
df = dataclean(df)
shinyServer(
        function(input,output){
                output$rose <- renderPlot({
                        roseGraph(df, input$year)
                })
        })