FROM alpine

LABEL key="Richard Domanik Clarkson" key2="richarddomanikclarkson@gmail.com" 

RUN apk update && apk add apache2 php php-apache2 openrc tar

ADD ./start.sh /start.sh

ADD https://gist.githubusercontent.com/SyntaxC4/5648247/raw/94277156638f9c309f2e36e19bff378ba7364907/info.php /var/www/localhost/htdocs/index.php

RUN adduser -S -u 82 -D www-data www-data

RUN chown -R www-data:www-data /var/www && chmod -R 755 /var/www/ && chmod 755 /start.sh

EXPOSE 80

CMD /start.sh