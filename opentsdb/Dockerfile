FROM henryhtm/ubuntu-tools:basic
RUN wget -O /tmp/opentsdb.deb --no-check-certificate https://github.com/OpenTSDB/opentsdb/releases/download/v2.3.1/opentsdb-2.3.1_all.deb && wget -O /tmp/hbase.tar.gz http://mirrors.hust.edu.cn/apache/hbase/2.1.0/hbase-2.1.0-bin.tar.gz \
    && tar -xvf /tmp/hbase.tar.gz -C /mnt/ \
    && for hb in `find /mnt/ -maxdepth 1 -name "hbase*"` ; do mv $hb /usr/local/hbase ; done \
    && rm /usr/local/hbase/docs -rf \
    && dpkg -i /tmp/opentsdb.deb \
    && rm /tmp/opentsdb.deb /tmp/hbase.tar.gz -rf \
    && rm /usr/share/man /usr/share/doc /usr/share/info -rf \
    && rm /usr/lib/gcc  -rf && rm /usr/include -rf

WORKDIR /usr/share/opentsdb/bin
RUN apt-get install -y openjdk-8-jdk \
    && apt-get install -y dh-autoreconf \
    && apt-get install -y gnuplot

ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
ENV PS1="\u@\w\a#"
COPY file/hbase-site.xml /mnt/hbase-site.xml
COPY file/cmd.sh /mnt/cmd.sh
RUN mv /mnt/hbase-site.xml /usr/local/hbase/conf/hbase-site.xml \
    && echo "export HBASE_MANAGES_ZK=true" >> /usr/local/hbase/conf/hbase-env.sh \
    && chmod 777 /mnt/cmd.sh

CMD ["/mnt/cmd.sh"]
