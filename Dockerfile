FROM bitnami/mariadb:10.8.4-debian-11-r5
USER 0
RUN apt update
RUN apt install -y net-tools
RUN apt install -y vim
RUN apt install -y openssh-server
# apache
RUN apt install -y apache2 apache2-utils libexpat1 ssl-cert libapache2-mod-wsgi-py3 w3m
RUN a2enmod ssl && a2enmod wsgi && a2ensite default-ssl
# python 3.9 only ! not python 3.10 not compatible with wsgi
RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
RUN apt install -y python3.9 python3-pip
RUN test -f /usr/bin/python && rm /usr/bin/python || echo ""
RUN ln -s /usr/bin/python3.9 /usr/bin/python
RUN test -f /usr/bin/pip && rm /usr/bin/pip || echo ""
RUN ln -s /usr/bin/pip3 /usr/bin/pip
# libmariadb-dev for python >> mysql
RUN apt install -y libmariadb-dev
RUN apt install -y sqlite3
RUN mkdir -p /django
#RUN chown www-data:www-data /django

