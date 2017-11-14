library(ggplot2)
country <- read.csv("hw7.csv")

p <- qplot(fitted, resid, geom = c("point", "smooth"),data=country, main = "Resdiuals vs Fitted Plot")
ggsave("hw7.png", p)