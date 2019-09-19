#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  output$latPlot <- renderPlot({
    
    if(input$LatInput == "Latitude30"){
      plot(Co2North$YearDecimal,Co2North$Latitude30value, type = "l", xlab = "Year", ylab = "CO2 (parts per million)",
           main = "CO2 levels at the 30th parallel North since 1979")
      # la = Co2North[Co2North[, "Latitude30value"], "Latitude30value"]
    }else{
      if(input$LatInput == "Latitude90"){
        plot(Co2North$YearDecimal,Co2North$Latitude90value, type = "l", xlab = "Year", ylab = "CO2 (parts per million)", 
             main = "CO2 levels at the 90th parallel North since 1979")
        # la = Co2North[Co2North[, "Latitude90value"], "Latitude90value"]
      }
    }
    
    
  })
  
  
  output$seasonPlot <- renderPlot({
    
    if(input$seasonSource == "Winter"){
      y <- AllSnow[AllSnow[, "Winter"] > -9999, "Winter"]
    }else{
      if(input$seasonSource == "Spring"){
        y <- AllSnow[AllSnow[, "Spring"] > -9999, "Spring"]
      }else{
        if(input$seasonSource == "Summer"){
          y <- AllSnow[AllSnow[, "Summer"] > -9999, "Summer"]
        }else{
          if(input$seasonSource == "Autumn"){
            y <- AllSnow[AllSnow[, "Autumn"] > -9999, "Autumn"]
          }
        }
      }
    }
  
    
    bins <- seq(min(y), max(y), length.out = input$bins + 1)
    hist(y, breaks = bins, col = 'darkgray', border = 'white', main = "Histogram of Canadian Average Snowfall", xlab = "Snowfall"
         , prob=input$DensityLogical)
    
    
    if(input$DensityLogical){
        Dens = density(y)
        lines(Dens, col = "red")
      }
     })
  
  output$preciPlot <- renderPlot({
    if(input$seasonSource == "Winter"){
      p = AllPrecip[AllPrecip[, "Winter"] > -9999 & AllPrecip[, "InfoTemp[2]"] == "VANCOUVER", ]
      plot(p[, "Year"], p[, "Winter"], type = "l", col = "#0088cc", ylab = "Precipitation", xlab = "Year",
           main = "Total Precipitation of Winter in Vancouver since 1896")

    }else{
      
      if(input$seasonSource == "Spring"){
            p = AllPrecip[AllPrecip[, "Spring"] > -9999 & AllPrecip[, "InfoTemp[2]"] == "VANCOUVER", ]
            plot(p[, "Year"], p[, "Spring"], type = "l", col = "#0088cc", ylab = "Precipitation", xlab = "Year",
                 main = "Total Precipitation of Spring in Vancouver since 1896")
      }else{
        
        if(input$seasonSource == "Summer"){
          p = AllPrecip[AllPrecip[, "Summer"] > -9999 & AllPrecip[, "InfoTemp[2]"] == "VANCOUVER", ]
          plot(p[, "Year"], p[, "Summer"], type = "l", col = "#0088cc", ylab = "Precipitation", xlab = "Year",
               main = "Total Precipitation of Summer in Vancouver since 1896")
        }else{
          if(input$seasonSource == "Autumn"){
            p = AllPrecip[AllPrecip[, "Autumn"] > -9999 & AllPrecip[, "InfoTemp[2]"] == "VANCOUVER", ]
            plot(p[, "Year"], p[, "Autumn"], type = "l", col = "#0088cc", ylab = "Precipitation", xlab = "Year",
                 main = "Total Precipitation of Autumn in Vancouver since 1896")
            
          }
          
        }
      }
      
    }
    
  })

  
  output$tempPlot2 <- renderPlot({
    
    if(input$seasonSource == "Winter"){
      mean_temp = MeanTemp[MeanTemp[, "Winter"] > -9999 & MeanTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
      plot(mean_temp[, "Year"], mean_temp[, "Winter"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ff9966",
           main = "Mean Surface Air Temperature of Winter in Vancouver since 1896")
  
        if(input$TempLogical){
          max_temp = MaxTemp[MaxTemp[, "Winter"] > -9999 & MaxTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
          plot(max_temp[, "Year"], max_temp[, "Winter"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ff5c33",
               main = "Max Surface Air Temperature of Winter in Vancouver since 1896")
        }
      
      
      if(input$TempLogical2){
        min_temp = MinTemp[MinTemp[, "Winter"] > -9999 & MaxTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
        plot(min_temp[, "Year"], min_temp[, "Winter"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ffd480",
             main = "Min Surface Air Temperature of Winter in Vancouver since 1896")
      }
      
      
    }else{
      if(input$seasonSource == "Spring"){
        mean_temp = MeanTemp[MeanTemp[, "Spring"] > -9999 & MeanTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
        plot(mean_temp[, "Year"], mean_temp[, "Spring"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ff9966",
             main = "Mean Surface Air Temperature of Spring in Vancouver since 1896")
        
        if(input$TempLogical){
          max_temp = MaxTemp[MaxTemp[, "Spring"] > -9999 & MaxTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
          plot(max_temp[, "Year"], max_temp[, "Spring"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ff5c33",
               main = "Max Surface Air Temperature of Spring in Vancouver since 1896")
        }
        
        if(input$TempLogical2){
          min_temp = MinTemp[MinTemp[, "Spring"] > -9999 & MaxTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
          plot(min_temp[, "Year"], min_temp[, "Spring"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ffd480",
               main = "Min Surface Air Temperature of Spring in Vancouver since 1896")
        }
        
        
      }else{
        if(input$seasonSource == "Summer"){
          mean_temp = MeanTemp[MeanTemp[, "Summer"] > -9999 & MeanTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
          plot(mean_temp[, "Year"], mean_temp[, "Summer"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ff9966",
               main = "Mean Surface Air Temperature of Summer in Vancouver since 1896") 
          
          if(input$TempLogical){
            max_temp = MaxTemp[MaxTemp[, "Summer"] > -9999 & MaxTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
            plot(max_temp[, "Year"], max_temp[, "Summer"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ff5c33",
                 main = "Max Surface Air Temperature of Summer in Vancouver since 1896")
          }
          
          if(input$TempLogical2){
            min_temp = MinTemp[MinTemp[, "Summer"] > -9999 & MaxTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
            plot(min_temp[, "Year"], min_temp[, "Summer"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ffd480",
                 main = "Min Surface Air Temperature of Summer in Vancouver since 1896")
          }
          
          
        }else{
          if(input$seasonSource == "Autumn"){
            mean_temp = MeanTemp[MeanTemp[, "Autumn"] > -9999 & MeanTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
            plot(mean_temp[, "Year"], mean_temp[, "Autumn"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ff9966",
                 main = "Mean Surface Air Temperature of Autumn in Vancouver since 1896")
            
            if(input$TempLogical){
              max_temp = MaxTemp[MaxTemp[, "Autumn"] > -9999 & MaxTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
              plot(max_temp[, "Year"], max_temp[, "Autumn"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ff5c33",
                   main = "Max Surface Air Temperature of Autumn in Vancouver since 1896")
            }
            
            if(input$TempLogical2){
              min_temp = MinTemp[MinTemp[, "Autumn"] > -9999 & MaxTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
              plot(min_temp[, "Year"], min_temp[, "Autumn"], type = "l", ylab = "Temperature (°C)", xlab = "Year", col = "#ffd480",
                   main = "Min Surface Air Temperature of Autumn in Vancouver since 1896")
            }
            
          }
        }
      }
    }
  
    
  })
  
  
  output$tempPlot <- renderPlot({
    
    
    july = MeanTemp[MeanTemp[, "Jul"] > -9999 & MeanTemp[, "InfoTemp[2]"] == "VANCOUVER", ]
    
    plot(july[, "Year"], july[, "Jul"], type = "l", ylab = "Temperature (°C)", xlab = "Year", 
         main = "Mean Surface Air Temperature of July in Vancouver since 1896")
  
    
  })
  
  output$snowPlot <- renderPlot({
    snow_jan = AllSnow[AllSnow[, "Feb"] > -9999 & AllSnow[, "InfoTemp[2]"] == "VANCOUVER", ]
    plot(snow_jan[, "Year"], snow_jan[, "Feb"], type = "l", ylab = "Snowfall", xlab = "Year",
         main = "February Snowfall in Vancouver since 1896")
  })

  

  
})
