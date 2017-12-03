library(shiny)
shinyUI(fluidPage(
        titlePanel("Distributions"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Note: This app plots different Statistical Distributions.", 
                                 "Choose a distribution in the drop down menu", 
                                 "and choose a sample size using the slider.",
                                 "Press the submite button and the graph will update according to your parameters."
                        ),
                        selectInput("dataset", "Choose a variable:",
                                    choices = c("Normal",
                                                "Uniform",
                                                "Log-normal",
                                                "Exponential")),
                        br(),
                        sliderInput("n",
                                    "Number of observations:",
                                    value = 500,
                                    min = 1,
                                    max = 1000),
                        submitButton("Submit")
                        ),
                mainPanel(
                        tabsetPanel(type = "tabs",
                                    tabPanel("Plot", plotOutput("plot")),
                                    tabPanel("Date Summary", verbatimTextOutput("summary")),
                                    tabPanel("Data Table", tableOutput("table"))
                                    )
                        )
                )
        )
)
        