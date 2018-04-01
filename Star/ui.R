#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Stock prediction"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    sidebarPanel(
      textInput("Stock", "Select any Stock", value="MSFT"),
      selectInput('DayBack', "How much history you want to analyze?",
                  choices=c("30 Days"="30", "120 Days"="120", "Maximum Number of Days Available"="Max"), selected="Max"),
      sliderInput('DayForward',"How many days you want to predict:",min = 1,max = 210,step=1,sep="",value = 30),
      checkboxGroupInput("Predictors", "Select the preferred ratio(Date is mandatory)", 
                         choices=c("Date"="7", "Return On Assets (FP)"="12", "Return On Equity (FP)"="13", "Profit Margin (FP)"="14", 
                                   "Current Ratio (FP)"="15", "Quick Ratio (FP)"="16", "Debt to Equity Ratio (FP)"="17", "Interest Coverage Ratio (FP)"="18", 
                                   "Asset Turnover Ratio (FP)"="19", "Inventory Turnover Ratio (FP)"="20"), selected="7"),
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
