FROM mod_mruby:base

ADD rewrite.rb /var/www/rewrite.rb
ADD index.html /var/www/html/basic/
ADD rewrite.html /var/www/html/rewrite/index.html
ADD filter.html /var/www/html/cache_control/index.html
ADD normalize.css /var/www/html/cache_control/normalize.css
ADD authn_basic.rb /var/www/authn_basic.rb
ADD cache_control.rb /var/www/cache_control.rb

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND
