#Install packages and load packages here
library(readr)
library(data.table)
library(dplyr)
library(corrplot)

dataset <- fread(file = "C://Users//martd//Desktop//DS 340W//Project Files//train.csv", nrows = 300000)


correlation_dataframe <- dataset[, -c(1:4)]
  
correlation_value <- cor(correlation_dataframe, method = c("pearson","kendall","spearman"))

# find max values in matrix
n <- 300
nlargest <- function(correlation_value, n, sim = TRUE){
  mult <- 1;
  if (sim) mult <- 2;
  res <- order(correlation_value)[seq_len(n)*mult];
  pos <- arrayInd(res, dim(correlation_value), useNames = TRUE);
  list(values = correlation_value[res],
       position = pos)
}

diag(correlation_value) <- NA
nlargest(correlation_value, 20)

correlation_import <- read.csv(file = "C://Users//martd//Desktop//DS 340W//Project Files//Correlation.csv", header = FALSE)

correlation_import <- correlation_import %>% rename(Row = V1, Column = V2, Correlation = V3)




