#!/bin/bash

# runs with username rstudio
docker run -p 8787:8787 -d \
--mount type=bind,source="$(pwd)",destination=/home/rstudio/working \
-e PASSWORD=secretPassword -e ROOT=TRUE \
--name my_container_name \
tsawallis/base-project-r
