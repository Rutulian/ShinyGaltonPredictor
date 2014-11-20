library(shiny)

shinyUI(fluidPage(
        titlePanel("Galton Height Predictor"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Enter the height of the mother and father
                                 to predict the height of a child."),
                        h3("Father's height"),
                        sliderInput(inputId = "f_feet",
                                    label = "Feet",
                                    value = 5,
                                    min = 4,
                                    max = 6,
                                    step = 1),
                        sliderInput(inputId = "f_inch",
                                    label = "Inches",
                                    value = 8,
                                    min = 0,
                                    max = 11,
                                    step = 1),
                        h3("Mother's height"),
                        sliderInput(inputId = "m_feet",
                                    label = "Feet",
                                    value = 5,
                                    min = 4,
                                    max = 5,
                                    step = 1),
                        sliderInput(inputId = "m_inch",
                                    label = "Inches",
                                    value = 3,
                                    min = 0,
                                    max = 11,
                                    step = 1)
                ),
                mainPanel(
                        plotOutput("hist"),
                        div("This histogram displays the distribution of
                             children's heights in the Galton dataset used
                             to fit the prediction model.  The red line
                             shows where the predicted child sits in this
                             distribution.  Please note that this app is a
                             demonstration of a linear model within shiny,
                             and should not be used for eg purchasing items
                             for your as yet unborn child."),
                        div("Please also note that this data was collected
                             in 1885, and will not allow for the entry of
                             many modern heights")
                )
        )
))