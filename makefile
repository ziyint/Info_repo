## report.html : Rule for making project report
R/report.html: R/report.Rmd figs/*.png processed_data/*.txt raw_data/data.txt
	Rscript -e "rmarkdown::render('R/report.Rmd')"

## clean_data.txt : Rule for cleaning raw data
clean_data.txt: R/00_clean_data.R raw_data/data.txt
	chmod +x $< && \
	Rscript $<

## fig/boxplot1.png : Rule for Making a boxplot for exposure levels stratified by gender
figs/boxplot1.png: R/01_make_boxplot.R processed_data/clean_data.txt
	chmod +x $< && \
	Rscript $<

## lm_results.txt : Rule fo Untargeted Metabolome-Wide Association Study
lm_results.txt: R/02_data_analysis.R processed_data/clean_data.txt
	chmod +x $< && \
	Rscript $<

## install : Rule for install packages
.PHONY: install
install: R/packages.R
	chmod +x $<
	Rscript $<

## help : Document rules
.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<