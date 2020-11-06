FROM rocker/tidyverse

# make project directory in the container
RUN mkdir /project

# copy contents of local folder to project folder in container
COPY ./ /project/

# make R scripts executable
RUN chmod +x /project/R/*.R

# install R packages for analysis
RUN Rscript /project/R/packages.R

# make container entry point that makes the report
CMD make -C project R/report.html
