# syntax=docker/dockerfile:1

FROM jupyter/minimal-notebook:lab-3.5.0

ARG NB_USER=jovyan
ARG NB_UID=1000

# run as root
USER root

# install zeromq - required for ijavascript to communicate with jupyter
RUN apt-get update
RUN apt-get install -y gcc g++ make curl cmake
#RUN apt-get install -yq --no-install-recommends libzmq3-dev
RUN apt-get install -y libzmq3-dev
RUN apt-get clean

# install ijavascript
RUN npm install -g --unsafe-perm ijavascript

# install tslab
# RUN npm install -g tslab@latest

# install ijsinstall no longer needed
RUN ijsinstall

COPY package.json "/home/${NB_USER}/work/package.json"
COPY package-lock.json "/home/${NB_USER}/work/package-lock.json"

COPY img "/home/${NB_USER}/work/img"
COPY example.ipynb "/home/${NB_USER}/work/"

RUN chown -R "${NB_USER}" "/home/${NB_USER}/work"
RUN chown -R "${NB_USER}" "/home/${NB_USER}/.local"


# run as jovyan user
# see https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html for more

USER "${NB_USER}"

WORKDIR "/home/${NB_USER}/work"

RUN npm install

# added in path per https://discourse.jupyter.org/t/custom-docker-image-spawn-fails-on-mybinder-org/16448/5
ENV PATH="${HOME}/.local/bin:${PATH}"
