FROM henryhtm/ubuntu-tools:basic

RUN  debconf-set-selections <<< "mysql-server mysql-server/root_password password YOURPASSWD"
RUN  debconf-set-selections <<< "mysql-server mysql-server/root_password_again password YOURPASSWD"
RUN  apt-get install -y mysql-server mysql-client libmysqlclient-dev
COPY file/cmd.sh /mnt/cmd.sh
RUN  chmod +x /mnt/cmd.sh
CMD  ["/mnt/cmd.sh"]

