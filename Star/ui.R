library(shiny)
library(DT)
library(ggplot2)
shinyUI(fluidPage(
  titlePanel("Stock prediction"),
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "stock_name",label = "Enter the stock name",value = "MSFT"),
      textInput(inputId = "stock_history",label = "How many days back would you like your data to go back to help make the prediction?",value = "compact")
    ),
    mainPanel(
      h2("Stock data"),
      #DT::dataTableOutput("data_table"),
      plotOutput("plot_high")
    )
  )
))
