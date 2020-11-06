## R/report.html : Rule for making project report
R/report.html: R/report.Rmd figs/boxplot1.png processed_data/clean_data.txt processed_data/lm_results.txt raw_data/data.txt
	Rscript -e "rmarkdown::render('R/report.Rmd', output_file = '../output/report.html')"

## processed_data/clean_data.txt : Rule for cleaning raw data
processed_data/clean_data.txt: R/00_clean_data.R raw_data/data.txt
	chmod +x $< && \
	Rscript $<

## fig/boxplot1.png : Rule for Making a boxplot for exposure levels stratified by gender
figs/boxplot1.png: R/01_make_boxplot.R processed_data/clean_data.txt
	chmod +x $< && \
	Rscript $<

## processed_data/lm_results.txt : Rule fo Untargeted Metabolome-Wide Association Study
processed_data/lm_results.txt: R/02_data_analysis.R processed_data/clean_data.txt
	chmod +x $< && \
	Rscript $<

## install : Rule for install packages
.PHONY: install
install: R/packages.R
	chmod +x $<
	Rscript $<

## build : Builds the docker image
.PHONY: build
build: Dockerfile
	docker build -t final_proj .

## help : Document rules
.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<