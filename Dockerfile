# which image to use
FROM ubuntu:20.04

# create work dir and add content to it
WORKDIR /app

RUN apk update 
RUN apk add

# install composer and git
RUN apt-get update
RUN apt-get update --fix-missing

RUN apt-get -y install \
    curl \ 
    wget \
    rsync \
    apt-get -y install \
    php7.4-cli \
    php7.4-amq \
    php7.4-json \
    php7.4-common \
    php7.4-mysql \
    php7.4-zip \
    php7.4-gd \
    php7.4-mbstring \
    php7.4-curl \
    php7.4-xml \
    php7.4-bcmath \
    php7.4-redis \
    php7.4-iconv

RUN apt-get -y install phpunit
RUN apt-get -y install openssh-server

RUN apt-get -y install npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install nodejs -y

# RUN npm install --global --unsafe-perm @vue/cli-service
# RUN npm install --global --unsafe-perm @babel/core
# RUN PATH=./node_modules/.bin:$PATH

RUN apt-get -y install openssh-client
RUN apt-get -y install zip unzip

RUN apt-get -y autoremove
RUN apt-get -y clean 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN eval `ssh-agent -s`
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /tmp/*
