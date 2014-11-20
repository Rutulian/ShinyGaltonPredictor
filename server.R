library(UsingR)
data(galton)

# Fit a linear model to the galton dataset, using midparent height as a
# predictor of child height
beta <- lm(child ~ parent, galton)$coefficients

# Calculates midparent height in inches from father and mother heights given
# in feet and inches.
midparent <- function(ffeet, finch, mfeet, minch){
        ((12*ffeet + finch) + 1.08*(12*mfeet + minch))/2
}

# Uses the linear model coefficients to predict child height in inches
# from midparent height in inches
predict <- function(parent) beta[[1]] + beta[[2]] * parent

# Converts inches to a 2-element list of feet and inches
footinch <- function(inches) c(floor(inches/12), round(inches %% 12, 1))

shinyServer(function(input, output){
        # The prediction is wrapped in a reactive statement so it runs
        # once when any of its inputs change.  The output uses this
        # result four separate times, so this reduces recalculation
        c_height <- reactive(
                predict(midparent(input$f_feet,
                                  input$f_inch,
                                  input$m_feet,
                                  input$m_inch))
        )
        
        output$hist <- renderPlot({
                title <- paste("Your child may well be",
                               footinch(c_height())[1],
                               " feet ",
                               footinch(c_height())[2],
                               " inches tall")
                
                #Draw a histogram of the child heights in the Galton dataset
                hist(galton$child, col = 'lightblue', main=title,
                     xlab = "Child's height in inches")
                
                #Add a line for the child's predicted height
                lines(c(c_height(),c_height()),
                      c(0,200),
                      col = 'red',
                      lwd = '3')
        })
})