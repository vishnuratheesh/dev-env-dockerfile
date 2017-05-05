#Install Ubuntu 16.04
FROM ubuntu:16.04

MAINTAINER Vishnu Ratheesh <vishnu.ratheesh@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y

# Install latest Python 3 and Node.
RUN \
  apt-get install -y vim php-curl python python-dev python-pip python-virtualenv python-software-properties curl && \
  rm -rf /var/lib/apt/lists/*

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash
RUN apt-get install -y nodejs

# Install Yarn.
RUN npm install -g yarnpkg

# Define working directory.
RUN mkdir /application

# Define working directory.
WORKDIR /application

# Define default command.
CMD ["bash"]

# Comment
RUN echo 'Created a container with Python 3 and ready to install requirements from /application/requirements.txt requirements file.'
