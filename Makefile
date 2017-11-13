all: report.html

gapminder.tsv: 
	Rscript download.r
	
hw7.csv: hw7.r gapminder.tsv
	Rscript $<

hw7.png: hw7.csv
	Rscript -e 'library(ggplot2); qplot(fitted, resid, data=read.csv("$<")); ggsave("$@")'
	rm Rplots.pdf

report.html: report.rmd hw7.csv hw7.png
	Rscript -e 'rmarkdown::render("$<")'

clean: 
	rm -f gapminder.tsv hw7.csv hw7.png report.html report.rmd