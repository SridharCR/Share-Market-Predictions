#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(ggplot2)
shinyUI(fluidPage(
  titlePanel("Stock prediction"),
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "stock_name",label = "Enter the stock name",value = "MSFT")
    ),
    mainPanel(
      h2("Stock data"),
      #DT::dataTableOutput("mytable"),
      plotOutput("plot_high")
    )
  )
))
