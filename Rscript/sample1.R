train <- read.csv("train_short.csv")

install.packages("DMwR")

library(DMwR)

head(train)

knnImputation(head(train))

install.packages("imputeMissings")

impute(head(train), method = "randomForest")

train1 <- subset(train, select=c("shopping_pt","record_type","day","location","group_size","homeowner","car_age", "car_value", "risk_factor","age_oldest","age_youngest","married_couple","C_previous","duration_previous","policy","cost"))

head(train1)

impute(head(train1), method = "randomForest")

knnImputation(head(train1))

source("https://bioconductor.org/biocLite.R")
biocLite("impute")

library(impute)

impute.knn(train1)

train_matrix <- data.matrix(train1, rownames.force = NA)

train_imp <- impute.knn(train_matrix)

x <- train_imp[1]

typeof(x)




