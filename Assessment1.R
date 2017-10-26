# MA5111 Assessment 1
# Name-Dhvani Rashmin Solanki
# Id- 17231681

library(shiny)

# Defining the UI for application that draws a histogram
ui <- fluidPage(
  
# Title
  titlePanel("Random Probability Distributions"),
  numericInput("n","Enter the Number of Samples", 10, min = NA, max = NA, step = NA,
               width = NULL),
  
# Defining the Sidebar for input values
  sidebarLayout(
    sidebarPanel(
      sliderInput("mean",
                  "Choose the Value for Mean:",
                  min = 0,
                  max = 100,
                  value = 0)
    ),
    sidebarLayout(
    sidebarPanel(
      sliderInput("sd",
                  "Choose the  value for Standard Deviation:",
                  min = 0,
                  max = 100,
                  value = 0)
    ),
    
# To show a plot of generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
)

# Defining a server logic to draw a histogram
server <- function(input, output) {
  output$distPlot <-renderPlot({
  
    Samples<-rnorm(input$n,input$mean,input$sd)
    hist(Samples)
    
  
  
  }
  )
  
}

# To run the application 
shinyApp(ui = ui, server = server)

