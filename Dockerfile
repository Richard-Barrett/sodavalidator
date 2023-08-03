####################
#    BASE IMAGE    #
####################
FROM python:3.11.4-slim-bullseye as base

# LABEL about the custom image
LABEL maintainer="richard-barrett@outlook.com"
LABEL version="$(git tag --sort=committerdate | tail -1)"
LABEL company="irhythm"
LABEL description="This is custom Docker Image for OpenSource Soda Core Usage against SQL Deployments."

# Image ARGS
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt-get update -y

# Install Base Dependencies
RUN apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    tree \
    tar \
    openssl \
    make \
    build-essential \
    git \
    zip \
    vim \
    nano \
    unzip \
    wget \
    apt-transport-https \
    build-essential \ 
    libssl-dev \ 
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \ 
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev

RUN curl https://pyenv.run | bash

######################################
#      Sodavalidator IMAGE     #
######################################
FROM base as sodavalidator

# TODO: NEED TO ADD A USER SIMILAR TO THE FOLLOWING UBUNTU BLOCK
RUN groupadd -g 1001 python && \
    useradd -u 1001 -g python python

ENV PIP_ROOT_USER_ACTION=ignore
ENV PYTHON_CONFIGURE_OPTS --enable-shared
ENV LC_ALL C.UTF-8

# TODO: SETUP SUDO GROUP
# TODO: SET UP SODAVALIDATOR GROUP AND USER AND ADD TO SUDO

# Set Up Python Virtual Environment for Soda
# Documentation: https://docs.soda.io/soda-library/install.html#install
COPY . /sodavalidator
WORKDIR /sodavalidator

RUN /usr/local/bin/python -m pip install --upgrade pip

RUN export PATH="${PATH}:"$(pyenv root)/shims

RUN /usr/local/bin/python -m pip install -i https://pypi.cloud.soda.io -r requirements.txt

USER python

# USAGE Documentation: https://docs.soda.io/soda-library/run-a-scan.html
ENTRYPOINT ["soda"]