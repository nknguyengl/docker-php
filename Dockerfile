# Set our base image
FROM serversideup/php:8.2-fpm-nginx

# Dependencies
RUN apt-get update; \
    apt-get install -y zlib1g-dev php-dev

# Install gRPC and Protobuf
RUN pecl install grpc && echo "extension=grpc.so" >> /etc/php/8.2/cli/php.ini; \
    pecl install protobuf && echo "extension=protobuf.so" >> /etc/php/8.2/cli/php.ini

# Clean up
RUN apt-get clean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \
