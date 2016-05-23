library(shiny)

shinyUI(
  navbarPage("Shiny Application For data visualization",
            
            tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between variables and miles per horsepower (hp)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        ))
                            
                           
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("Regression model", 
                                                 plotOutput("hpPlot"),
                                                 verbatimTextOutput("fit")
                                        ),
                                        tabPanel("BoxPlot", plotOutput("hpBoxPlot"))
                                        
                            )
                          )
                        )
                      )
             ),
             
             tabPanel("More Data Detail",
                      h2("Motor Trend Car Road"),
                      hr(),
                      h3("Description"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                               " and comprises fuel consumption and 10 aspects of automobile design and performance",
                               " for 32 automobiles (1973 models)."),
                      h3("Index"),
                      p("A data frame with 32 observations on 11 variables."),
                      
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),
                      p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      p("  [, 4]	 hp	 Gross horsepower"),
                      p("  [, 5]	 drat	 Rear axle ratio"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 7]	 qsec	 1/4 mile time"),
                      p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburetors"),
                      
                      h3("Source"),
                      
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391")
             ),
            tabPanel("Developed By",
                     h1("by Dipendra Kusi"))
            
            
  )
)