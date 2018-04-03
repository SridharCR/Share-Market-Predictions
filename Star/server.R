#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(DT)
library(shiny)
library(alphavantager)

shinyServer(function(input, output) {
  sri <- data.frame(av_get(symbol = "MSFT", av_fun = "TIME_SERIES_DAILY", interval = "15min", outputsize = "compact"))
  av_api_key("MKZU4NIZYCV91AOZ")
  observeEvent(input$stock_name, {
    print(paste0("You have chosen: ", input$stock_name))
    sri1 <- data.frame(av_get(symbol = input$stock_name, av_fun = "TIME_SERIES_DAILY", interval = "15min", outputsize = "compact"))
    #output$mytable <- DT::renderDataTable({sri1})
    sri <- sri1
    output$plot_high <- renderPlot({
      ggplot(aes(x = timestamp, y = high),data = sri) + geom_freqpoly(stat = "identity") + labs(title = "High price vs Time",x = "Timeline in months",y = "Share price - High") + theme_minimal()
  })

     
  })
  
  
})
