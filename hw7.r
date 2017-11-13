
Country_dat <- read.delim("gapminder.csv")


Country.fit <- lm(lifeExp ~ year + factor(country), Country_dat)
resid <- resid(Country.fit)
fitted <- fitted(Country.fit)
country <- cbind(resid, fitted)


write.csv(country, file = "hw7.csv")

