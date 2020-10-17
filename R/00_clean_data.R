#! /usr/local/bin/Rscript

# Read in dataset
met_data <- read.table('raw_data/data.txt', header = T)
met_intensity <- met_data[4:53]

# Calculate the number of samples detected each of metabolic features
total_notmissing <- apply(met_intensity, 2, function(x){return(length(which(!is.na(x))))})

# Remove metabolic features if signal is not detected in at least 10% of all samples
good_features <- which(total_notmissing>0.1*dim(met_data[1])) 
final_met_int <- met_intensity[ , good_features]

# Final dataset
basic_info <- cbind(met_data[1:3], met_data[54:56])
clean_data <- cbind(basic_info, final_met_int)

# Make gender varible a factor variable and label each level
clean_data$gender <- factor(clean_data$gender, 
	level = c(0, 1),
	labels = c("Male", "Female"))

write.csv(clean_data, "processed_data/clean_data.txt")