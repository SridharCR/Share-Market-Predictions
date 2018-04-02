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
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Stock prediction"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "stock_name",label = "Enter the stock name",value = "MSFT")
    ),
    mainPanel(
      h2("Stock data"),
      DT::dataTableOutput("mytable")
    )
  )
    
    # Show a plot of the generated distribution
    
  
))
