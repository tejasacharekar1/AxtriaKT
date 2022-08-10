#!/bin/bash
mv -rvf influx.repo /etc/yum.repos.d/influx.repo
yum install influxdb -y && yum install telegraf -y
systemctl enable influxdb
systemctl start influxdb
systemctl enable telegraf.service
systemctl start telegraf.service
mv -rvf telegraf.conf /etc/telegraf/telegraf.conf
systemctl restart telegraf && systemctl restart influx

