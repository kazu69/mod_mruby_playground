FROM mod_mruby:base

ADD hook/ /var/www/
ADD html /var/www/html/

EXPOSE 80

CMD ['/usr/sbin/apache2', '-D', 'FOREGROUND']
