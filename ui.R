#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# 5 data sets
load("C02NorthernHemisphere.Rdata")
load("CanadianAvgSnow.Rdata")
load("CanadianMaxTemp.Rdata")
load("CanadianMinTemp.Rdata")
load("CanadianMeanTemp.Rdata")
load("CanadianPrecip.Rdata")


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Vera's Shiny App"),
  
  br(),
  h4("Choose a Season:"),
  radioButtons("seasonSource", "", choices = c("Winter", "Spring", "Summer", "Autumn")),
  
  checkboxInput("TempLogical", strong("Show maximum temperature instead?"), FALSE),
  
  conditionalPanel(
    condition = "input.TempLogical == true"
  ),
  
  checkboxInput("TempLogical2", strong("Show minimum temperature instead?"), FALSE),
  
  conditionalPanel(
    condition = "input.TempLogical2 == true"
  ),
  
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
    
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 40,
                   value = 50),
    
     checkboxInput("DensityLogical", strong("Show density plot?"), FALSE),
       
    conditionalPanel(
      condition = "input.DensityLogical == true"   #Note the lowercase logical
      
      # helpText(HTML("<h3>You might want to adjust the boundary estimate</h3>")),  #This is just big text


    ),
    
    selectInput("LatInput", "Choose a Latitude Value", choices = c("Latitude30", "Latitude90"))  #This is a new input

    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  tabPanel("About Vera",
                           br(),
                           p("My name is Vera and I am a", span(em("Data Science"), style = "color:rgb(255, 153, 51)"), "student at Simon Fraser University."),
                           p("This is a Shiny App that I have created that analyzed climate change in Canada, particularly in Vancouver.")),
                  
                  tabPanel("Interactive Tab", 
                           br(),
                           p("This tab shows the relationship between temperature and the level of precipitation."),
                           plotOutput("tempPlot2"), plotOutput("preciPlot"),plotOutput("seasonPlot")),
                  
                  tabPanel("Climate Change",
                           br(),
                           h4("Increase in Temprature", style = "color:rgb(255, 166, 77)"),
                           p("This is a graph that shows the mean surface air temperature of July in Vancouver from 1896 to 2017."),
                           p("The graph shows that there is an increase in average surface air temperature in July for Vancouver for the past 122 years."),
                           plotOutput("tempPlot"),
                           br(),
                           h4("The Rise of Carbon Dioxide", style = "color:rgb(57, 172, 57)"),
                           p("Below is the graph that shows the levels of carbon dioxide (CO2), a greenhouse gas, in Canada. In both Latitude 30 and Latitude 90, the levels of 
CO2 have been rising since 1979. Carbon dioxide is caused by burning fossil fuels for energy and by other activities such as volcanic eruptions. 
                             "),
                           p("As the levels of greenhouse gases, such as carbon dioxide, continue to rise, the Earth's average temperature will be rising too, resulting in climate change."),
                           p("Shaftel, H. (2019, April 5).", em("Carbon Dioxide."), "Retrieved from https://climate.nasa.gov/vital-signs/carbon-dioxide/", style = "font-size: 12px"),
                           plotOutput("latPlot"),
                           p("Choose to display the level of carbon dioxide at another latitude by using the drop down menu on the left."),
                           br(),
                           h4("Effect on Monthly Snowfall?", style = "color:rgb(0, 153, 204)"),
                           p("Below is a graph that displays the level of snowfall in February in Vancouver since 1896. Although the temperature in Vancouver is on the rise, it does not seem to affect the level of snowfall in Vancouver."),
                           plotOutput("snowPlot"))
      )
      

      
    )
  )
))



## References

# Dlugokencky, E.J., K.W. Thoning,
# P.M. Lang, and P.P. Tans (2017), NOAA Greenhouse Gas Reference from
# Atmospheric Carbon Dioxide Dry Air Mole Fractions from the NOAA ESRL
# Carbon Cycle Cooperative Global Air Sampling Network.


# Mekis, É. and L.A. Vincent, 2011: An overview of the second generation adjusted daily precipitation dataset for trend analysis in Canada. Atmosphere-Ocean, 49(2), 163-177.
# Vincent, L. A., X. L. Wang, E. J. Milewska, H. Wan, F. Yang, and V. Swail, 2012. A second generation of homogenized Canadian monthly surface air temperature for climate trend analysis, J. Geophys. Res., 117, D18110, doi:10.1029\/2012JD017859.
# Wan, H., X. L. Wang, V. R. Swail, 2010: Homogenization and trend analysis of Canadian near-surface wind speeds. Journal of Climate, 23, 1209-1225.
# Wan, H., X. L. Wang, V. R. Swail, 2007: A quality assurance system for Canadian hourly pressure data. J. Appl. Meteor. Climatol., 46, 1804-1817. 
# Wang, X.L, Y. Feng, L. A. Vincent, 2013. Observed changes in one-in-20 year extremes of Canadian surface air temperatures. Atmosphere-Ocean. Doi:10.1080\/07055900.2013.818526.




