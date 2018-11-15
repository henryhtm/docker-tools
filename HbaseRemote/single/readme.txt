单机版本的HBASE安装很简单：
一、准备一个ubuntu16.04的系统；

二、下载安装OPENJDK和HBASE：
  wget -O /tmp/hbase.tar.gz http://mirrors.hust.edu.cn/apache/hbase/2.0.2/hbase-2.0.2-bin.tar.gz && tar -xvf /tmp/hbase.tar.gz -C /mnt/
  for hb in `find /mnt/ -maxdepth 1 -name "hbase*"` ; do mv $hb /usr/local/hbase ; done && rm /usr/local/hbase/docs -rf && rm /tmp/hbase.tar.gz -rf
  export PATH="/usr/local/hbase/bin:"$PATH
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
  apt-get update && apt-get install -y openjdk-8-jdk
  mkdir /mnt/hbase-dir && chmod 777 /mnt/* -R && chmod 777 /usr/local/hbase -R
  
三、修改hbase-site.xml内容如下：
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
<property>
<name>hbase.rootdir</name>
<value>file:///mnt/hbase-dir/hbase</value>
</property>
<property>
<name>hbase.tmp.dir</name>
<value>/mnt/hbase-dir/hbase-tmp/</value>
</property>
<property>
<name>hbase.zookeeper.property.clientPort</name>
<value>2181</value>
</property>
<property>
<name>hbase.zoopkeeper.property.dataDir</name>
<value>/mnt/hbase-dir/zookeeper/</value>
</property>
<property>
<name>zookeeper.session.timeout</name>
<value>60000000</value>
</property>
</configuration>

四、 修改hbase-env.sh，在其中加上如下内容：
export HBASE_MANAGES_ZK=true
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64

五、最重要的一步：在/etc/hosts文件中添加本机主机名及IP对应信息，并一定删除localhost一行，否则不能外网连接！！！！

