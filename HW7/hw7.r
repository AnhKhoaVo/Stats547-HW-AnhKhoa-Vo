
Country_dat <- read.delim("gapminder.csv")

#linear regression of life expectancy across year and country
Country.fit <- lm(lifeExp ~ year + factor(country), Country_dat)

#Resdiuals and Fitted Values for the said regression
resid <- resid(Country.fit)
fitted <- fitted(Country.fit)

#Combine into a dataset
country <- cbind(resid, fitted)


write.csv(country, file = "hw7.csv")
