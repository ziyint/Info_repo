#! /usr/local/bin/Rscript

clean_data <- read.table('processed_data/clean_data.txt', header = T, sep = ",")

# Make a boxplot for exposure levels stratified by gender
png("figs/boxplot1.png")
boxplot(exposure~gender, data = clean_data, main = "Boxplot for Exposure Levels Stratified By Gender",
	xlab = "Gender", ylab = "Exposure level", pch = 19)
dev.off()