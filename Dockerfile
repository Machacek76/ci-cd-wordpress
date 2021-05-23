# which image to use
FROM ubuntu:latest

# create work dir and add content to it
WORKDIR /mm

# install composer and git
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y php7.4-amqp && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    apt-get -y install php7.4-cli php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath &&\
    apt-get -y install phpunit && \

    curl -sS https://getcomposer.org/installer -o composer-setup.php
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*


