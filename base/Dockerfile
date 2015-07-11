FROM ubuntu
MAINTAINER kazu69 <kazu.69.web+docker@gmail.com>

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -y sudo git wget curl gcc make bison libssl-dev libaprutil1-dev ruby2.2 apache2 apache2-dev

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APXS_PATH_ENV --with-apxs=/usr/bin/apxs2
ENV APACHECTL_PATH_ENV --with-apachectl=/usr/sbin/apache2ctl
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

WORKDIR /usr/local/src/

RUN git clone git://github.com/matsumoto-r/mod_mruby.git

WORKDIR /usr/local/src/mod_mruby

RUN cp -p build_config.rb build_config.rb.org

RUN sh ./build.sh
RUN make install

# /etc/apache2/mods-enabled/　　ロードスクリプトへのリンク
# /etc/apache2/mods-available/　各モジュールの(ロード用)スクリプト本体

RUN cp -p /etc/apache2/mods-available/mruby.load /etc/apache2/mods-available/mruby.load.org

ONBUILD ADD conf/mruby.conf /etc/apache2/mods-available/mruby.conf
ONBUILD ADD build_config.rb /usr/local/src/build_config.rb
ONBUILD RUN cd /etc/apache2/mods-enabled && ln -s ../mods-available/mruby.conf mruby.conf
