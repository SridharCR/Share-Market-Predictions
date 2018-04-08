library(DT)
library(shiny)
library(alphavantager)
library(ggplot2)
data <- function(stock_name="",days_history){
  av_api_key("MKZU4NIZYCV91AOZ")
  sri <- data.frame(av_get(symbol = stock_name, av_fun = "TIME_SERIES_DAILY", interval = "15min", outputsize = "compact"))
  sri
}
visualization <- function(sri){
  high_vis <- ggplot(aes(x = timestamp),data = sri) + geom_line(aes(y = high)) + geom_line(aes(y = low)) + 
    labs(title = "High price vs Time",x = "Timeline in months",y = "Share price - High") + 
    theme_classic(base_size = 20)
  high_vis
}
shinyServer(function(input, output) {
  data_table <- reactive({data(input$stock_name,input$stock_history)})
  #output$data_table <- renderDataTable({data_table()})
  output$plot_high <- renderPlot({visualization(data_table())})
})
