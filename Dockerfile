#base image
FROM centos

RUN	\cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& yum install -y  wget vim \
	&& cd /mnt \
	&& wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.5.4-linux-x86_64.tar.gz \
	&& tar zxf filebeat-6.5.4-linux-x86_64.tar.gz  \
	&& mv filebeat-6.5.4-linux-x86_64 /usr/local/filebeat \
	&& groupadd filebeat \
	&& useradd -g filebeat filebeat \
	&& cp -a /usr/local/filebeat/filebeat.yml /home/filebeat/ \
	&& yum clean all \
	&& rm -rf /mnt/*
ADD ./files/setup.sh /tmp/setup.sh
RUN chmod 755 /tmp/setup.sh

ENTRYPOINT ["/tmp/setup.sh"]
