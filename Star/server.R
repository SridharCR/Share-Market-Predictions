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

star_init <- function()
{
  av_api_key("MKZU4NIZYCV91AOZ");
}
get_data <- function(stock_name)
{
  sri <- data.frame(av_get(symbol = stock_name, av_fun = "TIME_SERIES_DAILY", interval = "15min", outputsize = "compact"))
}
shinyServer(function(input, output) {
  #startTime <- Sys.time()
  star_init()
  #av_api_key("MKZU4NIZYCV91AOZ")
  #sri <- data.frame(av_get(symbol = "MSFT", av_fun = "TIME_SERIES_DAILY", interval = "15min", outputsize = "compact"))
  get_data(input$stock_name)
  output$mytable = DT::renderDataTable({
    sri
  })
  
})
