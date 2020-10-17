#! /usr/local/bin/Rscript

library(Matrix)
library(lme4)

clean_data <- read.table('processed_data/clean_data.txt', header = T, sep = ",")

# Total number of metaboloc features
num_feature <- 50

# Number of results of linear models
num_parameter <- 5

# Create a dataframe to hold the results of linear models
lm_results <- as.data.frame(matrix(nrow = num_feature, ncol = num_parameter))
colnames(lm_results) <- c("Number of observations", "Beta", "Standard deviation", "p-value", "t-value")

# Evaluate the association between exposure and metabolic features 

for(i in 1:num_feature){
	print(paste("Now it is", i, "th row", colnames(clean_data)[i+7],"for", colnames(clean_data)[5]))
	tryCatch(
	{
      lm <- summary(glm(clean_data[ ,i+7] ~ clean_data$exposure + clean_data$gender + clean_data$age, family = gaussian))
      coefs <- data.frame(coef(lm))
      lm_results[i,4] <- coefs[2,4]
      lm_results[i,2] <- coefs[2,1]
      lm_results[i,5] <- coefs[2,3]
      lm_results[i,3] <- coefs[2,2]
      lm_results[i,1] <- sum(!is.na(clean_data[ ,i+7]))

		}, error = function(e){})
}



write.csv(lm_results, "processed_data/lm_results.txt")




