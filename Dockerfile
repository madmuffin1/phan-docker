FROM coderstephen/php7

RUN git clone https://github.com/nikic/php-ast.git && \
    cd php-ast && \
    phpize && \
    ./configure && \
    make install

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD composer.json /usr/local/composer/
RUN echo extension=ast.so >> /usr/local/php70/php.ini && composer global install

VOLUME ["/data"]
CMD /usr/local/composer/vendor/rlerdorf/phan/phan $(find /data/ -iname \*.php | xargs echo) 
