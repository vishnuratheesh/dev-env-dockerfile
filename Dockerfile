#Install Ubuntu 16.04
FROM ubuntu:16.04

MAINTAINER Vishnu Ratheesh <vishnu.ratheesh@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y

# Install latest Python 3 and Node.
RUN \
  apt-get update && \
  apt-get upgrade && \
  apt-get install -y vim php-curl python python-dev python-pip python-virtualenv python-software-properties nodejs curl && \
  rm -rf /var/lib/apt/lists/*

# Install Yarn.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

# Define working directory.
RUN mkdir /application

# Define working directory.
WORKDIR /application

# Define default command.
CMD ["bash"]

# Comment
RUN echo 'Created a container with Python 3 and ready to install requirements from /application/requirements.txt requirements file.'
