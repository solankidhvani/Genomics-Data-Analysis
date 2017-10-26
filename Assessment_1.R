# MA5111 Assessmet 1
# Name-Dhvani Rashmin Solanki
# Id-17231681

# Defining the UI for application that draws a boxplot
{
  ui <- fluidPage(
    
# Application title
    titlePanel("Patient Data"),
    sidebarLayout(
      sidebarPanel(
        fileInput("file1", "Choose CSV File",
                  accept = c(
                    "text/csv",
                    "text/comma-separated-values,text/plain",
                    ".csv")
        ),
        tags$hr(),
        checkboxInput("header", "Header", TRUE)
        ,
        
        selectInput("var", "Select a variable:",
                    c("Age" = "age",
                      "Height" = "height",
                      "Weight" = "weight",
                      "Bmi" = "bmi")),
        radioButtons("cols", "Colours", 
                     c("Brown",
                       "Blue",
                       "Green",
                       "Orange")))
      
      ,
      mainPanel(
        tableOutput("data"),
        plotOutput("variables")
      )))
  
# Defining a server logic to draw a boxplot 
 server <- function(input, output){
    output$data <-renderTable({ 
      infile <-input$file1
      if (is.null(infile))
        return(NULL)
      c <-read.csv(infile$datapath, header = input$header)
      
    })
    output$variables <-renderPlot({
      (req(input$file1))
      infile <- input$file1
      data <-read.csv(infile$datapath, header=input$header)
      var <-input$var
      col <-input$cols
      boxplot(data[,var], col=col, main=paste("Variable", var))
    })}
  
  
  
  
# To run the application 
  shinyApp(ui = ui, server = server)
  
}

