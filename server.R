## Load "Shiny" package
library(shiny)

## Load "cars" dataset
data(cars)

## Initialize "Shiny Server"
shinyServer(
    function(input,output) {
        ## Render output objects for use in User Interface.
        ## Render plot, subsetting speeds from user input.
        ## Add mean and median lines, and legend
        output$myplot <- renderPlot( {
              with(subset(cars
                         ,speed >= as.numeric(input$range[1]) &
                          speed <= as.numeric(input$range[2]) )
                  ,hist(dist,xlab="Stopping Distance (Feet)",col="yellow",
                        main="Stopping Distances At Selected Speed Range",
                        breaks = 8,
                        xlim = c(0,125),
                        ylim = c(0,20)
                       )
                  )
              abline( v = median(subset(cars,speed >= as.numeric(input$range[1]) &
                                             speed <= as.numeric(input$range[2])
                                       )$dist
                                )
                    , col = "magenta", lwd = 8)
              abline( v = mean(subset(cars,speed >= as.numeric(input$range[1]) &
                                           speed <= as.numeric(input$range[2])
                                     )$dist
                              )
                    , col = "blue", lwd = 3)

              ## Add legend
              legend("topright",lty,lwd=c(8,3)
                    ,legend=c("Median","Mean")
                    ,col=c("magenta","blue")
              )
          }
        )
        ## Render test for display in the user interface
        output$myLow <- renderText(paste("From:",input$range[1],"MPH"))
        output$myHigh <- renderText(paste("To:  ",input$range[2],"MPH"))
        output$myObs <- renderText(paste("Total # of Observations:",
                              length(subset(cars
                                           ,speed >= as.numeric(input$range[1]) &
                                            speed <= as.numeric(input$range[2])
                                           )$dist
                                    )
                                        )
                                  )
    }
)
