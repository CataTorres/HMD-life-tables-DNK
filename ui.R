
shinyUI(
  
  fluidPage(
  
  titlePanel("Some life table functions by age and sex, Denmark"),
  h3("Period life tables, Human Mortality Database"),
  h6("Catalina Torres, MaxO"),
  
  sidebarLayout(
    sidebarPanel( width = 2,
                  
                  sliderInput("year", label = "Year", 
                              min = 1835, max = 2014, value = 1835, 
                              sep="", step=1, ticks=F)),
    
    mainPanel(plotOutput("plot", height = 700, width = 1200))
    
  )))

