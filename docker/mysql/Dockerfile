FROM mysql:5.7.30
COPY ./mysql.cnf /etc/mysql/conf.d/
COPY ./mysqld.cnf /etc/mysql/mysql.conf.d/
COPY ./docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/
