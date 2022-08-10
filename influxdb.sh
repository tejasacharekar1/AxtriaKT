#!/bin/bash/sudo bash
mv influx.repo /etc/yum.repos.d/influx.repo
yum install influxdb -y && yum install telegraf -y
systemctl enable influxdb
systemctl start influxdb
systemctl enable telegraf.service
systemctl start telegraf.service
mv telegraf.conf /etc/telegraf/telegraf.conf
chmod 666 /var/run/docker.sock
systemctl restart telegraf && systemctl restart influx

