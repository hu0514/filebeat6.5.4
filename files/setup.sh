#!/bin/bash
data_path=/data/filebeat6.5
default_file=/home/filebeat/filebeat.yml
filebeat_path=/usr/local/filebeat

if [ ! -d ${data_path} ];then
	mkdir -p ${data_path}
	cp -a ${default_file} ${data_path}/
	echo "123"
	exec ${filebeat_path}/filebeat -e -c ${filebeat_path}/filebeat.yml
elif [ ! -f ${data_path}/filebeat.yml ];then
	rm -rf ${filebeat_path}/filebeat.yml
	cp -a ${default_file} ${data_path}/
	cp -a ${data_path}/filebeat.yml ${filebeat_path}/filebeat.yml
	chown -R root:root ${filebeat_path}/filebeat.yml
	echo "456"
	exec ${filebeat_path}/filebeat -e -c ${filebeat_path}/filebeat.yml
else
	rm -rf ${filebeat_path}/filebeat.yml
	cp -a ${data_path}/filebeat.yml ${filebeat_path}/filebeat.yml
	chown -R root:root ${filebeat_path}/filebeat.yml
	echo "789"
	exec ${filebeat_path}/filebeat -e -c ${filebeat_path}/filebeat.yml
fi


