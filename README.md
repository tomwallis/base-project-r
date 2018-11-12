# base-project-r
A repo for a base docker configuration for my academic projects in R.

The primary things this container allows are

- the tidyverse (`dplyr`, `ggplot2`, etc)
- generation of rmarkdown documents and knitting to pdf.
- fitting and analysing Stan models with `brms`.

Typical run command:

`docker run -d -p 8787:8787 -v "`pwd`":/home/rstudio/working -e USER=yourName -e PASSWORD=secretPassword -e ROOT=TRUE tsawallis/base-project-r`


## Steps to get here

The readme documents the steps I took to set up my docker environment to run both locally (macbook) and to deploy containers to our cluster nodes.


## Resources

### Useful notes

- when building a local image for testing, make sure to add a name and tag: `docker build my-local-container -t base-project-docker:test` then run with `docker run -i -t base-project-docker:test`

```
docker container ls                                # List all running containers
docker container ls -a             # List all containers, even those not running
docker container stop <hash>           # Gracefully stop the specified container
docker container kill <hash>         # Force shutdown of the specified container
docker container rm <hash>        # Remove specified container from this machine
docker container rm $(docker container ls -a -q)         # Remove all containers
docker image ls -a                             # List all images on this machine
docker image rm <image id>            # Remove specified image from this machine
docker image rm $(docker image ls -a -q)   # Remove all images from this machine
```

### Glossary

- A container is launched by running an image.
- An *image* is an executable package that includes everything needed to run an application--the code, a runtime, libraries, environment variables, and configuration files.
- A *container* is a runtime instance of an image--what the image becomes in memory when executed (that is, an image with state, or a user process). You can see a list of your running containers with the command, docker ps, just as you would in Linux.
- A *Dockerfile* defines what goes on in the environment inside your container. Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.
- The Docker *client* (docker) is the primary way that many Docker users interact with Docker. When you use commands such as `docker run`, the client sends these commands to `dockerd`, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.
- The Docker *daemon* (`dockerd`) listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.
- A Docker `registry` stores Docker images.

### Tutorials

[Conducting reproducible research with Docker](http://www.derekmpowell.com/posts/2018/02/docker-tutorial-1/). Great three-part tutorial by [Derek Powell](http://www.derekmpowell.com).

Note: the "Create Automated Build" step is now done via a dropdown in the menu on Docker Hub, and I've removed the setting of the username from the run command because that interfered with file permissions, stopping writing to the mounted container on OSX.

[R Docker tutorial](https://ropenscilabs.github.io/r-docker-tutorial/)
