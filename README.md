<p align="center">
    <a href="https://jupyter-ijavascript-utils.onrender.com/" alt="Documentation">
        <img src="https://img.shields.io/badge/Documentation-here-informational" />
    </a>
    <a href="https://jupyter-ijavascript-utils.onrender.com/LICENSE" alt="License">
        <img src="https://img.shields.io/badge/License-MIT-green" />
    </a>
    <img src="https://img.shields.io/badge/Coverage-98-green" />
    <a href="https://github.com/paulroth3d/jupyter-ijavascript-utils" alt="npm">
        <img src="https://img.shields.io/badge/npm-%5E1.15-red" />
    </a>
    <a href="https://mybinder.org/v2/gh/paulroth3d/jupyter-ijavascript-utils/main" alt="Launch Binder">
		<img src="https://mybinder.org/badge_logo.svg" />
    </a>
</p>

# Overview

Docker image that works within MyBinder

# Running the docker image

```
docker run -it --rm -p 8888:8888 darkbluestudios/jupyter-ijavascript-utils:latest
```

# MyBinder

MyBinder has very specific requirements for any Dockerfile to work, all listed here:

https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html

Such as:

* must use a specific tag, not use `:latest`
* must setup a user and have a user id of `1000`
* must copy the contents to `$HOME` and change permissions

Note that the current image that is on docker: [datainpoint/ijavascript-notebook](https://hub.docker.com/r/datainpoint/ijavascript-notebook)

(You can [see the Dockerfile here](https://hub.docker.com/r/datainpoint/ijavascript-notebook/Dockerfile)
, by adding in `/Dockerfile` to the end of the url)

has a few problems:

* it hard codes jovyan user - mybinder passes a specific user over instead
* it doesn't specify the platform as `linux/amd64` - which is now used by mybinder
* it doesn't give much room for adding in other npm packages to install.
* it uses a two year old version of jupyterlab, and I could not make zeromq compile once updated.

## Reviewing DockerHub Dockerfiles

As mentioned before, you can see the Dockerfile for any image on Dockerhub by adding in `/Dockerfile` to the end of an image)

* ex: https://hub.docker.com/r/datainpoint/ijavascript-notebook
* becomes: https://hub.docker.com/r/datainpoint/ijavascript-notebook/Dockerfile

we see that this uses the [jupyter/minimal-notebook](https://hub.docker.com/r/jupyter/minimal-notebook) - [Dockerfile](https://hub.docker.com/r/jupyter/minimal-notebook/Dockerfile)

and that in turn uses the: [jupyter/base-notebook](https://hub.docker.com/r/jupyter/base-notebook) - [Dockerfile](https://hub.docker.com/r/jupyter/base-notebook/Dockerfile)

which in turn uses [Ubuntu:focal-20200703](https://hub.docker.com/_/ubuntu) as its base.


## Jupyter Docker ReadTheDocs

The Jupyter minimal notebook has a couple great things in it
https://hub.docker.com/r/jupyter/minimal-notebook

with the documentation here:
https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html

Saying how you can run the docker image and reference the current folder as a volume.

(Allowing you to run them as you'd like)

`docker run -it --rm -p 10000:8888 -v "${PWD}":/home/jovyan/work darkbluestudios/jupyter-ijavascript-utils`
