## My Project

For my project, I will analyze `data.txt` in `raw_data` folder. 

  * `raw_data` folder contains all of raw data.
  * `process_data` folder contains all of processed data.
  * `R` folder contains R codes.
  * `figs` folder contains all of figures.
  * `makefile` contains all rules for project.
  * `output` will contain the final analysis report.

To retrieve the final report from the image, you should amount the `/project/output` directory in the image to local `output` directory. To do this, you should type

```bash
docker run -v path/to/output:/project/output -it final_proj
```
Then you will see a `report.html` in your local `output` directory.

To down load Docker iamge for this analysis from DockerHub, you should type:

```bash
docker pull ziyint/final_proj
```

To analyze the data, you will need to install some `R` packages. These packages can be installed typing (I have installed them in the Docker image already, you could skip this step)

```bash
make install 
```

## Execute the analysis and generate the report

To execute the analysis and generate the report, you can run

```bash
make R/report.html
```

This will create a file called `report.html` in `R` folder that contains the results.

## Build the Docker image

To build the docker image for this analysis, you can run
```bash
make build
```

## Information of rules in makefile

To get information of all rules in makefile, you can run

```bash
make help
```