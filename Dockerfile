#Install Ubuntu 16.04
FROM ubuntu:16.04

MAINTAINER Vishnu Ratheesh <vishnu.ratheesh@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y

# Install latest pre-requisite apt-ware.
RUN apt-get install -y vim php-curl python python-dev python-pip python-virtualenv python-software-properties curl software-properties-common

# Install Python3.6
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt update
RUN apt-get install python3.6
# Set Python3.6 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash
RUN apt-get install -y nodejs

# Install Yarn.
RUN npm install -g yarnpkg

# Cleanup.
RUN rm -rf /var/lib/apt/lists/*

# Define working directory.
RUN mkdir /application

# Define working directory.
WORKDIR /application

# Define default command.
CMD ["bash"]

# Comment
RUN echo 'Created a container with Python 3, ready to install requirements from /application/requirements.txt requirements file + Node + Yarn.'
