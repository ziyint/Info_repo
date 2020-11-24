## My Project

For my project, I will analyze `data.txt` in `raw_data` folder. 

Briefly introduction of project structrue: 
  * `raw_data` folder contains all of raw data.
  * `R` folder contains R codes.
  * `process_data` folder will contain all of processed data.
  * `figs` folder will contain all of figures.
  * `output` will contain the final analysis report.

  * `makefile` contains all rules for project.
  * `Dockerfile` is used to build the Docker image.


## Download Docker image for analysis from DockerHub

Firstly, to download Docker iamge for this analysis from DockerHub, you should type:

```bash
docker pull ziyint/final_proj
```


## Execute the analysis and generate the report

To execute the analysis and generate the report in `ziyint/final_proj` Docker image as well as retrive the final report from the image, you should amount the `/project/output` directory in the image to local `output` directory. To do this, you should type: 

```bash
docker run -v path/to/output:/project/output -it ziyint/final_proj
```
(Notes: you should edit `path/to/output` according to your local location of `output` directory)

Then you will see a `report.html` in your local `output` directory.


## If you want to perform the analysis in Docker image or local labtop by yourself, detailed instructions are as follows:

Firstly, you should run interactively with the `ziyint/final_proj` Docker image and then change working directory to `project`.

```bash
docker run -it ziyint/final_proj /bin/bash
```
In the `ziyint/final_proj` Docker image, type:

```bash
cd project
```

If you want to do the analysis from local laptop, you should install `R` packages for analysis. To do this, you can type: 

```bash
make install 
```

(Notes: I have installed them in the Docker image already, you could skip this step if you are running the `ziyint/final_proj` Docker image.)


To execute the analysis and generate the analysis report:
```bash
make R/report.html
```
This will create a file called `report.html` in `output` folder that contains the results.

## Build the Docker image

To build the docker image for this analysis in local laptop, you can run
```bash
make build
```
(Notes: You can't build the docker image in the `ziyint/final_proj` Docker image because Docker is not installed there)

## Information of rules in makefile

To get information of all rules in makefile, you can run

```bash
make help
```