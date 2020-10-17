## My Project

For my project, I will analyze `data.txt` in `raw_data` folder. 
`Raw_data` folder contains all of raw data.
`process_data` folder contains all of processed data.
`R` folder contains R codes.
`figs` folder contains all of figures.

To analyze the data, you will need to install some `R` packages. These packages can be installed typing 

```bash
make install 
```

## Execute the analysis and generate the report

To execute the analysis and generate the report, you can run

```bash
make R/report.Rmd
```

This will create a file called `report.html` in your `R` folder that contains the results.


## Information of rules in Makefile

To get information of all rules in Makefile, you can run

```bash
make help
```