library(shiny)
library(tidyverse)
library(readr)
library(shinythemes)

# New theme and Download bar
ui <- fluidPage(theme = shinytheme("darkly"),
								downloadLink("downloadData", "Download"),
								
# Application title
	titlePanel("Liquor Webpage"),
	
	
	sidebarPanel("List of Prices and Boozes", 
							 sliderInput("priceIn", "Price of booze",
							 					 min = 0, max = 300, value = c(10,20), pre = "CAD"),
							 radioButtons("typeIn", "What kind of booze?",
							 						 choices = c("BEER", "SPIRITS", "WINE"), 
							 						 selected = "SPIRITS")
	
	            
							 
	),
	
#Create new Tab
	mainPanel(
		tabsetPanel(
			tabPanel("Histogram of Alcohol Content", plotOutput("Hist_AlcCont")),
			tabPanel("List of Alcohol", tableOutput("table_head")), 
			tabPanel("Sweetness of Wine", conditionalPanel(condition = "input.typeIn == 'WINE'", 
									 					sliderInput("sweetIn","Levels of Sweetness",
									 					min = 0, max = 10, value = 5)),
							 plotOutput("Sweet"), 
							 tableOutput("sweet_table_head"))
		)
	)
	
)
