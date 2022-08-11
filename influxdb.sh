#!/bin/bash
sudo mkdir /var/lib/grafana
sudo mv influx.repo /etc/yum.repos.d/influx.repo
sudo yum install influxdb -y && sudo yum install telegraf -y
sudo systemctl enable influxdb
sudo systemctl start influxdb
sudo systemctl enable telegraf.service
sudo systemctl start telegraf.service
sudo mv telegraf.conf /etc/telegraf/telegraf.conf
sudo yum update -y && sudo amazon-linux-extras install docker -y
sudo sudo service docker start && sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock
sudo systemctl restart telegraf && sudo systemctl restart influx
