
server <- function(input, output){
	bcl_data <- read_csv("bcl-data.csv")
	
	Filtered_bcl <- reactive({
		bcl_data %>%
			filter(Price >= input$priceIn[1], 
						 Price <= input$priceIn[2],
						 Type == input$typeIn)
	})
	

	
#Adding Sweetness for wine	
	Sweetness_bcl <- reactive({
		Filtered_bcl() %>%
			filter(Sweetness == input$sweetIn)
	})
	
	output$Hist_AlcCont <- renderPlot({
		Filtered_bcl() %>%
		ggplot() + aes(x = Alcohol_Content, y = Price) +
		geom_point(size = 3) + 
		theme(axis.text=element_text(size=12),
					axis.title=element_text(size=14,face="bold"))+
		ggtitle("Graph of Alcohol content and Price")
	})

	output$table_head <- renderTable({
		Filtered_bcl() %>%
			head()
	})

#Adding a download bar
  output$data.csv <- downloadHandler(filename = function(){
  															paste("data", "csv", sep=".")},
  															content = (write.csv(bcl_data, file = "data.csv"))
  
  )
  
 
 output$sweet_table_head <- renderTable({
 	Sweetness_bcl() %>%
 		head()
 })

#Adding a graph for sweetness of wine
 output$Sweet <- renderPlot({
 	Sweetness_bcl() %>%
 		ggplot() + aes(x = Alcohol_Content, y = Price) +
 		geom_point(size = 3) + 
 		theme(axis.text=element_text(size=12),
 					axis.title=element_text(size=14,face="bold")) + 
 		ggtitle("Graph of Alcohol content and price based on Sweetness of wine")
 })
 
 }