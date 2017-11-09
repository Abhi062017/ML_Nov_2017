#first git project
getwd()
#reading data
data("airquality")
data <- airquality
str(airquality) #note: Ozone is our response variable hence has to be cast as factor
#but before that we'd remove NA's, if any.
sum(is.na(airquality))
summary(airquality)
View(airquality)
tail(airquality)

#impute NA's using VIM's kNN imputation
library(VIM)
data <- kNN(data = airquality, variable = c('Ozone','Solar.R'), k = 13)
View(data)
tail(data)
data <- data[,c(1:6)]
sum(is.na(data))

#model
model <- lm(Ozone ~., data = data)
summary(model)
data <- data[,-c(5,6)] #based on summary(model)
model <- lm(Ozone ~., data = data)
summary(model)
