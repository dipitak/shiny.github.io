---
title       : Analysis of the mtcars dataset
subtitle    : 
author      : Dipendra Kusi
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
github: 
        user: dipitak
        repo: Shinyapp.github.io
---

## Coursera Shiny project Pitch
Here we have shown the relation between the HP varible with other varible so that relation between other variable can be explored.
Also through use of regression, we can predict the value of HP at different level. People can view the relation and regression curver by checking
the varible type through dropdown box.

## Data Source: mtcars dataset

> The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).

### Source
> Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.

---

## Summary of mtcars Data

```r
library(datasets)
head(mtcars, 2)
```

```
##               mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4      21   6  160 110  3.9 2.620 16.46  0  1    4    4
## Mazda RX4 Wag  21   6  160 110  3.9 2.875 17.02  0  1    4    4
```

```r
summary(mtcars)
```

```
##       mpg             cyl             disp             hp       
##  Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
##  1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
##  Median :19.20   Median :6.000   Median :196.3   Median :123.0  
##  Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
##  3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
##  Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
##       drat             wt             qsec             vs        
##  Min.   :2.760   Min.   :1.513   Min.   :14.50   Min.   :0.0000  
##  1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89   1st Qu.:0.0000  
##  Median :3.695   Median :3.325   Median :17.71   Median :0.0000  
##  Mean   :3.597   Mean   :3.217   Mean   :17.85   Mean   :0.4375  
##  3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90   3rd Qu.:1.0000  
##  Max.   :4.930   Max.   :5.424   Max.   :22.90   Max.   :1.0000  
##        am              gear            carb      
##  Min.   :0.0000   Min.   :3.000   Min.   :1.000  
##  1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
##  Median :0.0000   Median :4.000   Median :2.000  
##  Mean   :0.4062   Mean   :3.688   Mean   :2.812  
##  3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
##  Max.   :1.0000   Max.   :5.000   Max.   :8.000
```

---

## mtcars dataset - Format

**A data frame with 32 observations on 11 variables.**

| Index | Field | Detail |
------- | ----- | ------ |
| [, 1] | mpg | Miles/(US) gallon |
| [, 2]  | cyl | Number of cylinders |
| [, 3]	| disp | Displacement (cu.in.) |
| [, 4]	| hp | Gross horsepower |
| [, 5]	| drat | Rear axle ratio |
| [, 6]	| wt | Weight (lb/1000) |
| [, 7]	| qsec | 1/4 mile time |
| [, 8]	| vs | V/S |
| [, 9]	| am | Transmission (0 = automatic, 1 = manual) |
| [,10]	| gear | Number of forward gears |
| [,11]	| carb | Number of carburetors |

---

## Analysis: ui code
```r
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


)
```
---

---
## Analysis - main code

```r
 
  formulaText <- reactive({
    paste("hp ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("hp ~", "as.integer(", input$variable, ")")
  })
  
...
output$fit <- renderPrint({
        summary(fit()) 
})

output$hpPlot <- renderPlot({
    with(hpData, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
})

```
---


