## Use "shiny" package
library(shiny)

## Initialize Shiny User Interface
shinyUI(
    fluidPage(
        ## Add Head Text
        headerPanel("Car Stopping Distances at Various Speeds"),

        ## Add Title
        titlePanel("Data from 1920's"),

        sidebarLayout(position="left",
            ## Add Sidebar Panel with Instructions, Slider Input, and selection display
            sidebarPanel( helpText("Select the speed range (in Miles Per Hour) you would like to examine.
                             The graph at the right will give frequencies of the stopping distances (in feet),
                             along with the mean and median, for the observations within the selected range."),
                          p(" "),
                          p(" "),
                          sliderInput("range","Select desired speed range:",min=4,max=25,value=c(7,22),step=1),
                          p("(Click and drag the bottom and top speed ranges.)"),
                          p(" "),
                          p(" "),
                          p("You have selected:"),
                          textOutput("myLow"),
                          textOutput("myHigh"),
                          p(" "),
                          textOutput("myObs")
                        ),
            ## Add Main Panel containing the histogram
            mainPanel(
                       plotOutput("myplot")
                     )
        )
    )
)
